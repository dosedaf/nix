{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./nixvim
    ./waybar
		./zsh
		./kitty
  ];

  home = {
    username = "yoda";
    homeDirectory = "/home/yoda";
    stateVersion = "24.05";
    packages = with pkgs; [
			obs-studio
			oh-my-zsh
			tmux
			fzf
      # virtualisation
      distrobox
      clip
      libgccjit
      # i fw w these
      kitty
      fastfetch
      firefox
      brave
      # wayland tools
      waybar
      dunst 
      swww
      rofi-wayland
      # additional utils
      atool
      httpie
      # c/c++
      gcc
      cmake
      pkg-config
      dust
      dolphin

			discord
			php
    ];
  };

  programs = {
    home-manager.enable = true;
    
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
      }; #shellAliases
    }; # bash
  };  # programs
}
