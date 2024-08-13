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

        impermanence.url = "github:nix-community/impermanence";
    lanzaboote.url = "github:nix-community/lanzaboote";

    nixgl.url = "github:nix-community/nixGL";
    stylix.url = "github:danth/stylix";
    catppuccin.url = "github:catppuccin/nix";
    nix-index-database.url = "github:nix-community/nix-index-database";

    nixos-anywhere = {
      url = "github:numtide/nixos-anywhere";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.disko.follows = "disko";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    comma = {
      url = "github:nix-community/comma";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprcursor = {
      url = "github:hyprwm/Hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pyprland = {
      url = "github:hyprland-community/pyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-git.url = "github:hyprwm/hyprland";
    hyprland-xdph-git.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    hyprland-protocols-git.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    hyprland-nix.url = "github:spikespaz/hyprland-nix";
    hyprland-nix.inputs = {
      hyprland.follows = "hyprland-git";
      hyprland-xdph.follows = "hyprland-xdph-git";
      hyprland-protocols.follows = "hyprland-protocols-git";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    attic = {
      url = "github:zhaofengli/attic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    zjstatus = {
      url = "github:dj95/zjstatus";
    };

    gx-nvim = {
      url = "github:chrishrb/gx.nvim";
      flake = false;
    };
    maximize-nvim = {
      url = "github:declancm/maximize.nvim";
      flake = false;
    };
    advanced-git-search-nvim = {
      url = "github:aaronhallaert/advanced-git-search.nvim";
      flake = false;
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
	stylix.nixosModules.stylix
	disko.nixosModules.disko
	sops-nix.nixosModules.sops
	lanzaboote.nixosModules.lanzaboote
        impermanence.nixosModules.impermanence

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
