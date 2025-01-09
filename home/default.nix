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
			python311
			obsidian
			unrar
			wireshark
			gnumake42
			postman
			planify
			ida-free
			burpsuite

			# lsp
			vscode-langservers-extracted
			nodejs_22
			prettierd
			zoom-us

			lsof
			air
			glibc
			protobuf
			protoc-gen-go
			gofumpt                # Go formatter
			goimports-reviser       # Go imports reviser
			golines                 # Go line formatter
			mdformat                # Markdown formatter
			nixpkgs-fmt             # Nix formatter
			prettierd               # Prettier daemon for formatting
			jetbrains.phpstorm
			wf-recorder
			go
			spotify

			intelephense
			php82Packages.php-cs-fixer
			blade-formatter
			unzip
			vscode
			vlc
			discord

			obs-studio
			oh-my-zsh
			tmux
			fzf

      # virtualisation
      distrobox
      clip

      # i fw w these
      kitty
			kitty-themes
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
		
		sessionVariables = {
			NIXOS_OZONE_WL = "1";
		};
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
