{ config, lib, pkgs, ... }:

{
	imports = [
		./modules/cli/default.nix
		./modules/librewolf/librewolf.nix
		./modules/stylix/stylix.nix
		./modules/xdg/xdg.nix
	];
	
	custom = {
		cli = {
			enable = true;
			aliases = true;
			fastfetch = true;
			git = true;
			nh = true;
			nvim = true;
			zsh = true;
		};
		LibreWolf.enable = true;
		xdg.enable = true;
	};

	fonts.fontconfig.enable = true;

	home = {

		username = "mrp";
		homeDirectory = "/home/mrp";
		
		sessionVariables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
		};

		sessionPath = [ "$HOME/.local/bin" ];

		packages = with pkgs; [
		base16-schemes
		btop
		kitty
		nerd-fonts.jetbrains-mono
		obs-studio
		ripgrep
		];

		stateVersion = "25.05";
	};

	programs.bash.enable = true;
}

