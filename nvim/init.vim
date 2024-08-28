" Set spacebar as the leader key
let mapleader = " "

" Plugin section
call plug#begin('~/.config/nvim/plugged')

" NERDTree plugin
Plug 'preservim/nerdtree'

" LSP configuration plugin
Plug 'neovim/nvim-lspconfig'

" Autocompletion plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

" Map <leader>nt to toggle NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>

" Configure the built-in LSP client
lua << EOF
local nvim_lsp = require('lspconfig')

-- Key mappings for LSP
local on_attach = function(_, bufnr)
  local opts = { noremap=true, silent=true }
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Key mappings
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Enable LSP servers
nvim_lsp.pyright.setup { on_attach = on_attach }      -- Python
nvim_lsp.tsserver.setup { on_attach = on_attach }     -- TypeScript/JavaScript
nvim_lsp.lua_ls.setup {                              -- Lua
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
}
EOF

" Autocompletion setup using nvim-cmp
lua << EOF
local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'vsnip' },
  },
}
EOF

" Basic settings
set number                " Show line numbers
set relativenumber        " Show relative line numbers
set tabstop=4             " Number of spaces in a tab
set shiftwidth=4          " Number of spaces to use for autoindent
set expandtab             " Convert tabs to spaces
set ignorecase            " Ignore case when searching
set smartcase             " Override ignorecase if search contains capitals
set clipboard=unnamedplus " Use system clipboard

" Color scheme
colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
