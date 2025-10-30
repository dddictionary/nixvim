{
  config,
  pkgs,
  lib,
  ...
}: {
  extraPlugins = [
    pkgs.vimPlugins.hover-nvim
    pkgs.vimPlugins.vim-rails
  ];

  withRuby = false;
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
      vim.keymap.set('n', '<C-n>', function() require('hover').hover_switch('next') end, {desc = 'hover.nvim (next source)'})
      vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files, {})
      vim.keymap.set('n', '<leader>ps', function() require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep >\")}) end)
    ";

  # remappings
  globals.mapleader = " ";

  keymaps = [
    {
      key = "<leader>ff";
      action = "<cmd>Explore<CR>";
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
    {
      key = "gl";
      action = "<cmd>lua vim.diagnostic.open_float(0, {scope='line', border='rounded'})<CR>";
      mode = ["n"];
    }
    # Harpoon: add current file to list
    {
      key = "<leader>a";
      action.__raw = ''
        function()
          require('harpoon'):list():add()
        end
      '';
      mode = ["n"];
    }
    # Harpoon: open UI to view/manage marks
    {
      key = "<C-e>";
      action.__raw = ''
        function()
          local harpoon = require('harpoon')
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end
      '';
      mode = ["n"];
    }
    # Harpoon: jump to slots 1..5 with leader+1..5
    {
      key = "<leader>1";
      action.__raw = "function() require('harpoon'):list():select(1) end";
      mode = ["n"];
    }
    {
      key = "<leader>2";
      action.__raw = "function() require('harpoon'):list():select(2) end";
      mode = ["n"];
    }
    {
      key = "<leader>3";
      action.__raw = "function() require('harpoon'):list():select(3) end";
      mode = ["n"];
    }
    {
      key = "<leader>4";
      action.__raw = "function() require('harpoon'):list():select(4) end";
      mode = ["n"];
    }
    {
      key = "<leader>5";
      action.__raw = "function() require('harpoon'):list():select(5) end";
      mode = ["n"];
    }
    {
      key = "<leader>fp";
      action = "<cmd> :let @+ = expand('%:p:.')<cr>";
      mode = ["n"];
      options = {
        desc = "Get relative file path";
      };
    }
  ];

  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 4;
    undofile = true;
    undodir.__raw = "vim.fn.stdpath('data') .. '/undo//'";
  };

  luaLoader.enable = true;
  plugins = {
    gitlinker = {
      enable = true;
    };
    vim-be-good = {
      enable = true;
    };
    treesitter = {
      enable = true;
      settings = {
        ensure_installed = [
          "ruby"
          "html"
          "javascript"
          "json"
          "yaml"
          "go"
        ];
        highlight.enable = true;
      };
    };
    conform-nvim = {
      enable = true;
      autoLoad = true;

      settings = {
        formatters_by_ft = {
          nix = ["alejandra"];
          rust = ["rustfmt"];
          ruby = ["ruby-lsp"];
          python = [
            "isort"
            "black"
          ];
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
          { timeout_ms = 300, lsp_fallback = true , quiet = true}
        '';

        log_level = "warn";
        notify_on_error = true;
        notify_no_formatters = true;

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
    which-key.enable = true;
    harpoon = {
      enable = true;
      enableTelescope = true;
      autoLoad = true;
    };
    neocord.enable = true;
    rustaceanvim = {
      enable = true;
      autoLoad = true;
    };

    lualine.enable = true;
    cmp-nvim-lsp.enable = true;
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        file-browser.enable = true;
      };
    };

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
      keymaps = {
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      servers = {
        lua_ls.enable = true;
        ruby_lsp = {
          enable = true;
          package = null;
          # cmd = [ "bundle" "exec" "ruby-lsp" ];
        };
        sorbet = {
          enable = true;
          package = null;
        };
        ts_ls.enable = true;
        clangd.enable = true;
        pyright.enable = true;
        gopls = {
          enable = true;
        };
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

  # colorschemes.base16.enable = true;
  # colorschemes.base16.colorscheme = "gruvbox-dark-hard";
  colorschemes = {
    kanagawa = {
      enable = true;
      settings = {
        theme = "wave";
      };
    };
  };
}
