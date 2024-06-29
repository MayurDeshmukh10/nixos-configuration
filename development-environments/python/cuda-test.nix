# Run with `nix-shell cuda-shell.nix`
{ pkgs ? import <nixpkgs> {
  config = {
    allowUnfree = true;
    cudaSupport = true;
  };
} }:
let
 #pythonPackages = python311Packages;
in
pkgs.mkShell {
   name = "ml-env";
   #venvDir = "./.venv";
   buildInputs = with pkgs; [

     python311Packages.venvShellHook

     git gitRepo gnupg autoconf curl
     procps gnumake util-linux m4 gperf unzip
     cudatoolkit linuxPackages.nvidia_x11
     libGLU libGL
     xorg.libXi xorg.libXmu freeglut
     xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr zlib 
     ncurses5 stdenv.cc binutils openssl taglib
     stdenv.cc.cc.lib git-crypt


     python311Packages.torchWithCuda
     python311Packages.jupyter
     python311Packages.ipykernel
     python311Packages.jupyterlab
     python311Packages.numpy
     python311Packages.pip
     python311Packages.pyzmq
   ];

   #postVenvCreation = ''
   # unset SOURCE_DATE_EPOCH
    
   # python -m ipykernel install --user --name=ml-env --display-name="ml-env"
   # pip install -r requirements.txt
   #'';

   shellHook = ''
      export CUDA_PATH=${pkgs.cudatoolkit}
      export LD_LIBRARY_PATH=${pkgs.linuxPackages.nvidia_x11}/lib:${pkgs.ncurses5}/lib
      export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
      export EXTRA_CCFLAGS="-I/usr/include"
   '';
   
   postShellHook = ''
    # allow pip to install wheels
    unset SOURCE_DATE_EPOCH
  '';          
}
