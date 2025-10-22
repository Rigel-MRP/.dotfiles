{ pkgs, config, lib, ... }:

{
  config = lib.mkIf config.programs.cliMod.git {
    programs.git = {
      enable = true;
      package = pkgs.git;
      userName = "Rigel-MRP";
      userEmail = "git@nullsun.net";
      extraConfig = {
        core.editor = "nvim";
        init.defaultBranch = "main";
      };
    };
  };  
}
