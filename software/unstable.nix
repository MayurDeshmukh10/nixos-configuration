{ config, pkgs, ...}:
let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
in {
  environment.systemPackages = with pkgs; [
    #unstable.obsidian
    #unstable.vscode
    unstable.kitty
    unstable.firefoxpwa
    unstable.wl-gammarelay-rs
    unstable.catppuccin
    unstable.gnome.pomodoro
    unstable.texliveFull
    #unstable.dropbox-cli
    #unstable.dropbox

  ];

  #programs.firefox = {
  #  enable = true;
 #   package = pkgs.firefox;
  #  nativeMessagingHosts.packages = with pkgs; [
   #   unstable.firefoxpwa
   # ];
 # };
}
