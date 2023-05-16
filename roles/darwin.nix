{ config, pkgs, ... }:

{
  programs.firefox.package = pkgs.runCommand "firefox-0.0.0" { } "mkdir $out";
}
