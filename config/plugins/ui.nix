{
  plugins = {
    lualine.enable = true;
    web-devicons.enable = true;
    neocord.enable = true;

    # In-buffer Markdown rendering (MeanderingProgrammer/render-markdown.nvim)
    render-markdown.enable = true;
  };

  colorschemes = {
    gruvbox = {
      enable = true;
    };
    # kanagawa = {
    #   enable = true;
    #   settings = {
    #     theme = "wave";
    #   };
    # };
  };

  # Runtime theme switching. gruvbox stays the Nix default; the last theme
  # picked at runtime is saved to stdpath("state") and restored on startup.
  # Themes from <leader>uC download to ~/.cache/fzf-lua/pack/fzf-lua/opt.
  extraConfigLuaPost = ''
    do
      local state_file = vim.fn.stdpath("state") .. "/colorscheme"
      local fzf_pack = vim.fn.stdpath("cache") .. "/fzf-lua"
      vim.opt.packpath:append(fzf_pack)

      local function apply(name)
        if pcall(vim.cmd.colorscheme, name) then return true end
        for _, dir in ipairs(vim.fn.glob(fzf_pack .. "/pack/fzf-lua/opt/*", false, true)) do
          pcall(vim.cmd.packadd, vim.fn.fnamemodify(dir, ":t"))
        end
        return pcall(vim.cmd.colorscheme, name)
      end

      local f = io.open(state_file, "r")
      if f then
        local saved = vim.trim(f:read("*a") or "")
        f:close()
        if saved ~= "" and saved ~= vim.g.colors_name then apply(saved) end
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function(ev)
          local out = io.open(state_file, "w")
          if out then out:write(ev.match) out:close() end
        end,
      })

      vim.api.nvim_create_user_command("ThemeReset", function()
        os.remove(state_file)
        vim.cmd.colorscheme("gruvbox")
        os.remove(state_file)
      end, { desc = "Forget the runtime theme and use the Nix default" })
    end
  '';

  keymaps = [
    {
      key = "<leader>uc";
      action.__raw = "function() require('fzf-lua').colorschemes() end";
      mode = ["n"];
      options.desc = "Switch installed colorscheme";
    }
    {
      key = "<leader>uC";
      action.__raw = "function() require('fzf-lua').awesome_colorschemes() end";
      mode = ["n"];
      options.desc = "Browse and download colorschemes";
    }
  ];
}
