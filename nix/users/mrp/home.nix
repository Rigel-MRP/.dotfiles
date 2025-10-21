{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules/aliases/aliases.nix
    ./modules/git/git.nix
    ./modules/nh/nh.nix
    ./modules/nvim/nvim.nix
    ./modules/xdg/xdg.nix
    ./modules/zsh/zsh.nix
  ];

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

