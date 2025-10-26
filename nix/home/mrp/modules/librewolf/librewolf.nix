{ config, lib, ... }:

{  
  options.programs.LibreWolfMod = {
    enable = lib.mkEnableOption "librewolf module";
  };

  config = lib.mkIf config.programs.LibreWolfMod.enable {
    programs.librewolf = {
	    enable = true;
  	};
	};	
}
