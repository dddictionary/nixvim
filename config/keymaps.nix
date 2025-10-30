{
  globals.mapleader = " ";

  keymaps = [
    {
      key = "<leader>ff";
      action = "<cmd>Explore<CR>";
      options = {
        desc = "Open file explorer";
      };
    }
    {
      key = "<leader><leader>";
      action = "<c-^>";
      options = {
        desc = "Switch to alternate buffer";
      };
    }
    {
      key = ";";
      action = ":";
      options = {
        desc = "Enter command mode";
      };
    }
    {
      key = "<C-h>";
      action = "<cmd>nohlsearch<cr>";
      mode = [
        "n"
        "v"
      ];
      options = {
        desc = "Clear search highlighting";
      };
    }
    {
      key = "gl";
      action = "<cmd>lua vim.diagnostic.open_float(0, {scope='line', border='rounded'})<CR>";
      mode = ["n"];
      options = {
        desc = "Show line diagnostics";
      };
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
      options = {
        desc = "Add file to Harpoon";
      };
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
      options = {
        desc = "Toggle Harpoon menu";
      };
    }
    # Harpoon: jump to slots 1..5 with leader+1..5
    {
      key = "<leader>1";
      action.__raw = "function() require('harpoon'):list():select(1) end";
      mode = ["n"];
      options = {
        desc = "Harpoon file 1";
      };
    }
    {
      key = "<leader>2";
      action.__raw = "function() require('harpoon'):list():select(2) end";
      mode = ["n"];
      options = {
        desc = "Harpoon file 2";
      };
    }
    {
      key = "<leader>3";
      action.__raw = "function() require('harpoon'):list():select(3) end";
      mode = ["n"];
      options = {
        desc = "Harpoon file 3";
      };
    }
    {
      key = "<leader>4";
      action.__raw = "function() require('harpoon'):list():select(4) end";
      mode = ["n"];
      options = {
        desc = "Harpoon file 4";
      };
    }
    {
      key = "<leader>5";
      action.__raw = "function() require('harpoon'):list():select(5) end";
      mode = ["n"];
      options = {
        desc = "Harpoon file 5";
      };
    }
    {
      key = "<leader>fp";
      action = "<cmd> :let @+ = expand('%:p:.')<cr>";
      mode = ["n"];
      options = {
        desc = "Copy relative file path";
      };
    }
    # System clipboard yank/paste
    {
      key = "<leader>y";
      action = "\"+y";
      mode = ["n" "v"];
      options = {
        desc = "Yank to system clipboard";
      };
    }
    {
      key = "<leader>Y";
      action = "\"+Y";
      mode = ["n"];
      options = {
        desc = "Yank line to system clipboard";
      };
    }
    {
      key = "<leader>p";
      action = "\"+p";
      mode = ["n" "v"];
      options = {
        desc = "Paste from system clipboard";
      };
    }
    {
      key = "<leader>P";
      action = "\"+P";
      mode = ["n" "v"];
      options = {
        desc = "Paste before from system clipboard";
      };
    }
    # Hover keymaps
    {
      key = "K";
      action.__raw = "require('hover').hover";
      mode = ["n"];
      options = {
        desc = "Show hover information";
      };
    }
    {
      key = "gK";
      action.__raw = "require('hover').hover_select";
      mode = ["n"];
      options = {
        desc = "Select hover provider";
      };
    }
    {
      key = "<C-p>";
      action.__raw = "function() require('hover').hover_switch('previous') end";
      mode = ["n"];
      options = {
        desc = "Previous hover source";
      };
    }
    {
      key = "<C-n>";
      action.__raw = "function() require('hover').hover_switch('next') end";
      mode = ["n"];
      options = {
        desc = "Next hover source";
      };
    }
    # fzf-lua keymaps
    {
      key = "<leader>pf";
      action.__raw = "function() require('fzf-lua').files({ hidden = true }) end";
      mode = ["n"];
      options = {
        desc = "Find files (fzf)";
      };
    }
    {
      key = "<leader>ps";
      action.__raw = "require('fzf-lua').live_grep";
      mode = ["n"];
      options = {
        desc = "Live grep (fzf)";
      };
    }
    # Git keymaps using fzf-lua
    {
      key = "<leader>gs";
      action.__raw = "require('fzf-lua').git_status";
      mode = ["n"];
      options = {
        desc = "Git status (fzf)";
      };
    }
    {
      key = "<leader>gc";
      action.__raw = "require('fzf-lua').git_commits";
      mode = ["n"];
      options = {
        desc = "Git commits (fzf)";
      };
    }
    {
      key = "<leader>gC";
      action.__raw = "require('fzf-lua').git_bcommits";
      mode = ["n"];
      options = {
        desc = "Git buffer commits (fzf)";
      };
    }
    {
      key = "<leader>gb";
      action.__raw = "require('fzf-lua').git_branches";
      mode = ["n"];
      options = {
        desc = "Git branches (fzf)";
      };
    }
    {
      key = "<leader>gS";
      action.__raw = "require('fzf-lua').git_stash";
      mode = ["n"];
      options = {
        desc = "Git stash (fzf)";
      };
    }
    {
      key = "<leader>gf";
      action.__raw = "require('fzf-lua').git_files";
      mode = ["n"];
      options = {
        desc = "Git files (fzf)";
      };
    }
  ];
}
