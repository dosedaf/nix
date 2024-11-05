{ lib, ... }:
{
	programs.nixvim = {
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
					nixd.enable = true;
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
						"nix"
					];

					highlight.enable = true;
					indent.enable = true;
				};
			};
			telescope = {
        enable = true;
        keymaps = {
          "<leader><space>" = "find_files";
          "<leader>/" = "live_grep";
        };
      };
      treesitter-context.enable = true;
      treesitter-refactor.enable = true;
      treesitter-textobjects.enable = true;
      lspkind.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          experimental = {
            ghost_text = true;
          };
          performance = {
            maxViewEntries = 10;
          };
					/*
          snippet = {
            expand = ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
          };
					*/
          sources = [
            { name = "nvim_lsp"; }
            {
              name = "path"; # file system paths
            }
            {
              name = "luasnip"; # snippets
            }
            # { name = "nvim_lsp_signature_help"; }
            # { name = "codeium"; }
            # { name = "buffer"; }
            # { name = "luasnip"; }
          ];
          formatting = {
            fields = [
              "kind"
              "abbr"
              "menu"
            ];
            format = lib.mkForce ''
              require('lspkind').cmp_format({
                mode = 'symbol',
                before = function(entry, item)
                  local content = item.abbr
                  local ELLIPSIS_CHAR = '…'
                  local MAX_LABEL_WIDTH = 25
                  local MAX_KIND_WIDTH = 14
                  local get_ws = function (max, len)
                    return (" "):rep(max - len)
                  end

                  if #content > MAX_LABEL_WIDTH then
                    item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
                  else 
                    item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
                  end

                  return item
                end
              })
            '';
          };
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.config.disable";
            "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            # "<CR>" = ''
            #   cmp.mapping(function(fallback)
            #     local luasnip = require('luasnip')
            #     if cmp.visible() then
            #       if luasnip.expandable() then
            #         luasnip.expand()
            #       else
            #         cmp.confirm({
            #           select = true,
            #         })
            #       end
            #     else
            #       fallback()
            #     end
            #   end)
            # '';
            "<Tab>" = ''
              cmp.mapping(function(fallback)
                local luasnip = require('luasnip')
                if cmp.visible() then
                  local entry = cmp.get_selected_entry()
                  if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                  end
                  cmp.confirm()
                elseif luasnip.locally_jumpable(1) then
                  luasnip.jump(1)
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
            "<S-Tab>" = ''
              cmp.mapping(function(fallback)
                local luasnip = require('luasnip')
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.locally_jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
      cmp_luasnip.enable = true;
			luasnip.enable = true;
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_format = "fallback";
            timeout_ms = 3000;
          };
          formatters_by_ft = {
            javascript = [ "prettierd" ];
            typescript = [ "prettierd" ];
            javascriptreact = [ "prettierd" ];
            typescriptreact = [ "prettierd" ];
            svelte = [ "prettierd" ];
            astro = [ "prettierd" ];
            nix = [ "nixfmt" ];
            go = [
              "gofumpt"
              "goimports-reviser"
              "golines"
            ];
            markdown = [ "mdformat" ];
            "_" = [ "trim_whitespace" ];
          };
        };
      };
      nvim-autopairs.enable = true;
			wakatime.enable = true;
		};
	};

}
