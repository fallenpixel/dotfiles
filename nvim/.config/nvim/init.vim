call plug#begin('~/.local/share/nvim/plugged')
" Theming
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
" Coding
"" Python Syntax Highlighting
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"" Print current method/function in statusline
Plug 'majutsushi/tagbar'
"" Syntax highlighting
Plug 'vim-syntastic/syntastic'
"" Rainbow Parens
Plug 'junegunn/rainbow_parentheses.vim'
"" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'
"" Completion
filetype plugin on
:filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
Plug 'ajh17/VimCompletesMe'

" Functional
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

call plug#end()

let mapleader=","

" Set Colorscheme and Fonts
colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" Behavior
set mouse=a
set number
set autoread
set smartcase
set incsearch
set lazyredraw
set ai "Auto Indent
set si "Smart Indent
set wrap
"" List Characters
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
nmap <leader>l :set list!<CR>
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" Linting/CodeDisplay
:syntax on
set colorcolumn=80
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['flake8']
:command Sc :SyntasticCheck
let g:indent_guides_enable_on_vim_startup = 1
nmap <leader>e :Errors<CR> 
nmap <leader>( :RainbowParentheses!!<CR>
nmap <leader>w :TagbarToggle<CR>
nmap <leader>q :NerdTreeToggle<CR>

" Control direction to move line
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Spell Checking
map <leader>ss :setlocal spell!<cr>
set spelllang=en_us
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
set spellfile=~/.config/nvim/spellfile.add
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1
highlight SpellBad term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Paste from GUI
set pastetoggle=<F2>
map <leader>pp :setlocal paste!<cr>
