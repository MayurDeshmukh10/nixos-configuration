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
	#discord
	shotwell
	tev
	vlc
	git
	neofetch
	powertop
	okular
	brightnessctl # for brightness control
	kanshi # for display configuration
	gnome.nautilus # file manager
	helvum # Advanced sound control
	pavucontrol # sound control GUI
	playerctl
	flameshot
	zoom-us
	font-awesome
	webcord # wayland working discord clone

	];
}
