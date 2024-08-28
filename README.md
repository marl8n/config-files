# Neovim Configuration Setup

This guide will help you configure Neovim from scratch using `vim-plug`, with support for file navigation (NERDTree), LSP (Language Server Protocol), and autocompletion.

## Prerequisites

- **Neovim** installed (`v0.5.0` or later)
- **Node.js** installed (required for LSP servers like TypeScript and Python)
- **vim-plug** installed (plugin manager for Neovim)
  - Installation: https://github.com/junegunn/vim-plug#installation

## Setup Instructions

1. **Clone the configuration file:**
   
   Create the following directory and file:

   ```bash
   mkdir -p ~/.config/nvim
   touch ~/.config/nvim/init.vim

2. **Copy the configuration**

Paste the contents of the provided init.vim file into
~/.config/nvim/init.vim

3. **Install plugins**

```vim
:PlugInstall
```

4. **Install LSP Servers**

Install the required language servers:

- **Python (pyright):**
```bash
npm install -g pyright
```

- **TypeScript/JavaScript (tsserver):**

```bash
npm install -g typescript typescript-language-server
```

- **Lua (lua-language-server)**

```bash
brew install lua-language-server
```

5. **Start Neovim:**

Launch Neovim and enjoy your setup!

## Usage

- Toggle NERDTree: Press <leader>nt (space + n + t) to toggle the file explorer.
- LSP Keybindings: Use common LSP shortcuts like gd for go to definition, K for hover, and <leader>f for formatting.
- Autocompletion: Start typing, and suggestions will appear automatically.

That’s it! Your Neovim is now configured with LSP support and autocompletion.

