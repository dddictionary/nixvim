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

      vim.keymap.set('n', 'K', require('hover').hover, {desc = 'Show hover information'})
      vim.keymap.set('n', 'gK', require('hover').hover_select, {desc = 'Select hover provider'})
      vim.keymap.set('n', '<C-p>', function() require('hover').hover_switch('previous') end, {desc = 'Previous hover source'})
      vim.keymap.set('n', '<C-n>', function() require('hover').hover_switch('next') end, {desc = 'Next hover source'})
      vim.keymap.set('n', '<leader>pf', function() require('fzf-lua').files({ hidden = true }) end, {desc = 'Find files (fzf)'})
      vim.keymap.set('n', '<leader>ps', require('fzf-lua').live_grep, {desc = 'Live grep (fzf)'})
    '';
}
