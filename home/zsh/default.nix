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
			nixrbs = "sudo nixos-rebuild switch --flake ~/nix#dosed";
			nixrbt = "sudo nixos-rebuild test --flake ~/nix#dosed";
			nixrbb = "sudo nixos-rebuild boot --flake ~/nix#dosed";
			nixconf = "cd ~/nix/nixos && nvim configuration.nix";
			homeconf = "cd ~/nix/home && nvim default.nix";
			crun = "g++ main.cpp -o main && ./main";
			gaa = "git add --all";
		};
		oh-my-zsh = {
			enable = true;
			theme = "af-magic";
			plugins = ["git" "sudo" "kubectl" "aliases" "alias-finder" "fzf" "github" "golang" "httpie" "kitty" "man" "tmux" "vi-mode"];
		};

	};
}

