# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, lib,... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./software/packages.nix
      ./software/unstable.nix
      ./software/dev-packages.nix
      ./software/hyprland.nix
      ./software/firefox.nix
      ./software/gaming.nix
      ./software/specializations.nix
      #./software/eduroam.nix
      ./hardware/bluetooth.nix
      ./hardware/sound.nix
      ./hardware/nvidia-configuration.nix
      ./hardware/power-saving.nix
    ];

  #catppuccin.flavour = "mocha";
 #programs.firefox = {
  #  enable = true;
   # package = pkgs.firefox;
    #nativeMessagingHosts.packages = with pkgs; [
     #pkgs.firefoxpwa
    #];
  #};

  fileSystems."/nix" = {
     device = "/dev/disk/by-label/nix";
     fsType = "ext4";
     neededForBoot = true;
     options = [ "noatime" ];
  };
  nix.settings = {
    		substituters = ["https://hyprland.cachix.org"];
    		trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };	

  # Storage Optimization
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "22:00" ];
  nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 5d";
  };

  # flatpak
  services.flatpak.enable = true;
  
# Bootloader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.

  #networking.nameservers = [ "1.1.1.1" "8.8.8.8"]; 
  #[ "1.1.1.1" "8.8.8.8" ];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.scanRandMacAddress = true;
  networking.networkmanager.wifi.powersave = false;
  networking.wireless.scanOnLowSignal = false;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # GPU accerelation & Drivers
  #boot.kernelParams = [ "i915.force_probe=<46a3>" ];
  #boot.kernelParams = [ "module_blacklist=i915" ];
  
  # logind
  #services.logind.powerKey = "suspend";
  services.logind.powerKeyLongPress = "poweroff";

  # Enable the X11 windowing system.
  services.xserver.enable = lib.mkDefault false;

  services.xserver.videoDrivers = ["nvidia"];

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = lib.mkDefault false;
  services.xserver.desktopManager.plasma5.enable = lib.mkDefault false;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
#  sound.enable = true;
#  hardware.pulseaudio.enable = false;
#  security.rtkit.enable = true;
#  services.pipewire = {
#    enable = true;
#    alsa.enable = true;
#    alsa.support32Bit = true;
#    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
#  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mayur = {
    isNormalUser = true;
    description = "Mayur Deshmukh";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
      git
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # GVfs for Nautilus
  services.gvfs.enable = true;


  fonts.packages = with pkgs; [
 	font-awesome
	nerdfonts
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
