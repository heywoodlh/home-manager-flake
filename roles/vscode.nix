{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      arcticicestudio.nord-visual-studio-code
      eamodio.gitlens
      jnoortheen.nix-ide
      ms-python.python
    ];
    keybindings = [
      {
        # Toggle terminal with Ctrl+t
        key = "ctrl+t";
        command = "workbench.action.terminal.toggleTerminal";
      }
      {
        # Toggle sidebar with Ctrl+n
        key = "ctrl+n";
        command = "workbench.action.toggleSidebarVisibility";
      }
    ];
    userSettings = {
      "telemetry.enableTelemetry" = false;
      "workbench.colorTheme" = "Nord";
    };
  };
}
