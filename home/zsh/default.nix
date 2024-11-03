{ pkgs, lib, ...}:
{
	programs.zsh = {
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
			homeconf = "cd ~/system/home && nvim .";
		};
		oh-my-zsh = {
			enable = true;
			theme = "af-magic";
			plugins = ["git" "sudo" "kubectl" "aliases" "alias-finder" "fzf" "github" "golang" "httpie" "kitty" "man" "tmux" "vi-mode"];
		};

	};
}

