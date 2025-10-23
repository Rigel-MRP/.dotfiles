 { config, lib, ... }: 

{
  config = lib.mkIf config.programs.cliMod.nvim {
    programs.nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      opts = {
        number = true;
        relativenumber = true;
	tabstop = 2;
	shiftwidth = 2;
	termguicolors = true;
	guicursor = { n-v-c = "block"; };
      };
    };
  };  
}
