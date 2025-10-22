{config, lib, ... }:

with lib;

{
  options.programs.dewm = {
    enable = mkEnableOption "enables DE/WM manager module";
    desktop = mkOption {
      type = types.enum [ "none" "cosmic" ];
      default = "none";
      description = "select the graphical environment to be used";
    };
  };

  imports = [
    ./cosmic.nix
    ./none.nix
  ];
}
