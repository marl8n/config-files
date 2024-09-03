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

-- Key mappings for Telescope
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', require('telescope').extensions.live_grep_args.live_grep_args, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { noremap = true, silent = true })
