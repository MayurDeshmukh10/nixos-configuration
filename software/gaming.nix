{ config, pkgs, ... }:
{
	programs.steam.enable = true;
	programs.steam.gamescopeSession.enable = true;

	environment.systemPackages = with pkgs; [
		mangohud
		protonup
		lutris
		bottles
	];

	programs.gamemode.enable = true;

	environment.sessionVariables = {
		STEAM_EXTRA_COMPAT_TOOLS_PATHS =
		"/home/user/.steam/root/compatibilitytools.d";
	};

}
