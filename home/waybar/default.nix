{
	programs.waybar = {
		enable = true;
		systemd.enable = true;
		style = ''
			* {
		/* `otf-font-awesome` is required to be installed for icons */
		font-family: 'SF Pro Text', sans-serif;
		font-size: 13px;
}

window#waybar {
		background-color: rgba(30, 35, 38, 0.9);
		color: #d3c6aa;
		transition-property: background-color;
		transition-duration: .5s;
}

window#waybar.hidden {
		opacity: 0.2;
}

/*
window#waybar.empty {
		background-color: transparent;
}
window#waybar.solo {
		background-color: #FFFFFF;
}
*/

window#waybar.termite {
		background-color: #3F3F3F;
}

window#waybar.chromium {
		background-color: #000000;
		border: none;
}

button {
		/* Use box-shadow instead of border so the text isn't offset */
		box-shadow: inset 0 -1px transparent;
		/* Avoid rounded borders under each button name */
		border: none;
		border-radius: 0;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
		background: inherit;
		box-shadow: inset 0 -1px #a7c080;
}

#workspaces button {
		padding: 0 6px;
		background-color: transparent;
		color: #d3c6aa;
}

#workspaces button:hover {
		background: rgba(0, 0, 0, 0.2);
}

#workspaces button.active {
		color: #a7c080;
		background-color: #232a2e;
}

#workspaces button.urgent {
		color: #e67e8c;
}

#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#mpd {
		padding: 0 10px;
		margin-top: 3px;
		margin-bottom: 3px;
		color: #ffffff;
		border-radius: 1px;
}

#window,
#workspaces {
		margin: 0 4px;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
		margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
		margin-right: 0;
}

#clock {
		background-color: transparent;
		color: #d3c6aa;
		font-weight: bold;
		margin-right: 7px;
}

#battery {
		background-color: transparent;
		color: #d3c6aa;
}

#battery.charging, #battery.plugged {
		color: #d3c6aa;
		background-color: transparent;
}

@keyframes blink {
		to {
				background-color: #ffffff;
				color: #000000;
		}
}

#battery.critical:not(.charging) {
		background-color: transparent;
		color: #d3c6aa;
		animation-name: blink;
		animation-duration: 0.5s;
		animation-timing-function: linear;
		animation-iteration-count: infinite;
		animation-direction: alternate;
}

label:focus {
		background-color: #000000;
}

#cpu {
		background-color: #2ecc71;
		color: #000000;
}

#memory {
		background-color: #9b59b6;
}

#disk {
		background-color: #964B00;
}

#backlight {
		background-color: #90b1b1;
}

#network {
		background-color: transparent;
		color: #d3c6aa;
}

#network.disconnected {
		background-color: transparent;
		color: #d3c6aa;
}

#pulseaudio {
		background-color: transparent;
		color: #d3c6aa;
}

#pulseaudio.muted {
		background-color: transparent;
		color: #d3c6aa;
}

#wireplumber {
		background-color: transparent;
		color: #d3c6aa;
}

#wireplumber.muted {
		background-color: #f53c3c;
}

#custom-media {
		background-color: #66cc99;
		color: #2a5c45;
		min-width: 100px;
}

#custom-media.custom-spotify {
		background-color: #66cc99;
}

#custom-media.custom-vlc {
		background-color: #ffa000;
}

#temperature {
		background-color: #f0932b;
}

#temperature.critical {
		background-color: #eb4d4b;
}

#tray {
		background-color: #2980b9;
}

#tray > .passive {
		-gtk-icon-effect: dim;
}

#tray > .needs-attention {
		-gtk-icon-effect: highlight;
		background-color: #eb4d4b;
}

#idle_inhibitor {
		background-color: #2d3436;
}

#idle_inhibitor.activated {
		background-color: #ecf0f1;
		color: #2d3436;
}

#mpd {
		background-color: #66cc99;
		color: #2a5c45;
}

#mpd.disconnected {
		background-color: #f53c3c;
}

#mpd.stopped {
		background-color: #90b1b1;
}

#mpd.paused {
		background-color: #51a37a;
}

#language {
		background: #00b093;
		color: #740864;
		padding: 0 5px;
		margin: 0 5px;
		min-width: 16px;
}

#keyboard-state {
		background: #97e1ad;
		color: #000000;
		padding: 0 0px;
		margin: 0 5px;
		min-width: 16px;
}

#keyboard-state > label {
		padding: 0 5px;
}

#keyboard-state > label.locked {
		background: rgba(0, 0, 0, 0.2);
}

#scratchpad {
		background: rgba(0, 0, 0, 0.2);
}

#scratchpad.empty {
	background-color: transparent;
}


		'';
		settings = [{
			height = 33;
			spacing = 9;
			tray = {
				spacing = 10;
			};
			modules-left = [ "hyprland/workspaces" ];
			modules-center = [ "hyprland/window" ];
			modules-right = [ "pulseaudio" "network" "battery" "clock" ];
			battery = {
				format = "{capacity}% {icon}";
				format-alt = "{time} {icon}";
				format-charging = "{capacity}% ";
				format-icons = [ "" "" "" "" "" ];
				format-plugged = "{capacity}% ";
				states = {
					critical = 15;
					warning = 30;
				};
			};
			network = {
				interval = 1;
				format-alt = "{ifname}: {ipaddr}/{cidr}";
				format-disconnected = "Disconnected ⚠";
				format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
				format-linked = "{ifname} (No IP) ";
				format-wifi = "";
				#format-wifi = "{essid} ({signalStrength}%) ";
			};
			pulseaudio = {
				format = "{volume}% {icon}";
				format-bluetooth = "{volume}% {icon}";
				format-bluetooth-muted = " {icon}";
				format-icons = {
					car = "";
					default = [ "" "" "" ];
					handsfree = "";
					headphones = "";
					headset = "";
					phone = "";
					portable = "";
				};
				format-muted = " {format_source}";
				format-source = "";
				format-source-muted = "";
				on-click = "pavucontrol";
			};

		}];

	};
}
