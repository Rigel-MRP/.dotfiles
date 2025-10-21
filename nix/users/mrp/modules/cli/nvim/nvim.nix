{ config, lib, ... }:

{
  config = lib.mkIf config.programs.cliMod.nvim {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
      extraConfig = ''
        set number
        set relativenumber
      '';
    };
  };  
}
