{ inputs, config, pkgs, ...}: 
{
	# TODO - setup this
	#nix.settings = {
	#	substituters = []
	#	trusted-public-keys
	#}

	# configuration.nix
  	nix.settings = {
    		substituters = ["https://hyprland.cachix.org"];
    		trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  	};

	

  	programs.hyprland = {
		enable = true;
		nvidiaPatches = true;
		xwayland.enable = true;
		#package = pkgs.inputs.hyprland.packages.${pkgs.system}.hyprland;
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
	
	environment.systemPackages = with pkgs; [
		hyprpaper
		rofi-wayland
		waybar
		#dunst
		libnotify
		networkmanagerapplet
		wlogout
		swaynotificationcenter
		slurp
		grim
		wl-clipboard

		(waybar.overrideAttrs (oldAttrs: {
			mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
			})
		)
	];

	hardware = {
		opengl.enable = true;
		
		nvidia.modesetting.enable = true;
	};

	#environment.systemPackages = [
	#	(pkgs.waybar.overrideAttrs (oldAttrs: {
	#		mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
	#		})
	#	)
	#];

	xdg.portal.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

	
	
  	# Optional, hint electron apps to use wayland:
  	environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
