{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./options.nix
    ./keymaps.nix
    ./extra.nix
    ./plugins/lsp.nix
    ./plugins/completion.nix
    ./plugins/formatter.nix
    ./plugins/treesitter.nix
    ./plugins/editor.nix
    ./plugins/ui.nix
    ./plugins/starter.nix
  ];
}
