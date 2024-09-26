-- lua/plugins/telescope.lua
local telescope = require('telescope')

telescope.setup{
  defaults = {
    -- Default configuration for Telescope
  },
  pickers = {
    -- Picker-specific configurations
  },
  extensions = {
    -- Extensions for Telescope
  }
}

-- Load the extension
telescope.load_extension('live_grep_args')
telescope.load_extension('harpoon')

-- Key mappings for Telescope
local builtin = require('telescope.builtin')
local extensions = telescope.extensions

vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', extensions.live_grep_args.live_grep_args, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })

-- Key mapping for Harpoon marks using Telescope
vim.keymap.set('n', '<leader>fm', extensions.harpoon.marks, { noremap = true, silent = true })
