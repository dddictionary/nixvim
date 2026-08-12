{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "pi-nvim";
      version = "0.2.4";
      src = pkgs.fetchFromGitHub {
        owner = "carderne";
        repo = "pi-nvim";
        rev = "fbc6f12652234f03d2fe729adbcc3ff61ca7d39a";
        hash = "sha256-yJzhyABIWltle7DJlSUXLAAZ0BFzZuzr/qW0sqHVzZc=";
      };
    })
    pkgs.vimPlugins.vim-rails
  ];

  extraConfigLua = ''
    require("pi-nvim").setup({ set_default_keymaps = false })
  '';

  withRuby = false;
}
