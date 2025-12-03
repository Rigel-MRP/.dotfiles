{ pkgs, config, lib, ... }:

{
  config = lib.mkIf config.custom.cli.git {
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
