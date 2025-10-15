{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    kitty 
    tree
    home-manager
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
