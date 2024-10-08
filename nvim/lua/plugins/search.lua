local fzf = require("fzf-lua")
-- require 'nvim-web-devicons'.setup()


local default_winopts = {
    height = 0.4,
    width = 1,
    row = 1,
    border = { "─", "─", "─", "", "", "", "", "" },
    hl = {
        cursorline = "visual",
    },
    preview = {
        delay = 0,
        -- vertical = "up:50%",
        horizontal = "right:50%",
    },
}

local no_preview_winopts = {
    preview = {
        hidden = "hidden",
    },
}

vim.keymap.set("n", "<leader>ff", fzf.files)
vim.keymap.set("n", "<leader>fo", fzf.oldfiles)
vim.keymap.set("n", "<leader>fb", fzf.buffers)
vim.keymap.set("n", "<leader>f/", function()
    local cwd
    if vim.bo.filetype == "NvimTree" then
        local node = require("nvim-tree.api").tree.get_node_under_cursor()
        if node.type == "file" then
            cwd = node.parent.absolute_path
        elseif node.type == "directory" then
            cwd = node.absolute_path
        end
        vim.cmd("wincmd l") -- avoid open file action from nvim-tree buffer
    else
        cwd = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
    end
    fzf.live_grep({ cwd = cwd })
end)
vim.keymap.set("n", "<leader>fg", fzf.live_grep)
vim.keymap.set("n", "<leader>fd", function()
    fzf.diagnostics_workspace({ severity_only = "error" })
end)
vim.keymap.set("n", "<leader>D", fzf.diagnostics_workspace)
vim.keymap.set("n", "<leader>gs", fzf.git_status)
vim.keymap.set("n", "<leader>gc", fzf.git_bcommits)
vim.keymap.set("n", "<leader>l", fzf.builtin)

fzf.register_ui_select()
fzf.setup({
    winopts = default_winopts,
    defaults = {
        git_icons = false,
    },
    fzf_opts = {
        ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history",
        ["--no-separator"] = "",
    },
    builtin = {
        winopts = default_winopts,
    },
    files = {
        cwd_prompt = false,
        winopts = no_preview_winopts,
    },
    oldfiles = {
        winopts = no_preview_winopts,
    },
    buffers = {
        winopts = no_preview_winopts,
    },
    grep = {
        rg_glob = true,
    },
    lsp = {
        async_or_timeout = 20000,
        jump_to_single_result = true,
        symbols = { symbol_style = 3 },
    },
    keymap = {
        fzf = {
            ["ctrl-n"] = "down",
            ["ctrl-p"] = "up",
            ["ctrl-j"] = "next-history",
            ["ctrl-k"] = "previous-history",
            ["ctrl-q"] = "select-all+accept",
            -- ["ctrl-1"] = "preview-page-down",
            -- ["ctrl-2"] = "preview-page-up",
        },
    },
})
