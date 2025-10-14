{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: { 

    nixosConfigurations.T490 = nixpkgs.lib.nixosSystem {
      modules = [
        { nix.settings.experimental-features = ["nix-command" "flakes"]; }
        ./configuration.nix
	./modules/dewm/cosmic.nix
	./modules/syspkgs/default.nix
      ];
    };
  };
}
