return {
	 { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
  --     require('which-key').register {
  --   { "", group = "[S]earch" },
  --   { "", group = "[W]orkspace" },
  --   { "", group = "[C]ode" },
  --   { "", group = "[D]ocument" },
  --   { "", group = "[R]ename" },
  --   { "", desc = "", hidden = true, mode = { "n", "n", "n", "n", "n" } },
  -- }
    end,
  },
}
