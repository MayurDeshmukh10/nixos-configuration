{ config, pkgs, ...}:
let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
in {
  environment.systemPackages = with pkgs; [
    #unstable.obsidian
    unstable.vscode
    unstable.kitty
    unstable.firefoxpwa
    unstable.wl-gammarelay-rs
    unstable.catppuccin
    unstable.gnome.pomodoro
    unstable.texliveFull
    unstable.spotify-player
    #unstable.dropbox-cli
    #unstable.dropbox
    #unstable.vscode-fhs
    #unstable.vscode-with-extensions


     (vscode-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      bbenoist.nix
      ms-python.python
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
      james-yu.latex-workshop
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "remote-ssh-edit";
        publisher = "ms-vscode-remote";
        version = "0.47.2";
        sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
    ];
  })
  ];



  #programs.firefox = {
  #  enable = true;
 #   package = pkgs.firefox;
  #  nativeMessagingHosts.packages = with pkgs; [
   #   unstable.firefoxpwa
   # ];
 # };
}
