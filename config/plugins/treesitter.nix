{pkgs, ...}: {
  plugins = {
    treesitter = {
      enable = true;

      # Let Nix manage grammars instead of ensure_installed
      # (ensure_installed tries to write to the read-only Nix store)
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        ruby
        html
        javascript
        json
        yaml
        go
      ];

      settings = {
        highlight.enable = true;
      };
    };
  };
}
