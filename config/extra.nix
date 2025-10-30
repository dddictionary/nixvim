{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.hover-nvim
    pkgs.vimPlugins.vim-rails
  ];

  withRuby = false;

  extraConfigLua = ''
      require('hover').setup {
        init = function()
          require('hover.providers.lsp')
        end,
        preview_opts = {
          border = 'single'
        },
        preview_window = false,
        title = true,
        mouse_providers = {
          'LSP'
        },
        mouse_delay = 1000
      }

      vim.keymap.set('n', 'K', require('hover').hover, {desc = 'hover.nvim'})
      vim.keymap.set('n', 'gK', require('hover').hover_select, {desc = 'hover.nvim (select)'})
      vim.keymap.set('n', '<C-p>', function() require('hover').hover_switch('previous') end, {desc = 'hover.nvim (previous source)'})
      vim.keymap.set('n', '<C-n>', function() require('hover').hover_switch('next') end, {desc = 'hover.nvim (next source)'})
      vim.keymap.set('n', '<leader>pf', function() require('telescope.builtin').find_files({ hidden = true }) end, {})
      vim.keymap.set('n', '<leader>ps', require('telescope.builtin').live_grep, {})
    '';
}
