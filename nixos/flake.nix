{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:  
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

    in {
      homeConfigurations = {
        mrp = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;
	  modules = [ ./users/mrp/home.nix ];
	};
      };
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
