vim.g.auto_session_root_dir = "~/.config/nvim/session/"

require("auto-session").setup {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    auto_session_enabled = true,
}
