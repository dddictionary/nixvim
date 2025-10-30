{
  plugins = {
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
  };
}
