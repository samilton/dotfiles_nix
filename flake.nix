{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

   home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };


    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
    inherit inputs;
    src = ./.;

    snowfall = {
    	metadata = "nixicle";
	namespace = "nixicle";
	meta = {
	  name = "nixicle";
	  title = "Sam's Nix Flake";

	};
    };

      systems.modules.nixos = with inputs; [
        home-manager.nixosModules.home-manager
	disko.nixosModules.disko
	sops-nix.nixosModules.sops
      ];

      systems.modules.muaddib.modules = with inputs; [
        nixos-hardware.nixosModules.framework-13-7040-amd
      ];

      # Add modules to all homes.
      homes.modules = with inputs; [
	# my-input.homeModules.my-module
      ];

      # Add modules to a specific home.
      homes.users."sam@muaddib".modules = with inputs; [
	# my-input.homeModules.my-module
      ];

   };
}
