" Install Plugins if not installed
if empty(glob('~/.local/share/nvim/plugged'))
  autocmd VimEnter * PlugInstall --sync 
endif
call plug#begin('~/.local/share/nvim/plugged')
" Theming
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'juliosueiras/vim-terraform-snippets'
" Linting
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Git functionality
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
"" Print current method/function in statusline
Plug 'majutsushi/tagbar'
"" Syntax highlighting
Plug 'sheerun/vim-polyglot'
"" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'
"" Color scheme
Plug 'rktjmp/lush.nvim', { 'branch': 'main' }
Plug 'ellisonleao/gruvbox.nvim', { 'branch': 'main' }
" NerdTree and Commenter
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
Plug 'hrsh7th/cmp-cmdline', { 'branch': 'main' }
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
call plug#end()
