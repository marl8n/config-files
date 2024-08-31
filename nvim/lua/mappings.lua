-- mappings.lua

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Custom mappings
map('n', '<leader>pv', ':Ex<CR>', opts)
map('n', '<leader>x', ':x<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>q!', ':qa!<CR>', opts)

-- LSP key mappings will be set in the lsp.lua file

