
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true })

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>sf', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>sg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
