{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
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
	  modules = [ ./home/mrp/home.nix ];
	};
      };
      nixosConfigurations.T490 = nixpkgs.lib.nixosSystem {
        modules = [
          { nix.settings.experimental-features = ["nix-command" "flakes"]; }
          ./hosts/T490.nix
        ];
      };
    };
}
