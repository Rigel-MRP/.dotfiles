{ config, lib, ... }:

{
		config = lib.mkIf config.custom.cli.nh {
    programs.nh = {
      enable = true;
      flake = "/home/mrp/.dotfiles/nix/";
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--delete-older-than 7d";
      };
    };
  };  
}
