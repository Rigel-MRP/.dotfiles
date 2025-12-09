{config, lib, ... }:

with lib;

{
	config = mkIf (config.custom.dewm.desktop == "none") {
		services.xserver.enable = false;
	};  
}
