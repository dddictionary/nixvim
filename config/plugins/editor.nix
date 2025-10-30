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

    harpoon = {
      enable = true;
      enableTelescope = true;
      autoLoad = true;
    };

    which-key.enable = true;
    auto-save.enable = true;
    vim-be-good.enable = true;
    gitlinker.enable = true;

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
