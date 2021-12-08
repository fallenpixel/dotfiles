source $HOME/.config/nvim/configs/plugins.vim
"" Completion
filetype plugin on
:filetype plugin indent on

"" Syntax Highlighting Options
let g:ansible_unindent_after_newline = 1
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
" Manage splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright



let mapleader=","

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" Set Colorscheme and Fonts
if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
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
set modeline
"" List Characters
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
nmap <leader>l :set list!<CR>
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" Linting/CodeDisplay
:syntax on
set colorcolumn=80
set statusline+=%{FugitiveStatusline()}
set statusline+=%#warningmsg#
set statusline+=%*
let g:indent_guides_enable_on_vim_startup = 1
nmap <leader>w :TagbarToggle<CR>
nmap <leader>q :NERDTreeToggle<CR>

" Control direction to move line
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

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
let g:tex_flavor='latex'

" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

" Eric's Custom Commands
nmap <leader>l :w <bar> !pdflatex % <CR> <CR>

map <C-t><up> :tabr<cr>/
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-t>t 	:tabnew<cr>


"LSP Config
lua << EOF
require'lspconfig'.ansiblels.setup{}
require'lspconfig'.terraform_lsp.setup{}
EOF
command! Config execute ":e $MYVIMRC"
