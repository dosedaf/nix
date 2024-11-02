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

      # additonal utils
      atool
      httpie

      # c/c++
      gcc
      cmake
      pkg-config
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

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      monitor = [
        "eDP-1,1920x1080@144, auto, 1"
      ];


      general = {
        gaps_in = 5;
	gaps_out = 5;

	border_size = 1;
	"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
	"col.inactive_border" = "rgba(595959aa)";

	resize_on_border = false;
	allow_tearing = false;
	layout = "dwindle";
      };

      decoration = {
        rounding = 5;
	active_opacity = 1;
	inactive_opacity = 0.8;

	drop_shadow = true;
	shadow_range = 4;
	shadow_render_power = 3;
	"col.shadow" = "rgba(1a1a1aee)";

	blur = {
	  enabled = true;
	  size = 3;
	  passes = 1;
	  vibrancy = 0.1696;
	}; # blur
      }; #decoration

      /*
      animations = {
        enabled = true;
	bezier =  "myBezier, 0.05, 0.9, 0.1, 1.05";

	animation = [
	  "windows, 1, 7, myBezier";
	  "windowsOut, 1, 7, default, popin 80%";
	  "border, 1, 10, default";
	  "borderangle, 1, 8, default";
	  "fade, 1, 7, default";
	  "workspaces, 1, 6, default";
	];  
      };
      */

      animations = {
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
	preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      device = {
        name = "epic-mouse-v1";
	sensitivity = -0.5;
      };

      misc = {
        force_default_wallpaper = 0;
	disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
	follow_mouse = 1;

	sensitivity = 0;

	touchpad = {
	  natural_scroll = false;
	};
      };

      gestures = {
        workspace_swipe = false;
      };

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "rofi -show drun";

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Q, exec, $terminal"
	"$mainMod, C, killactive,"
	"$mainMod, D, exec, $menu"

	"$mainMod, 1, workspace, 1"
	"$mainMod, 2, workspace, 2"
	"$mainMod, 3, workspace, 3"
	"$mainMod, 4, workspace, 4"
	"$mainMod, 5, workspace, 5"
	"$mainMod, 6, workspace, 6"
	"$mainMod, 7, workspace, 7"
	"$mainMod, 8, workspace, 8"
	"$mainMod, 9, workspace, 9"
	"$mainMod, 0, workspace, 0"

	# "$mainMod, f, exec, bash -c "grim -l 0 -g \"$(slurp)\" - | wl-copy""
	# ", Print, exec, bash -c "grim -l 0 -g \"$(slurp)\"""

      ];

      "windowrulev2" = "suppressevent maximize, class:.*";

    }; #settings
  }; # wayland.windowManager.hyprland
}

