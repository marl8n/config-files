-- mappings.lua

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- NERDTree toggle
map('n', '<leader>nt', ':NERDTreeToggle<CR>', opts)

-- LSP key mappings will be set in the lsp.lua file
