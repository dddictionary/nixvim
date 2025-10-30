{
  config,
  pkgs,
  lib,
  ...
}: {
  plugins = {
    conform-nvim = {
      enable = true;
      autoLoad = true;

      settings = {
        formatters_by_ft = {
          nix = ["alejandra"];
          rust = ["rustfmt"];
          ruby = ["ruby-lsp"];
          python = [
            "isort"
            "black"
          ];
          c = ["clang_format"];
          cpp = ["clang_format"];
          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };
          "_" = ["trim_whitespace"]; # fallback for unknown filetypes
        };
        format_on_save = ''
          { timeout_ms = 300, lsp_fallback = true , quiet = true}
        '';

        log_level = "warn";
        notify_on_error = true;
        notify_no_formatters = true;

        formatters = {
          alejandra = {
            command = lib.getExe pkgs.alejandra;
          };
          rustfmt = {
            command = lib.getExe pkgs.rustfmt;
          };
          isort = {
            command = lib.getExe pkgs.python3Packages.isort;
          };
          black = {
            command = lib.getExe pkgs.black;
          };
          clang_format = {
            command = lib.getExe' pkgs.clang-tools "clang-format";
          };
          prettierd = {
            command = lib.getExe pkgs.prettierd;
          };
          prettier = {
            command = lib.getExe pkgs.nodePackages.prettier;
          };
          trim_whitespace = {
            command = "${pkgs.coreutils}/bin/cat";
          };
        };
      };
    };
  };
}
