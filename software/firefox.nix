{ config, pkgs, ...}:
let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
in {
  programs.firefox.nativeMessagingHosts.packages = [ unstable.firefoxpwa ];
  environment.systemPackages = with pkgs; [
    unstable.firefoxpwa

  ];
}
