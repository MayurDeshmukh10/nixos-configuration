{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
	zsh
        vim
        google-chrome
        thunderbird
        spotify
        htop
        nvtop-nvidia
        appimage-run
        btop
        hyper
        lshw
        bluez
        home-manager
        zsh-autosuggestions
	todoist-electron
	discord
	shotwell
	tev
	vlc
	git
	neofetch
	powertop
	kanshi # for display configuration
	zoom-us
	font-awesome
	webcord

	];
}
