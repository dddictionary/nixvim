{
  opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 4;
    undofile = true;
    undodir.__raw = "vim.fn.stdpath('data') .. '/undo//'";
  };

  luaLoader.enable = true;
}
