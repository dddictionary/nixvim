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

  # Configure LSP handlers with borders before LSP initialization
  extraConfigLuaPre = ''
    -- Set up LSP handlers with rounded borders
    local border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = border
      }
    )
  '';
}
