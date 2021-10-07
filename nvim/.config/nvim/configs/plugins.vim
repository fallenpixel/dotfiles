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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Git functionality
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Interactive Scratchpad
Plug 'metakirby5/codi.vim'
"" Print current method/function in statusline
Plug 'majutsushi/tagbar'
"" Syntax highlighting
Plug 'sheerun/vim-polyglot'
"" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'
"" Color scheme
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
" NerdTree and Commenter
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
" Ansible
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh --output yaml.snippets' }
call plug#end()
