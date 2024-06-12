{config, pkgs, ...}: let
  baseconfig = { allowUnfree = true; };
  unstable = import <nixos-unstable> { config = baseconfig; };
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  hyprland = (import flake-compat {
    # we're not using pkgs.fetchgit as that requires a hash to be provided
    src = builtins.fetchGit {
      url = "https://github.com/hyprwm/Hyprland.git";
      submodules = true;
    };
  }).defaultNix;
in {
#	  imports = [
  #  		hyprland.nixosModules.default
 #	 ];


	# configuration.nix
  	nix.settings = {
    		substituters = ["https://hyprland.cachix.org"];
    		trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  	};	

  	programs.hyprland = {
		enable = true;
		#enableNvidiaPatches = true;
		#nvidiaPatches = true;
		xwayland.enable = true;
		package = hyprland.packages.${pkgs.system}.hyprland;
	};

	services.greetd = {
		enable = true;
		settings = {
			default_session = {

				command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
				user = "greeter";
			};
		};
	};


	security.pam.services.swaylock = {};

	
	environment.systemPackages = with pkgs; [
		#unstable.hyprland
		hyprpaper
		xdg-desktop-portal-gtk
		xdg-desktop-portal-hyprland
		rofi-wayland
		unstable.waybar
		#dunst
		libnotify
		networkmanagerapplet
		wlogout
		swaynotificationcenter
		slurp
		grim
		wl-clipboard
		unstable.hyprlock
		wlsunset
		unstable.nh
		unstable.hypridle	
		unstable.cliphist
		unstable.hyprshade 
		qt6.qtwayland
		libsForQt5.qt5.qtwayland
		unstable.pyprland
		unstable.hyprlang
		unstable.hyprcursor
		phinger-cursors
		eww
		rofi-calc		

		(waybar.overrideAttrs (oldAttrs: {
			mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
			})
		)
	];

	hardware = {
		#opengl.enable = true;
		
		nvidia.modesetting.enable = true;
	};

	hardware.opengl = {
     		enable = true;
		driSupport = true;
		driSupport32Bit = true;
     		extraPackages = with pkgs; [
       			libGL
     		];
     		setLdLibraryPath = true;
   	};

	#environment.systemPackages = [
	#	(pkgs.waybar.overrideAttrs (oldAttrs: {
	#		mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
	#		})
	#	)
	#];

	xdg.portal.enable = true;
	xdg.portal.wlr.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

	
	
  	# Optional, hint electron apps to use wayland:
  	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
