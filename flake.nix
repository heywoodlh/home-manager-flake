{
  description = "boilerplate nix flake for home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nur, flake-utils, ... }: 
  flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      packages.homeConfigurations = {
        # This will create a Home-Manager configuration for a user named "heywoodlh"
        heywoodlh = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./roles/vim.nix
            ./roles/vscode.nix
            ./roles/firefox.nix 
            {
              home = {
                username = "heywoodlh";
                homeDirectory = "/home/heywoodlh";
              };
              home.stateVersion = "22.11";
              fonts.fontconfig.enable = true;
              # Override Firefox package if on ARM64 MacOS
              # Assumes Firefox installed via Brew or other method
              programs.firefox.package = if "${system}" == "aarch64-darwin" then
                pkgs.runCommand "firefox-0.0.0" { } "mkdir $out"
              else
                pkgs.firefox;
            }
          ];
          extraSpecialArgs = inputs;
        };
      }; 
    }
  );
}
