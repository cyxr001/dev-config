vim.g.mapleader = " "
vim.api.nvim_exec('language en_US.UTF-8', true)
-- vim.g.language = 'en_US'

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")
-- keymap.set("i", "<C-h>", "<left>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- keymap.set("n", "<M-b>", ":NvimTreeToggle<CR>")
keymap.set("n", "<C-d>", "10j")
keymap.set("n", "<C-u>", "10k")

keymap.set("n", "<leader>z", ":set wrap! wrap?<CR>")

-- keymap.set("n", "<leader>fw", ":w<CR>")
-- keymap.set("n", "<leader>fq", ":q<CR>")

keymap.set("n", "<leader>jj", ":%!jq .<CR>")
keymap.set("n", "<leader>jc", ":%!jq -c .<CR>")


keymap.set("n", "<leader>ss", ":mksession! ~/.config/nvim/session/mysession.vim<CR>")
keymap.set("n", "<leader>sl", ":source ~/.config/nvim/session/mysession.vim<CR>")
