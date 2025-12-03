 { config, lib, ... }: 

{
		config = lib.mkIf config.custom.cli.nvim {
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

			autoCmd = [
				{
					event = "VimEnter";
					pattern = "*";
					command = "if argc() == 0 | exe 'Explore' | endif";
					nested = true;
				}
			];
		};
  };  

	imports = [
		./plugins/harpoon.nix
		./plugins/telescope.nix
		./plugins/vim-be-good.nix
	];	
}
