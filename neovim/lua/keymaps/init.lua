
-- telescope.nvim
vim.api.nvim_set_keymap("n", "<Leader>bb", ":<C-u>Telescope buffers<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fa", ":<C-u>Telescope live_grep<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>ff", ":<C-u>Telescope find_files<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", ":<C-u>DashboardFindHistory<CR>", {silent = true, noremap = true})

-- context searching
vim.api.nvim_set_keymap("n", "<Leader>cf", "<CR>", {})
