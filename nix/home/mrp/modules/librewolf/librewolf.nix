{ config, lib, ... }:

{  
  options.custom.LibreWolf = {
    enable = lib.mkEnableOption "librewolf module";
  };

  config = lib.mkIf config.custom.LibreWolf.enable {
    programs.librewolf = {
	    enable = true;
  	};
	};	
}
