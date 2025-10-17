{ lib, pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home = {

    username = "mrp";
    homeDirectory = "/home/mrp";

    stateVersion = "25.05";
    packages = with pkgs; [
    kitty
    nerd-fonts.jetbrains-mono
    ];
  };
  
  programs.git = {
    enable = true;
    userName = "Rigel-MRP";
    userEmail = "git@nullsun.net";
    extraConfig = {
      core.editor = "nvim";
      init.defaultBranch = "main";
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    extraConfig = ''
      set number
      set relativenumber
    '';
  };

  programs.bash.enable = true;
  programs.zsh.enable = true;

  home.shellAliases = {
    ls = "ls --color";
    ll = "ls -lah --color";
    la = "ls -a --color";
    svi = "sudo nvim";
    ff = "fastfetch";

    e = "exit";
    clr = "clear";

    df = "df -h";
    free = "free -h";

    "..." = "../..";
    "...." = "../../..";

    nrs = "sudo nixos-rebuild switch --flake /home/mrp/.dotfiles/nix";
    power = ''echo "$(cat /sys/class/power_supply/BAT0/status): $(cat /sys/class/power_supply/BAT0/capacity)%"'';
  };
}

