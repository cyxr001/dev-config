local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'wbthomason/packer.nvim',
    "folke/tokyonight.nvim",
    'nvim-lualine/lualine.nvim',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    "christoomey/vim-tmux-navigator",
    "nvim-treesitter/nvim-treesitter",
    "p00f/nvim-ts-rainbow",
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
        "neovim/nvim-lspconfig"
    },

    "numToStr/Comment.nvim", -- gcc和gc注释
    "windwp/nvim-autopairs", -- 自动补全括号
    "ellisonleao/gruvbox.nvim",
    -- 自动补全
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path", -- 文件路径

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    { "catppuccin/nvim",                          as = "catppuccin" },
    'Mofiqul/vscode.nvim',
    'lewis6991/gitsigns.nvim',
    'rmagatti/auto-session',
    "sindrets/diffview.nvim",
    'mfussenegger/nvim-lint',
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        -- config = function()
        --     require("your.null-ls.config") -- require your null-ls config here (example below)
        -- end,
    },
    "jose-elias-alvarez/null-ls.nvim",
    "windwp/nvim-ts-autotag",
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}

local opts = {} -- 注意要定义这个变量

require("lazy").setup(plugins, opts)
