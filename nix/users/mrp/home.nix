{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
    ];
  
    username = "mrp";
    homeDirectory = "/home/mrp";

    stateVersion = "25.05";
  };
}
