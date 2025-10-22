{config, lib, ... }:

with lib;

{
  config = mkIf (config.programs.dewm.desktop == "none") {
    services.xserver.enable = false;
  };  
}
