{ pkgs, ... }:
{
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
				# "col.active_border" = "rgba(#e6e6e6) rgba(00ff99ee) 45deg";
				# "col.active_border" = "rgba(#e6e6e6)";
				"col.active_border" = "0xffe6e6e6";
				"col.inactive_border" = "0xAA595959";

				resize_on_border = false;
				allow_tearing = false;
				layout = "dwindle";
			};

			decoration = {
				rounding = 5;
				active_opacity = 1;
				inactive_opacity = 0.8;

				# drop_shadow = true;
				# shadow_range = 4;
				# shadow_render_power = 3;
				# "col.shadow" = "rgba(1a1a1aee)";

				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = 0.1696;
				}; # blur
			}; #decoration

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

			#"$terminal" = "kitty -e tmux";
			"$terminal" = "kitty";

			"$fileManager" = "dolphin";
			"$menu" = "rofi -show drun -show-icons";

			"$mainMod" = "SUPER";

			bind = [
				"$mainMod, Q, exec, $terminal"
				"$mainMod, C, killactive,"
				"$mainMod, D, exec, $menu"
				"$mainMod, V, togglefloating,"
				"$mainMod, D, exec, $menu"
				"$mainMod, P, pseudo,"
				"$mainMod, J, togglesplit,"

				"$mainMod, h, movefocus, l"
				"$mainMod, j, movefocus, r"
				"$mainMod, k, movefocus, u"
				"$mainMod, l, movefocus, d"

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



				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 0"

				"$mainMod, f, exec, bash -c \"grim -l 0 -g \\\"$(slurp)\\\" - | wl-copy\""
        ", Print, exec, bash -c \"grim -l 0 -g \\\"$(slurp)\\\"\""

			];

			"windowrulev2" = "suppressevent maximize, class:.*";

		}; #settings

		extraConfig = ''
			exec = wl-gammactl -c 0.935 -b 0.998 -g 0.806
			exec-once=zsh ~/nix/script/start.sh

			windowrule = workspace 1, title:$terminal
			windowrule = workspace 2, title:firefox
			windowrule = workspace 4, title:discord
			windowrule = workspace 5, title:spotify
		'';

	}; # wayland.windowManager.hyprland
}
