{ pkgs, config, lib, ... }:

{
  config = lib.mkIf config.programs.cliMod.git {
    programs.git = {
      enable = true;
      package = pkgs.git;
      settings = {
        core.editor = "nvim";
        init.defaultBranch = "main";
        user = {
	  name = "Rigel-MRP";
          email = "git@nullsun.net";
	};  
      };
    };
  };  
}
