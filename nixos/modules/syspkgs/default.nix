{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  # To search, run:
  # $ nix search package 
  environment.systemPackages = with pkgs; [
    kitty 
    tree
  ];

  programs.nano.enable = false;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

 programs.git = {
  enable = true;
  config = {
    user.name = "Rigel-MRP";
    user.email = "git@nullsun.net";
    init.defaultBranch = "main";
    };
  };

  programs.firefox.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };
}
