## What is this repo?

This repository is meant to serve as a boilerplate for someone wanting to get started with using Nix and Home-Manager.

### What is included in this repository?

This repository has a home-manager config for a user named `heywoodlh` defined in `flake.nix`. It comes with the following Home-Manager configuration examples:

- [VSCode config with some plugins and keybindings defined](https://github.com/heywoodlh/home-manager-flake/blob/master/roles/vscode.nix)

- [Basic Vim config with some plugins](https://github.com/heywoodlh/home-manager-flake/blob/master/roles/vim.nix)

- [A Firefox configured for better privacy](https://github.com/heywoodlh/home-manager-flake/blob/master/roles/firefox.nix)

- Testing of the configuration with GitHub Actions (in case you push an invalid configuration change)

## How do I use it?

First, install Nix (the package manager) on MacOS or Linux: https://nixos.org/download.html

Create your own repository using this one as your template. 

Make sure that the `system` variable in `flake.nix` matches your target system (i.e. `x86_64-linux`, `aarch64-linux`, `aarch64-darwin`, `x86-64-darwin`).

Update references to `heywoodlh` to your desired username in `./flake.nix`:

Then, assuming you have `nix` installed, you could run this one-liner to install the config (replace `GITHUB_USERNAME` with your GitHub username and `USERNAME` with your user that you want managed with Home-Manager that is defined in `flake.nix`):

```
nix --extra-experimental-features "nix-command flakes" run github:GITHUB_USERNAME/home-manager-flake#homeConfigurations.USERNAME.activationPackage
```

### Some additional notes for `.github/workflows/ci.yml` (automatic updating and testing):

In `.github/workflows/ci.yml`, update the repository reference and build target to your repository and username.

For example, if my new repository was at `https://github.com/example/home-manager-flake` and my Home-Manager user defined in `flake.nix` was named `myawesomeuser`, I would replace this original line in `.github/workflows/ci.yml`:

```
nix --extra-experimental-features "nix-command flakes" build github:heywoodlh/home-manager-flake#homeConfigurations.heywoodlh.activationPackage --impure
```

With this:

```
nix --extra-experimental-features "nix-command flakes" build github:example/home-manager-flake#homeConfigurations.myawesomeuser.activationPackage --impure
```

## Adding your own settings:

Once you have a working Home-Manager configuration running, extend your configuration with your own settings. Use the configuration options for Home-Manager to figure out what you want to configure/update:

[Home-Manager -- Appendix A. Configuration Options](https://nix-community.github.io/home-manager/options.html)
