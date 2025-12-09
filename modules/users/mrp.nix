{pkgs, config, lib, ...}:

{
	users.users.mrp = {
		isNormalUser = true;
		description = "mrp";
		ignoreShellProgramCheck = true;
		shell = pkgs.zsh;
		extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
	};
}
