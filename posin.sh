#!/bin/bash
set -euo pipefail

TIMEZONE="America/Sao_Paulo"
LOCALE="pt_BR.UTF-8"
EFI_DIR="/boot/efi"

if [[ $EUID -ne 0 ]]; then
    echo -e "\e[31m[ERROR] This script must be run as root.\e[0m\n"
    exit 1
fi

echo -e "\e[34m[INFO] Starting system configuration script.\e[0m\n"

echo -e "\e[34m[INFO] Updating system packages...\e[0m\n"
pacman -Syu --noconfirm

echo -e "\e[34m[INFO] Configuring timezone and locale...\e[0m\n"
ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
hwclock --systohc
sed -i "/$LOCALE/s/^#//" /etc/locale.gen
locale-gen

echo -e "\e[34m[INFO] Setting hostname and hosts...\e[0m\n"
echo "LANG=$LOCALE" > /etc/locale.conf
echo "KEYMAP=br-abnt2" > /etc/vconsole.conf

while true; do
    read -p $'\nEnter hostname: ' N_HOSTNAME
    if [[ -z "$N_HOSTNAME" ]]; then
        echo -e "\e[31m[ERROR] Hostname cannot be empty.\e[0m"
    else
        break
    fi
done

while true; do
  if passwd root; then
    echo -e "\e[1;32mRoot password changed successfully.\e[0m\n"
    break
  else
    echo -e "\e[31mFailed to change root password. Try again\e[0m\n"
  fi
done

echo -e "\e[34m[INFO] Installing and configuring Reflector...\e[0m\n"
pacman -S --noconfirm reflector
reflector --country Brazil --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist


echo -e "\e[34m[INFO] Installing essential packages...\e[0m\n"
pacman -S --noconfirm grub grub-btrfs efibootmgr os-prober
pacman -S --noconfirm networkmanager wpa_supplicant inetutils dnsutils avahi nss-mdns openbsd-netcat nfs-utils
pacman -S --noconfirm sudo zsh stow dialog bash-completion fastfetch base-devel
pacman -S --noconfirm dosfstools ntfs-3g rsync fstrim
pacman -S --noconfirm pipewire pipewire-alsa pipewire-pulse pipewire-jack sof-firmware
pacman -S --noconfirm cups hplip
pacman -S --noconfirm acpi acpi_call tlp acpid
pacman -S --noconfirm xdg-user-dirs xdg-utils gvfs gvfs-smb
pacman -S --noconfirm iptables-nft firewalld


# Uncomment the following lines if using specific GPU drivers
# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

echo -e "\e[34m[INFO] Installing GRUB bootloader...\e[0m\n"
if mountpoint -q "$EFI_DIR"; then
    grub-install --target=x86_64-efi --efi-directory=$EFI_DIR --bootloader-id=GRUB || {
    echo -e "\e[31m[ERROR] Failed to install GRUB.\e[0m\n"
    exit 1
    }
else
    echo -e "\e[31m[ERROR] EFI partition is not mounted\e[0m\n"
    exit 1
fi
os-prober || echo -e "\e[33m[WARN] No other OS detected.\e[0m"

echo -e "\e[34m[INFO] Generating GRUB config...\e[0m\n"
sed -i 's/^#\(GRUB_DISABLE_OS_PROBER=false\)/\1/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

echo -e "\e[34m[INFO] Enabling system services...\e[0m\n"
systemctl enable NetworkManager
systemctl enable cups.service
systemctl enable avahi-daemon
systemctl enable tlp
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable firewalld
systemctl enable acpid

echo -e "\e[34m[INFO] Setting Neovim as default vi editor...\e[0m\n"
command -v nvim || pacman -S --noconfirm neovim
ln -sf $(command -v nvim) /usr/bin/vi

while true; do
    read -p $'\nEnter your username: ' N_USER
    if [[ -z "$N_USER" ]]; then
        echo -e "\e[31m[ERROR] Username cannot be empty.\e[0m"
        continue
    fi
    if ! [[ "$N_USER" =~ ^[a-z_][a-z0-9_-]*$ ]]; then
        echo -e "\e[31m[ERROR] Invalid username. Use only lowercase letters, numbers, '-' or '_', and start with a letter.\e[0m"
        continue
    fi
    break
done

echo -e "\e[34m[INFO] Creating user $N_USER...\e[0m\n"
useradd -m -G wheel,audio,video,lp,network $N_USER || {
    echo -e "\e[31m[ERROR] Failed to create user $N_USER.\e[0m"
    exit 1
}

while true; do
  if passwd "$N_USER"; then
    echo -e "\e[1;32m$N_USER password changed successfully.\e[0m\n"
    break
  else
    echo -e "\e[31mFailed to change $N_USER password. Try again\e[0m\n"
  fi
done

ZSH_PATH=$(command -v zsh)
if [[ -z "$ZSH_PATH" ]]; then
    echo -e "\e[31m[ERROR] Zsh not found. Skipping shell change.\e[0m\n"
else
    chsh -s "$ZSH_PATH" "$N_USER"
fi

echo -e "\e[34m[INFO] Adding sudo privileges to $N_USER...\e[0m\n"
echo "$N_USER ALL=(ALL) ALL" > /etc/sudoers.d/$N_USER
chmod 440 /etc/sudoers.d/$N_USER
visudo -cf /etc/sudoers.d/$N_USER

echo -e "\e[34m[INFO] Installing AUR helper (paru) for $N_USER...\e[0m\n"
sudo -u "$N_USER" bash -c '
cd /home/$N_USER
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
rm -rf paru
'

printf "\e[1;32mDone!\e[0m\n"
