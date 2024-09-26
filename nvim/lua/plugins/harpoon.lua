-- lua/plugins/harpoon.lua

-- Require Harpoon modules
local harpoon = require('harpoon')
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

local opts = { noremap = true, silent = true }

-- Add the current file to Harpoon
vim.api.nvim_set_keymap('n', '<leader>a', ":lua require('harpoon.mark').add_file()<CR>", opts)

-- Toggle harpoon quick menu
vim.api.nvim_set_keymap('n', '<leader>h', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

-- Navigate to files in Harpoon
vim.api.nvim_set_keymap('n', '<leader>1', ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>2', ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>3', ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>4', ":lua require('harpoon.ui').nav_file(4)<CR>", opts)

harpoon.setup({
    global_settings = {
        save_on_toggle = true,
        save_on_chanbe = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = { "harpoon" },
        mark_branch = false,
    }
})
