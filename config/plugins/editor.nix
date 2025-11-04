{
  plugins = {
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        file-browser.enable = true;
      };
      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
            "node_modules/"
          ];
        };
        pickers = {
          find_files = {
            hidden = true;
          };
        };
      };
    };

    fzf-lua = {
      enable = true;
      settings = {
        grep = {
          rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --fixed-strings -e";
        };
        git = {
          status = {
            cmd = "git status -su";
            previewer = "git_diff";
          };
          commits = {
            cmd = "git log --color --pretty=format:'%C(yellow)%h%Creset %Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset'";
            preview = "git show --color {1}";
          };
          bcommits = {
            cmd = "git log --color --pretty=format:'%C(yellow)%h%Creset %Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset' {file}";
            preview = "git show --color {1} -- {file}";
          };
          branches = {
            cmd = "git branch --all --color";
            preview = "git log --graph --pretty=format:'%C(yellow)%h%Creset %Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset' {1}";
          };
        };
      };
    };

    harpoon = {
      enable = true;
      enableTelescope = true;
      autoLoad = true;
    };

    which-key.enable = true;
    auto-save.enable = true;
    vim-be-good.enable = true;
    gitlinker.enable = true;

    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = {
            text = "│";
          };
          change = {
            text = "│";
          };
          delete = {
            text = "_";
          };
          topdelete = {
            text = "‾";
          };
          changedelete = {
            text = "~";
          };
          untracked = {
            text = "┆";
          };
        };
        current_line_blame = false;
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
          delay = 1000;
        };
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

    rustaceanvim = {
      enable = true;
      autoLoad = true;
    };
  };
}
