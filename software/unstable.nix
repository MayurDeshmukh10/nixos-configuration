{ config, pkgs, ...}:
let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
in {
  environment.systemPackages = with pkgs; [
    unstable.obsidian
    unstable.vscode
    unstable.kitty
    unstable.firefoxpwa
    unstable.wl-gammarelay-rs
    unstable.catppuccin

  ];

  #programs.firefox = {
  #  enable = true;
 #   package = pkgs.firefox;
  #  nativeMessagingHosts.packages = with pkgs; [
   #   unstable.firefoxpwa
   # ];
 # };
}
