vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.python_host_prog = "/Users/rui.xiao/python-version/python2.7/bin/python"
-- vim.g.loaded_python2_provider = 1

require("plugins.plugins-setup")

require("core.options")
require("core.keymaps")


require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.comment")
require("plugins.telescope")
require("plugins.autopairs")
require("plugins.autocmd")
require("plugins.gitsigns")
require("plugins.autosession")
require("plugins.format")
require("plugins.search")
