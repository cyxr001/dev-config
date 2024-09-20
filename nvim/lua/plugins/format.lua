require("mason-null-ls").setup({
    ensure_installed = {
        "prettier",
        -- Opt to list sources here, when available in mason.
    },
    automatic_installation = false,
    handlers = {},
})
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local null_ls = require("null-ls")
-- null_ls.setup(
--     {
--         source = {
--             null_ls.builtins.formatting.prettier,
--         },
--         on_attach = function(client, bufnr)
--             if client.supports_method("textDocument/formatting") then
--                 vim.api.nvim_clear_autocmds({
--                     group = augroup,
--                     buffer = bufnr,
--                 })
--                 vim.api.nvim_create_autocmd("BufWritePre", {
--                     group = augroup,
--                     buffer = bufnr,
--                     callback = function()
--                         vim.lsp.buf.format({ bufnr = bufnr })
--                     end
--                 })
--             end
--         end,
--     }
-- )

local function format_on_save(use_null_ls, pattern)
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = pattern,
        callback = function()
            vim.lsp.buf.format({
                filter = function(client)
                    return (client.name == "null-ls") == use_null_ls
                end,
            })
        end,
    })
end

format_on_save(true, {
    "*.js",
    "*.jsx",
    "*.ts",
    "*.tsx",
    "*.json",
    "*.yaml",
    "*.yml",
})

--
vim.keymap.set('n', '<leader>aa', function()
    vim.lsp.buf.format({
        filter = function(client)
            return client.name == "null-ls"
        end
    })
end)
