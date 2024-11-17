# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, lib, ... }: { imports = [ 
	./an515-58.nix
];

	# Bootloader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	nix.settings.experimental-features = [ "nix-command flakes" ];
	boot.kernelParams = [ "acpi_backlight=video"];

	networking = {
		hostName = "dosed"; # Define your hostname.
		networkmanager.enable = true;
	};
	# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Configure network proxy if necessary
	# networking.proxy.default = "http://user:password@proxy:port/";
	# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	services.postgresql = {
		enable = true;
		ensureDatabases = [ "mydatabase" ];
		authentication = pkgs.lib.mkOverride 10 ''
			#type database  DBuser  auth-method
			local all       all     trust
		'';
	};

	services.mysql = {
		enable = true;
		package = pkgs.mariadb;
	};

	# Set your time zone.
	time.timeZone = "Asia/Jakarta";

	# Select internationalisation properties.
	i18n.defaultLocale = "en_US.UTF-8";

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "us";
		variant = "";
	};

	# screenshot
	# grim -l 0 -g "${slurp}" - | wl-copy

	# virtualisation
	virtualisation.podman = {
		enable = true;
		dockerCompat = true;
	};

	virtualisation.virtualbox.host.enable = true;
	users.extraGroups.vboxusers.members = [ "yoda" ];

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.defaultUserShell = pkgs.zsh;
	users.users.yoda = {
		isNormalUser = true;
		description = "yoda";
		useDefaultShell = true;
		extraGroups = [ "networkmanager" "wheel" "audio" "video"];
		# packages = with pkgs; [];
	};

	programs.zsh.enable = true;
	fonts.packages = with pkgs; [ nerdfonts];

	hardware.acpilight.enable = true;
	programs.light.enable = true;

	# Allow unfree packages
	# nixpkgs.config.allowUnfree = true;
	nixpkgs.config = {
		allowUnfree = true;
	};

	environment.systemPackages = with pkgs; [
		mangohud
		blueman
		bluez
		gcc
		glibc
		# core
		p7zip
		bash
		git
		neovim
		zsh
		kitty
		kitty-themes

		j4-dmenu-desktop
		bemenu
		joplin-desktop

		# wayland utils
		grim
		slurp
		wl-clipboard
		libnotify

		# sys utils
		pavucontrol
		lshw
		geeqie

		# network tools
		networkmanager

		brightnessctl
		ddcutil

		xorg.xbacklight
	];

	# desktop portals
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

	services.xserver.enable = true;
	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;

	environment.sessionVariables = {
		NIXOS_OZONE_WL = "1";
	};

	hardware.graphics = {
		enable = true;
	};

	services.xserver.videoDrivers = ["nvidia"];

	hardware.nvidia = {
		modesetting.enable = true;
		powerManagement.enable = false;
		powerManagement.finegrained = false;
		open = false;
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};

	hardware.nvidia.prime = {
		# default is sync. use on-the-go if u were to go outside
		sync.enable = true;

		intelBusId = "PCI:01:00:0";
		nvidiaBusId = "PCI:02:00:0";
	};

	specialisation = {
		on-the-go.configuration = {
			system.nixos.tags = [ "on-the-go" ];
			hardware.nvidia = {
				prime.offload.enable = lib.mkForce true;
				prime.offload.enableOffloadCmd = lib.mkForce true;
				prime.sync.enable = lib.mkForce false;
			};
		};
	};

	hardware.bluetooth.enable = true;

	# audio
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};

	boot.kernelPackages = pkgs.linuxPackages; # (this is the default) some amdgpu issues on 6.10
	programs = {
		gamescope = {
			enable = true;
			capSysNice = true;
		};
		steam = {
			enable = true;
			gamescopeSession.enable = true;
			remotePlay.openFirewall = true;
			dedicatedServer.openFirewall = true;
			localNetworkGameTransfers.openFirewall = true;
		};
	};
	hardware.xone.enable = true; # support for the xbox controller USB dongle
	services.getty.autologinUser = "your_user";
	environment = {
		loginShellInit = ''
		[[ "$(tty)" = "/dev/tty1" ]] && ~/system/script/gs.sh
		'';
	};

	services.tlp = {
		enable = true;
		settings = {
			CPU_SCALING_GOVERNOR_ON_AC = "performance";
			CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

			CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
			CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

			CPU_MIN_PERF_ON_AC = 0;
			CPU_MAX_PERF_ON_AC = 100;
			CPU_MIN_PERF_ON_BAT = 0;
			CPU_MAX_PERF_ON_BAT = 20;

			#Optional helps save long term battery health
			#START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
			STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

		};
	};



	# List packages installed in system profile. To search, run:
	# $ nix search wget

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
	# programs.mtr.enable = true;
	# programs.gnupg.agent = {
	#   enable = true;
	#   enableSSHSupport = true;
	# };

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?
}
