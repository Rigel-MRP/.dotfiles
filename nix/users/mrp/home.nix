{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/cli/default.nix
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
      xdg = true;
      zsh = true;
    };
    xdgMod.enable = true;
  };

  fonts.fontconfig.enable = true;

  home = {

    username = "mrp";
    homeDirectory = "/home/mrp";

    stateVersion = "25.05";
    packages = with pkgs; [
    kitty
    nerd-fonts.jetbrains-mono
    ];
  };

  programs.bash.enable = true;
}

