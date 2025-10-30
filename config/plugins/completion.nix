{
  plugins = {
    cmp-nvim-lsp.enable = true;
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
}
