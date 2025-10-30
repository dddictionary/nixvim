{pkgs, ...}: {
  extraPackages = with pkgs; [
    fortune
    cowsay
  ];

  plugins = {
    # Alpha-nvim: Popular, clean, has nice presets (startify, dashboard themes)
    alpha = {
      enable = true;
      layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          val = [
            "    /\\_/\\  "
            "   ( o.o ) "
            "    > ^ <  "
            "   /|   |\\ "
            "  (_|   |_)"
          ];
          opts = {
            position = "center";
            hl = "Type";
          };
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "group";
          val = [
            {
              type = "button";
              val = "  Find file";
              on_press.__raw = "function() require('fzf-lua').files() end";
              opts = {
                keymap = [
                  "n"
                  "f"
                  ":lua require('fzf-lua').files()<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                shortcut = "f";
                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "button";
              val = "  Live grep";
              on_press.__raw = "function() require('fzf-lua').live_grep() end";
              opts = {
                keymap = [
                  "n"
                  "g"
                  ":lua require('fzf-lua').live_grep()<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                shortcut = "g";
                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "button";
              val = "  Recent files";
              on_press.__raw = "function() require('fzf-lua').oldfiles() end";
              opts = {
                keymap = [
                  "n"
                  "r"
                  ":lua require('fzf-lua').oldfiles()<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                shortcut = "r";
                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
            {
              type = "button";
              val = "  Quit";
              on_press.__raw = "function() vim.cmd('qa') end";
              opts = {
                keymap = [
                  "n"
                  "q"
                  ":qa<CR>"
                  {
                    noremap = true;
                    silent = true;
                    nowait = true;
                  }
                ];
                shortcut = "q";
                position = "center";
                cursor = 3;
                width = 38;
                align_shortcut = "right";
                hl_shortcut = "Keyword";
              };
            }
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          val.__raw = "vim.fn.systemlist('fortune | cowsay -f kitty')";
          opts = {
            position = "center";
            hl = "Comment";
          };
        }
      ];
    };

    # Dashboard-nvim: Alternative option (uncomment to try)
    # dashboard = {
    #   enable = true;
    #   settings = {
    #     theme = "doom";
    #     config = {
    #       header = [
    #         "    /\\_/\\  "
    #         "   ( o.o ) "
    #         "    > ^ <  "
    #         "   /|   |\\ "
    #         "  (_|   |_)"
    #       ];
    #       center = [
    #         {
    #           icon = "  ";
    #           desc = "Find file                       ";
    #           key = "f";
    #           action = "lua require('fzf-lua').files()";
    #         }
    #         {
    #           icon = "  ";
    #           desc = "Live grep                       ";
    #           key = "g";
    #           action = "lua require('fzf-lua').live_grep()";
    #         }
    #         {
    #           icon = "  ";
    #           desc = "Recent files                    ";
    #           key = "r";
    #           action = "lua require('fzf-lua').oldfiles()";
    #         }
    #         {
    #           icon = "  ";
    #           desc = "Quit                            ";
    #           key = "q";
    #           action = "qa";
    #         }
    #       ];
    #     };
    #   };
    # };

    # Startup-nvim: Another alternative (uncomment to try)
    # startup = {
    #   enable = true;
    #   theme = "dashboard";
    # };
  };
}
