{ inputs, config, pkgs, ... }:

{
  home = {
    username = "yoda"; 
    homeDirectory = "/home/yoda";
    stateVersion = "24.05";
    packages = with pkgs; [ # development tools
      #virtualisation
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

      dust
      dolphin
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
        background = "#1b2022";
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
    
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting = {
        enable = true;
				highlighters = [
					"main"
						"brackets"
						"pattern"
						"line"
				];
      };
      shellAliases = {
        ll = "ls -l";
        nixrbs = "sudo nixos-rebuild switch --flake ~/system#dosed";
        nixrbt = "sudo nixos-rebuild test --flake ~/system#dosed";
				nixrbb = "sudo nixos-rebuild boot --flake ~/system#dosed";
				nixconf = "cd ~/system/nixos && nvim .";
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

