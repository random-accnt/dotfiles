vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- sqlite3.dll
--vim.g.sqlite_clib_path = "C:/Users/jiric/Programs/sqlite-dll-win-x64-3460100/sqlite3.dll"
vim.g.mkpd_port = "1234"

-- opts
require("config.opts")

-- plugins
require("config.lazy")

-- mappings
require("mappings")
