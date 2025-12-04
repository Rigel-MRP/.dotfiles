{config, lib, ... }:

with lib;

{
	options.custom.keyboard = {
		enable = mkEnableOption "enable keyboard";
		layout = mkOption {
			type = types.enum [ "abnt2" "anci" "ibm" ];
			default = "abnt2";
			description = "keyboard layout to use (abnt2, anci, or ibm).";
		};
	};

	config = mkIf config.custom.keyboard.enable {
		services.xserver.xkb = {
			layout = if config.custom.keyboard.layout == "anci" then "us" else "br";
			variant = if config.custom.keyboard.layout == "ibm" then "thinkpad" else "";
		};

		console.keyMap = if config.custom.keyboard.layout == "anci" then "us" else "br-abnt2";
	};
}
