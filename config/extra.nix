{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.vim-rails
  ];

  withRuby = false;
}
