{ config, pkgs, lib, ... }:

with lib;

{
	options.virtMod = {
		enable = mkEnableOption "enable KVM/QEMU virtualization with libvirt";
		gui = mkOption {
			type = types.bool;
			default = false;
			description = "enable virt-manager GUI";
		};
	};

	config = mkIf config.virtMod.enable {
		virtualisation.libvirtd = {
			enable = true;
				runAsRoot = false;
				swtpm.enable = true;
			};
		onBoot = "start";
		onShutdown = "suspend";	
		};	

		environment.systemPackages = with pkgs; [
			qemu_kvm
			qemu-utils
			OVMF
			swtpm
		] ++ lib.optional config.virtMod.gui virt-manager;

		boot.kernelModules = [ "kvm-intel" ];
		
		boot.extraModprobeConfig = ''
      options kvm_intel nested=1
      options kvm_intel emulate_invalid_guest_state=0
      options kvm ignore_msrs=1
    '';
	};	
}
