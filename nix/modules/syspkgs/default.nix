{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    tree
    home-manager
  ];

  programs.nano.enable = false;

  programs.firefox.enable = true;

}
