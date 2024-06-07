{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
	zsh
        vim
        google-chrome
        thunderbird
        #spotify
        htop
        nvtop-nvidia
        appimage-run
        btop
        hyper
        lshw
	libglibutil
	glibc
	glib
	nix-index
        bluez
        home-manager
        zsh-autosuggestions
	#todoist-electron
	#discord
	shotwell
	tev
	vlc
	git
	neofetch
	powertop
	cmake
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
	openconnect # for cisco anyconnect VPN
	obs-studio
	inkscape
	libgcc
	qdirstat
	libsForQt5.dolphin
	unzip
	ffmpeg_5-full
	udiskie # Removable disk automounter
	stow
	polkit
	cacert
	ranger
	usbimager
	vdirsyncer # sync google calender
	cmatrix
	texstudio
	zotero
	libsForQt5.kcalc
	powertop
	wget
	socat
	gparted
	inetutils

	];
}
