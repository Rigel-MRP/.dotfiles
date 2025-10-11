{ config, pkgs, ... }:

{

  services.xserver.enable = false;

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic = {
    enable = true;
    xwayland.enable = true;
  };




}
