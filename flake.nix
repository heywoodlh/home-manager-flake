{
  description = "boilerplate nix flake for home-manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nur, ... }: 
  let
    system = "x86_64-linux"; # replace this with whatever architecture/kernel you're targeting
    #system = "aarch64-darwin"; # For example, for ARM64 MacOS
    nixpkgsDefaults = {
      config = {
        allowUnfree = true;
      };
    }; 
  in {
    homeConfigurations = {
      # This will create a Home-Manager configuration for a user named "heywoodlh"
      heywoodlh = home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs (nixpkgsDefaults // { system = system; });
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
          }
        ];
        extraSpecialArgs = inputs;
      };

    }; 
  };
}
