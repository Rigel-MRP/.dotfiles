 { config, lib, ... }: 

{
	config = lib.mkIf config.programs.cliMod.nvim {
		programs.nixvim = {
			enable = true;
			viAlias = true;
			vimAlias = true;

			globals = {
				mapleader = " ";
				maplocalleader = " ";
			};

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

	imports = [
		./plugins/harpoon.nix
		./plugins/vim-be-good.nix
	];	
}
