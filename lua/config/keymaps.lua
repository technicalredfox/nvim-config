-- set leader keybinding to space
-- anywhere you see <leader> in a keybinding specifies the space key

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {desc = "remove search highlight"})

-- exit vim terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", {desc = "exit terminal mode"})

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {desc = "move focus to left window"})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {desc = "move focus to right window"})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {desc = "move focus to lower window"})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {desc = "move focus to upper window"})

-- window spliting
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", {desc = "[W]indow split [V]ertical"})
vim.keymap.set("n", "<leader>wh", ":hsplit<cr>", {desc = "[W]indow split [H]orizontal"})

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", {desc = "indent left in visual mode"})
vim.keymap.set("v", ">", ">gv", {desc = "indent right in visual mode"})

