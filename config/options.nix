{
  opts = {
    number = true;
    relativenumber = true;
    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    undofile = true;
    undodir.__raw = "vim.fn.stdpath('data') .. '/undo//'";
    termguicolors = true;
    # textwidth = 81;
    # wrap = true;
    # linebreak = true;
    # breakindent = true;
  };

  # Neovim's built-in ftplugin/go.vim sets noexpandtab + shiftwidth=0 (which
  # falls back to tabstop, defaulting to 8) whenever this is left enabled,
  # overriding the global indent settings above just for Go buffers.
  globals.go_recommended_style = 0;

  luaLoader.enable = true;
}
