{
  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 4;
    undofile = true;
    undodir.__raw = "vim.fn.stdpath('data') .. '/undo//'";
    termguicolors = true;
    # textwidth = 81;
    # wrap = true;
    # linebreak = true;
    # breakindent = true;
  };

  luaLoader.enable = true;
}
