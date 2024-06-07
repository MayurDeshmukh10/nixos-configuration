{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mayur";
  home.homeDirectory = "/home/mayur";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
#	programs.git = {
#		enable = true;
#		userEmail = "mayur.s.deshmukh10@gmail.com";
#		userName = "Mayur Deshmukh";
#	};
    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  #programs.git = {
  #              enable = true;
 #               userEmail = "mayur.s.deshmukh10@gmail.com";
  #              userName = "Mayur Deshmukh";
#		safeDirectory = "/etc/nixos";
 # };

programs.zsh = {
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  syntaxHighlighting.enable = true;


  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "robbyrussell";
  };

  shellAliases = {
    ll = "ls -l";
    rebuild_system = "sudo nixos-rebuild switch";
    rebuild_home = "home-manager switch";
    system_config = "sudo vi /etc/nixos/configuration.nix";
    home_config = "vi /home/mayur/.config/home-manager/home.nix";
    hl_config = "vi /home/mayur/.config/hypr/hyprland.conf";
    update_packages = "sudo nixos-rebuild switch --upgrade";
    packages_stable = "sudo vi /etc/nixos/software/packages.nix";
    packages_unstable = "sudo vi /etc/nixos/software/unstable.nix";
    ml-env = "source ~/machine-learning-env/bin/activate";
    c_env = "nix-shell ~/Documents/nixos-configuration/development-environments/c_c++/shell.nix";
    cbclear = "cliphist wipe";
    work = "cd ~/Documents/SS_24";
    pi = "ssh mayur@192.168.178.105";
    status = "git status";
  };
  history.size = 10000;
  history.path = "${config.xdg.dataHome}/zsh/history";
};

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mayur/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    LD_LIBRARY_PATH= "$LD_LIBRARY:/nix/store/2zm8zhdjvf63vchky28z8z0s2c39acgw-glib-2.78.4/lib";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
