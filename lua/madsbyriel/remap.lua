vim.g.mapleader = " "

-- General
-- Exit and go to directory view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Insert ';' at the end of the line
vim.keymap.set("n", "<leader>;", '$a;', { noremap = true })


-- Fugitive
-- Open up the Git window from fugitive
vim.keymap.set("n", "<leader>g", ":G<CR>", { noremap = true })

-- Start a commit message
vim.keymap.set("n", "<leader>gc", ":G commit<CR>", { noremap = true })

-- Push commits
vim.keymap.set("n", "<leader>gp", ":G push<CR>", { noremap = true })

