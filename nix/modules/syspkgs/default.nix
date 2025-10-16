{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [
    tree
    home-manager
  ];

  programs.nano.enable = false;

 programs.git = {
  enable = true;
  config = {
    user.name = "Rigel-MRP";
    user.email = "git@nullsun.net";
    init.defaultBranch = "main";
    };
  };

  programs.firefox.enable = true;

}
