{config, lib, ... }:

with lib;

{
  options.programs.keyboard = {
    enable = mkEnableOption "enable keyboard";
    layout = mkOption {
      type = types.enum [ "abnt2" "anci" "ibm" ];
      default = "abnt2";
      description = "keyboard layout to use (abnt2, anci, or ibm).";
    };
  };

  config = mkIf config.programs.keyboard.enable {
    services.xserver.xkb = {
      layout = if config.programs.keyboard.layout == "anci" then "us" else "br";
      variant = if config.programs.keyboard.layout == "ibm" then "thinkpad" else "";
    };

    console.keyMap = if config.programs.keyboard.layout == "anci" then "us" else "br-abnt2";
  };
}
