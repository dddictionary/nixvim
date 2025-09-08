{
  config,
  pkgs,
  lib,
  ...
}: {
  extraPlugins = [
    pkgs.vimPlugins.hover-nvim
  ];

  extraConfigLua = "
      require('hover').setup {
	init = function()
	  require('hover.providers.lsp')
	end,
	preview_opts = {
	  border = 'single'
	},
	preview_window = false,
	title = true,
	mouse_providers = {
	  'LSP'
	},
	mouse_delay = 1000
      }

      vim.keymap.set('n', 'K', require('hover').hover, {desc = 'hover.nvim'})
      vim.keymap.set('n', 'gK', require('hover').hover_select, {desc = 'hover.nvim (select)'})
      vim.keymap.set('n', '<C-p>', function() require('hover').hover_switch('previous') end, {desc = 'hover.nvim (previous source)'})
      vim.keymap.set('n', '<C-p>', function() require('hover').hover_switch('next') end, {desc = 'hover.nvim (next source)'})
      vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, {})
      vim.keymap.set('n', '<leader>ps', function() require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep >\")}) end)
    ";

  # remappings
  globals.mapleader = " ";

  keymaps = [
    {
      key = "<leader>ff";
      action = "<cmd>Ex<CR>";
    }
    {
      key = "<leader><leader>";
      action = "<c-^>";
    }
    {
      key = ";";
      action = ":";
    }
    {
      key = "<C-h>";
      action = "<cmd>nohlsearch<cr>";
      mode = [
        "n"
        "v"
      ];
    }
  ];

  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 4;
    undofile = true;
    undodir = "./undo";
  };

  luaLoader.enable = true;
  plugins = {
    conform-nvim = {
      enable = true;
      autoLoad = true;

      settings = {
        formatters_by_ft = {
          "nix" = ["alejandra"];
          rust = ["rustfmt"];
          python = ["isort" "black"];
          c = ["clang_format"];
          cpp = ["clang_format"];
          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          "_" = ["trim_whitespace"]; # fallback for unknown filetypes
        };
        format_on_save = ''
          function(bufnr)
            local slow_format_filetypes = slow_format_filetypes or {}

            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            local function on_format(err)
              if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
              end
            end

            return { timeout_ms = 200, lsp_fallback = true }, on_format
          end
        '';
        format_after_save = ''
          function(bufnr)
            local slow_format_filetypes = slow_format_filetypes or {}

            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if not slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            return { lsp_fallback = true }
          end
        '';

        log_level = "warn";
        notify_on_error = false;
        notify_no_formatters = false;

        formatters = {
          alejandra = {
            command = lib.getExe pkgs.alejandra;
          };
          rustfmt = {
            command = lib.getExe pkgs.rustfmt;
          };
          isort = {
            command = lib.getExe pkgs.python3Packages.isort;
          };
          black = {
            command = lib.getExe pkgs.black;
          };
          clang_format = {
            command = lib.getExe' pkgs.clang-tools "clang-format";
          };
          prettierd = {
            command = lib.getExe pkgs.prettierd;
          };
          prettier = {
            command = lib.getExe pkgs.nodePackages.prettier;
          };
          trim_whitespace = {
            command = "${pkgs.coreutils}/bin/cat";
          };
        };
      };
    };
    auto-save.enable = true;
    web-devicons.enable = true;
    harpoon = {
      enable = true;
      enableTelescope = true;
    };
    neocord.enable = true;
    rustaceanvim = {
      enable = true;
      autoLoad = true;
    };

    lualine.enable = true;
    cmp-nvim-lsp.enable = true;
    telescope.enable = true;

    autoclose = {
      enable = true;
      settings.keys = {
        "(" = {
          escape = false;
          close = true;
          pair = "()";
        };
        "[" = {
          escape = false;
          close = true;
          pair = "[]";
        };
        "{" = {
          escape = false;
          close = true;
          pair = "{}";
        };
      };
    };

    lsp = {
      enable = true;
      servers = {
        lua_ls.enable = true;
        ruby_lsp = {
          enable = true;
          cmd = [ "bundle" "exec" "ruby-lsp" ];
        };
        rubocop = {
          enable = true;
          cmd = [ "bundle" "exec" "rubocop" ];
        };
        ts_ls.enable = true;
        clangd.enable = true;
        pyright.enable = true;
      };
    };
    # cmp-clippy.enable = true;
    luasnip.enable = true;
    cmp_luasnip.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;

      settings.sources = [
        {name = "nvim_lsp";}
        {name = "nvim_lsp_signature_help";}
        {name = "path";}
        {
          name = "buffer";
        }
        # { name = "clangd"; }
        {name = "luasnip";}
      ];

      settings.snippet = {
        expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
      };

      settings.mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-e>" = "cmp.mapping.close()";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      };
    };
  };

  colorschemes.base16.enable = true;
  colorschemes.base16.colorscheme = "gruvbox-dark-hard";
}
