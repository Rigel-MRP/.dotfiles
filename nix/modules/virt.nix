{ config, pkgs, lib, ... }:

with lib;

{
	options.custom.virt = {
		enable = mkEnableOption "enable KVM/QEMU virtualization with libvirt";
		gui = mkOption {
			type = types.bool;
			default = false;
			description = "enable virt-manager GUI";
		};
	};	

	config = mkIf config.custom.virt.enable {
		virtualisation.libvirtd = {
			enable = true;
			onBoot = "start";
			onShutdown = "suspend";	
			qemu = {
				runAsRoot = false;
				swtpm.enable = true;
			};
		};	

		environment.systemPackages = with pkgs; [
			OVMF
			qemu_kvm
			qemu-utils
			quickemu
			swtpm
		] ++ lib.optional config.custom.virt.gui virt-manager;

		boot.kernelModules = [ "kvm-intel" ];
	
		boot.extraModprobeConfig = ''
	      options kvm_intel nested=1
	      options kvm_intel emulate_invalid_guest_state=0
	      options kvm ignore_msrs=1
		'';
	};
}
