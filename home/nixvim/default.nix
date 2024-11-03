{ pkgs, lib, ... }:
{
	nixvim = {
		enable = true;
		defaultEditor = true;
		opts = {
			cursorline = true;
			shiftwidth = 2;
			tabstop = 2;
			relativenumber = true;
			number = true;
		};

		plugins = {
			lsp = {
				enable = true;
				servers = {
					gopls = {
						enable = true;
						extraOptions = {
							gopls.semanticTokens = true;
						};
					};

					html.enable = true;
					cssls.enable = true;
					jsonls.enable = true;
					clangd.enable = true;
				};
			};

			treesitter = {
				enable = true;
				settings = {
					auto_install = false;
					ensure_installed = [
						"c"
						"bash"
						"cpp"
						"git_config"
						"gitignore"
						"gitcommit"
						"go"
						"lua"
						"llvm"
						"javascript"
						"php"
						"rust"
						"tmux"
					];

					highlight.enable = true;
					indent.enable = true;
				};
			};
		};
	};
};

	}
