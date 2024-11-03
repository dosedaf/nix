{ inputs, config, pkgs, ... }:
{
  imports = [
    ./hyprland
    ./nixvim
    ./waybar
		./zsh
  ];

  home = {
    username = "yoda";
    homeDirectory = "/home/yoda";
    stateVersion = "24.05";
    packages = with pkgs; [
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
    ];
  };

  programs = {
    home-manager.enable = true;
    
    kitty = {
      enable = true;
      font = {
        name = "DejaVuSansMono";
        size = 18;
      };
      settings = {
				# color
				background = "#1c1c1c";
				foreground = "#ddeedd";
				cursor = "#e2bbef";
				selection_background = "#4d4d4d";
				color0 = "#3d352a";
				color8 = "#554444";
				color1 = "#cd5c5c";
				color9 = "#cc5533";
				color2 = "#86af80";
				color10 = "#88aa22";
				color3 = "#e8ae5b";
				color11 = "#ffa75d";
				color4 = "#6495ed";
				color12 = "#87ceeb";
				color5 = "#deb887";
				color13 = "#996600";
				color6 = "#b0c4de";
				color14 = "#b0c4de";
				color7 = "#bbaa99";
				color15 = "#ddccbb";
				selection_foreground = "#1c1c1c";
				background_opacity = "0.9";
				background_blur = 20;
				window_border_width = 1;
				window_border_color = "#181c1e";
				active_border_color = "#cdd6f4";
				inactive_border_color = "#5e6773";
				hide_tab_bar = true;
				hide_window_decorations = true;
				scrollback_lines = 5000;
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
      }; #shellAliases
    }; # bash
  };  # programs
}
