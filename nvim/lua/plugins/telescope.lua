return {
 -- Fuzzy Finder (files, lsp, etc)
	 {
		 'nvim-telescope/telescope.nvim',
		 event = 'VimEnter',
		 branch = '0.1.x',
		 dependencies = {
			'nvim-lua/plenary.nvim',
			{ -- If encountering errors, see telescope-fzf-native README for install instructions
			  'nvim-telescope/telescope-fzf-native.nvim',

			  -- `build` is used to run some command when the plugin is installed/updated.
			  -- This is only run then, not every time Neovim starts up.
			  build = 'make',

			  -- `cond` is a condition used to determine whether this plugin should be
			  -- installed and loaded.
			  cond = function()
				 return vim.fn.executable 'make' == 1
			  end,
			},
			{ 'nvim-telescope/telescope-ui-select.nvim' },

			-- Useful for getting pretty icons, but requires special font.
			--  If you already have a Nerd Font, or terminal set up with fallback fonts
			--  you can enable this
			-- { 'nvim-tree/nvim-web-devicons' }
		 },
		 config = function()
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'macros')
    end,
	 }
}
