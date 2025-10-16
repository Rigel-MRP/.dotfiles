{ lib, pkgs, ... }:
{
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
}
