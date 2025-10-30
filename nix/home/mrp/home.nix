{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/cli/default.nix
		./modules/librewolf/librewolf.nix
		./modules/stylix/stylix.nix
    ./modules/xdg/xdg.nix
  ];
  
  programs = {
    cliMod = {
      enable = true;
      aliases = true;
      fastfetch = true;
      git = true;
      nh = true;
      nvim = true;
      zsh = true;
    };
		LibreWolfMod.enable = true;
    xdgMod.enable = true;
  };

  fonts.fontconfig.enable = true;

  home = {

    username = "mrp";
    homeDirectory = "/home/mrp";
    
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    packages = with pkgs; [
		base16-schemes
		btop
    kitty
    nerd-fonts.jetbrains-mono
    ];

    stateVersion = "25.05";
  };

  programs.bash.enable = true;
}

