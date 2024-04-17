{ config, pkgs, ...}:
let
  baseconfig = { allowUnfree = true; };
in {
  environment.systemPackages = with pkgs; [
	python3
	python311Packages.pip
  ];
}
