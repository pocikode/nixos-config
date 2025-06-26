{
  description = "NixOS config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.nixpkgs.follows = "hyprland";
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
          ];
        };

        legion = nixpkgs.lib.nixosSystem {
          specialArgs = inputs // {
            inherit systemSettings userSettings;
          };
          modules = [
            ./hosts/legion
            ./modules/nixos
          ];
        };

        vbox = nixpkgs.lib.nixosSystem {
          specialArgs = inputs // {
            inherit systemSettings userSettings;
          };
          modules = [
            ./hosts/vbox
            ./modules/nixos
          ];
        };

        qemu = nixpkgs.lib.nixosSystem {
          specialArgs = inputs // {
            inherit systemSettings userSettings;
          };
          modules = [
            ./hosts/qemu
            ./modules/nixos
          ];
        };
      };

      homeConfigurations = {
        default = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            inputs.nvf.homeManagerModules.default
            ./hosts/workstation/home.nix
            ./modules/home-manager
          ];
          extraSpecialArgs = {
            inherit inputs systemSettings userSettings;
          };
        };

        legion = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            inputs.nvf.homeManagerModules.default
            ./hosts/legion/home.nix
            ./modules/home-manager
          ];
          extraSpecialArgs = {
            inherit inputs systemSettings userSettings;
          };
        };

        qemu = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            inputs.nvf.homeManagerModules.default
            ./hosts/qemu/home.nix
            ./modules/home-manager
          ];
          extraSpecialArgs = {
            inherit inputs systemSettings userSettings;
          };
        };
      };
    };
}
