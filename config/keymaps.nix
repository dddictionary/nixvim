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
  ];
}
