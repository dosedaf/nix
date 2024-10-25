{ config, pkgs, ... }:

{
  home = {
    username = "yoda"; 
    homeDirectory = "/home/yoda";
    stateVersion = "24.05";

    packages = with pkgs; [ 
      # development tools
      distrobox
      clip

      # i fw w these
      kitty
      fastfetch
      firefox

      # wayland tools
      waybar
      dunst 
      swww
      rofi-wayland

      # additonal utils
      atool
      httpie

    ];
  };


  /*
  gtk = {
    enable = true;
    iconTheme.name = "GruvBoxPlus";
  };
  */

  programs = {
    home-manager.enable = true;

    kitty = {
      enable = true;
      font = {
        name = "DejaVuSansMono";
	size = 18;
      };
      settings = {
        background_opacity = "1";
	background_blur = 20;
      };
    };
    
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      shellAliases = {
        ll = "ls -l";
        nixrbs = "sudo nixos-rebuild switch --flake ~/system#dosed";
        nixrbt = "sudo nixos-rebuild test --flake ~/system#dosed";
        nixrbb = "sudo nixos-rebuild boot --flake ~/system#dosed";
      };
    };

    git = {
      enable = true;
      userName = "dosedaf";
      userEmail = "mash1o1o1o1@gmail.com";
    };

    bash = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        nixrbs = "sudo nixos-rebuild switch --flake ~/system#dosed";
        nixrbt = "sudo nixos-rebuild test --flake ~/system#dosed";
        nixrbb = "sudo nixos-rebuild boot --flake ~/system#dosed";
      };
    };
  }; 

}
