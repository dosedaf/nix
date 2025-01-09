# My NixOS Configuration

A personal NixOS configuration using Flakes, Home Manager, and NixVim for a fully declarative system setup.

## Overview

This repository contains my personal NixOS configuration files, managed using the Nix Flakes system for reproducible builds and easy deployment.

### Features

- Full system configuration using NixOS
- User environment management with Home Manager
- Neovim configuration using NixVim
- Declarative system setup
- Unfree packages enabled

## Structure

```
.
├── flake.nix               # Main flake configuration
├── wallpaper               # Wallpapers 
├── script                  # Shell scripts 
├── nixos/
│   │── configuration.nix   # System configuration
│   │── nbfc.nix            # NBFC configuration
│   └── an515-58.nix        # Hardware configuration
└── home/                   # Home-manager configurations
```

## Dependencies

This configuration relies on the following inputs:

- [nixpkgs](https://github.com/nixos/nixpkgs) (unstable channel)
- [home-manager](https://github.com/nix-community/home-manager)
- [nixvim](https://github.com/nix-community/nixvim)

## System Configuration

The system is configured for an x86_64 Linux machine with the hostname "dosed". Key configurations include:

- Global package management through NixOS
- User-specific configurations through Home Manager
- Automated backup system for configuration files
- Custom Neovim setup using NixVim

## Usage

### Initial Setup

1. Clone this repository:

```bash
git clone <repository-url>
cd <repository-name>
```

2. Build and switch to the configuration:

```bash
sudo nixos-rebuild switch --flake .#dosed
```

### Updating

To update your system with the latest configuration:

```bash
sudo nixos-rebuild switch --flake .#dosed
```

## Home Manager

Home Manager is configured for the user "yoda" with:

- Global package availability
- User-specific package management
- Automatic backup of replaced files (with .backup extension)
- Integration with NixVim for Neovim configuration

## Contributing

Feel free to fork this repository and adapt it to your needs. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This configuration is available under the [MIT License](LICENSE).
