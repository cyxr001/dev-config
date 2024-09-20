require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    -- 确保安装，根据需要填写
    ensure_installed = {
        "lua_ls",
        "gopls",
        "pyright",
        "tsserver",
        "rust_analyzer",
    },
})



local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), cmp_capabilities)


local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true), },
        }
    }
}
lspconfig.rust_analyzer.setup{
    -- on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.pyright.setup {}

lspconfig.tsserver.setup {
    capabilities = capabilities,
    -- root_dir = utils.root_pattern("cargo.toml"),
    settings = {
        ["rust_analyzer"] = {
            cargo = {
                allFeatures = true,
            }
        }
    }
}
lspconfig.clangd.setup {
    filetypes = { "c", "cpp" },
}
lspconfig.gopls.setup({
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            env = {
                CGO_ENABLED = "1",
            },
            buildFlags = {"-tags=cgo", "-tags=python"},
            -- gofumpt = true,
        },
    },
})


--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        --    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        --    vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references(), { noremap = true, silent = true })
        -- vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end,
        vim.keymap.set('n', 'gr', function() require('fzf-lua').lsp_references({ignore_current_line = true}) end,
            { noremap = true, silent = true })

        -- vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions() end,
        vim.keymap.set('n', 'gd', function() require('fzf-lua').lsp_definitions({ jump_to_single_result = true }) end,
            { noremap = true, silent = true })

        -- vim.keymap.set('n', 'gi', function() require('telescope.builtin').lsp_implementations() end,
        vim.keymap.set('n', 'gi', function() require('fzf-lua').lsp_implementations() end,
            { noremap = true, silent = true })

        vim.keymap.set('n', '<leader>aa', function()
            vim.lsp.buf.format { --[[ async = true ]] }
        end, opts)
    end,
})
