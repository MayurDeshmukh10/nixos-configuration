{ inputs, config, pkgs, lib,... }:
{
	specialisation = {
		kde_plasma = {
			inheritParentConfig = true;
			configuration = {
				system.nixos.tags = [ "kde-plasma" ];
				programs.hyprland.enable = false; 
				services.greetd.enable = false; 
				services.xserver.enable = true;
				services.xserver.desktopManager.plasma5.enable = true;
				services.xserver.displayManager.sddm.enable = true;
				
				#fileSystems."/nix" = {
     				#	device = "/dev/disk/by-label/nix";
     				#	fsType = "ext4";
     				#	neededForBoot = true;
     				#	options = [ "noatime" ];
  				#};
			};
		};
	};

}
