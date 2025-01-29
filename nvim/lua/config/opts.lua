vim.opt.clipboard = "unnamedplus"

vim.opt.cursorline = true
--vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.showmode = false
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- preview substitutions while typing
vim.opt.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- tab size
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3

-- UFO - folding
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- spell check
--vim.opt.spelllang = "cs"
--vim.opt.spell = true
