return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				python = { "black", "isort" },
				--sh = { 'beautysh' },
				go = { "goimports" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				-- javascript = { { "prettierd", "prettier" } },
			},
			formatters = {
				black = {
					command = "black",
					prepend_args = { "--fast" },
				},
				goimports = {
					command = "goimports",
				},
			},
		},
	},
}
