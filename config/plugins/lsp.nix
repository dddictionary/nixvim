{
  plugins = {
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
  };
}
