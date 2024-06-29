{ config, pkgs, ...}:
let
  baseconfig = { allowUnfree = true; };
in {
  environment.systemPackages = with pkgs; [
	libgcc
	jdk
	python3
	python311Packages.pip
	util-linux
    	m4
    	gperf
    	cudatoolkit
	ncurses5
    	stdenv.cc
    	binutils
	libGLU libGL
  ];
}
