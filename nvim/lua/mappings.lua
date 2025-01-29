local Hydra = require("hydra")

local api = require("remote-sshfs.api")
local connections = require("remote-sshfs.connections")

local builtin = require("telescope.builtin")

-- basic shortcuts
vim.keymap.set("n", "<leader>w", "<cmd>wa<CR>", { desc = "Save all" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

vim.keymap.set("n", "<leader>dd", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostics" })

-- [[ Telescope ]]
-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", function()
	if connections.is_connected() then
		api.find_files()
	else
		builtin.find_files()
	end
end, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sg", function()
	if connections.is_connected() then
		api.live_grep()
	else
		builtin.live_grep()
	end
end, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- Also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

-- TODO: Neocomposer - add to telescope (:Telescope macros) + some mappins for start/stop/play/next/prev

-- [[ Terminal ]]
-- TODO: add ranger window
local fterm = require("FTerm")
local runners = { lua = "lua", python = "python.exe", go = "go" }
local gitui = require("FTerm"):new({
	ft = "fterm_gitui",
	cmd = "gitui",
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
})
local secondary_term = fterm:new({
	--cmd = "pwsh",
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
})
local file_explorer_term = fterm:new({
	cmd = "ranger",
	dimensions = {
		height = 0.9,
		width = 0.9,
	},
})

vim.keymap.set({ "n", "t" }, "<leader>tt", function()
	fterm.toggle()
end, { desc = "[T]oggle floating terminal" })

vim.keymap.set("n", "<leader>tr", function()
	local buf = vim.api.nvim_buf_get_name(0)
	local ftype = vim.filetype.match({ filename = buf })
	local exec = runners[ftype]
	if exec ~= nil then
		require("FTerm").scratch({ cmd = { exec, buf } })
	end
end, { desc = "[T]erminal - [R]un current file" })

vim.keymap.set("n", "<leader>tg", function()
	gitui:toggle()
end, { desc = "[T]erminal - run [G]itui" })

vim.keymap.set({ "n", "t" }, "<leader>tT", function()
	secondary_term:toggle()
end, { desc = "[T]erminal - [T]oggle secondary terminal" })

vim.keymap.set("n", "<leader>tf", function()
	file_explorer_term:toggle()
end, { desc = "[T]erminal - run [F]ile explorer" })

vim.api.nvim_create_user_command("FTermExit", fterm.exit, { bang = true })

-- [[ Harpoon ]]
local harpoon = require("harpoon")
harpoon:setup()

Hydra({
	name = "Harpoon",
	mode = "n",
	body = "<leader>h",
	heads = {
		{
			"n",
			function()
				harpoon:list():next({ ui_nav_wrap = true })
			end,
			{ desc = "[H]arpoon [N]ext" },
		},
		{
			"p",
			function()
				harpoon:list():prev({ ui_nav_wrap = true })
			end,
			{ desc = "[H]arpoon [P]rev" },
		},
		{
			"a",
			function()
				harpoon:list():add()
			end,
			{ desc = "[H]arpoon [A]dd" },
		},
		{
			"h",
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			{ desc = "[H]arpoon [H]arpoon menu" },
		},
	},
})

-- [[ UFO ]]
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		-- choose one of coc.nvim and nvim lsp
		vim.fn.CocActionAsync("definitionHover") -- coc.nvim
		vim.lsp.buf.hover()
	end
end)

-- [[ Remote ]]
vim.keymap.set("n", "<leader>rc", api.connect, { desc = "[R]emote [C]onnect " })
vim.keymap.set("n", "<leader>rd", api.disconnect, { desc = "[R]emote [D]isconnect " })
vim.keymap.set("n", "<leader>re", api.edit, { desc = "[R]emote [E]edit " })

-- [[ Oil ]]
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "[O]il in parent directory" })
vim.keymap.set("n", "<leader>O", "<CMD>Oil --float<CR>", { desc = "[O]il in parent directory - floating" })
