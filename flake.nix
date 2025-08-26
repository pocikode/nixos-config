{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvchad-starter = {
      url = "github:pocikode/nvim";
      flake = false;
    };

    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvchad-starter.follows = "nvchad-starter";
    };

    python38.url = "github:nixos/nixpkgs/83162ab3b97d0e13b08e28938133381a7515c1e3";
    go_1_19.url = "github:nixos/nixpkgs/160b762eda6d139ac10ae081f8f78d640dd523eb";
    go_1_22.url = "github:nixos/nixpkgs/9a9dae8f6319600fa9aebde37f340975cab4b8c0";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      forSystems =
        f:
        nixpkgs.lib.genAttrs ([
          "x86_64-linux"
          "aarch64-darwin"
        ]) f;

      pkgs = nixpkgs.legacyPackages.${system};

      systemSettings = rec {
        hostname = "pocikode";
        timezone = "Asia/Jakarta";
      };

      userSettings = rec {
        username = "agus";
        name = "Agus Supriyatna";
        email = "aguzsupriyatna7@gmail.com";
        theme = "tokyo-night-storm";
        useGnome = true;
        usePlasma = false;
        useHyprland = false;
      };

      devshell =
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          python38 = inputs.python38.legacyPackages.${system};
          go_1_19 = inputs.go_1_19.legacyPackages.${system};
          go_1_22 = inputs.go_1_22.legacyPackages.${system};
          devShellSrc = import ./modules/devshell.nix {
            inherit
              pkgs
              python38
              go_1_19
              go_1_22
              ;
          };
        in
        {
          default = devShellSrc.default;
          python38 = devShellSrc.python38;
          go_1_19 = devShellSrc.go_1_19;
          go_1_22 = devShellSrc.go_1_22;
          go_1_24 = devShellSrc.go_1_24;
        };
    in
    {
      devShells = forSystems devshell;

      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = inputs // {
            inherit systemSettings userSettings;
          };
          modules = [
            ./hosts/workstation
            ./modules/nixos
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
            {

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${userSettings.username}" = ./hosts/workstation/home.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs systemSettings userSettings;
              };
            }
          ];
        };

        qemu = nixpkgs.lib.nixosSystem {
          specialArgs = inputs // {
            inherit systemSettings userSettings;
          };
          modules = [
            ./hosts/qemu
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
            {

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${userSettings.username}" = ./hosts/qemu/home.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs systemSettings userSettings;
              };
            }
          ];
        };
      };

      homeConfigurations = {
        default = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            inputs.stylix.homeModules.stylix
            ./hosts/workstation/home.nix
            ./modules/home-manager
          ];
          extraSpecialArgs = {
            inherit inputs systemSettings userSettings;
          };
        };
      };
    };
}
