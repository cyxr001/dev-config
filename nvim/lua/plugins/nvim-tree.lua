require("nvim-tree").setup({
    filters = { dotfiles = false, custom = { '^.git$' }}
})


vim.api.nvim_set_keymap('n', '<Leader>b', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

