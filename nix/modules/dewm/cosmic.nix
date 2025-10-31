{ pkgs, config, lib, ... }:

with lib;

{
  config = mkIf (config.programs.dewm.desktop == "cosmic") {
    services.xserver.enable = false;

    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic = {
      enable = true;
      xwayland.enable = true;
    };

		environment.cosmic.excludePackages = with pkgs; [
			cosmic-term
		];
  };  
}
