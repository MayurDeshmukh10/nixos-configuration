{
	hardware.bluetooth.enable = true; # enables support for Bluetooth
	hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
	services.blueman.enable = true; # enable bluetooth management GUI
	
	# Bluetooth settings
	hardware.bluetooth.settings = {
		General = {
				Enable = "Source,Sink,Media,Socket"; # connect using the A2DP profile
				Experimental = true; # for showing battery charge
		};
	};
}	

