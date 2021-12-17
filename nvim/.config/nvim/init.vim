"--------------------------------------------------------------------------
" General Settings
"--------------------------------------------------------------------------
filetype plugin on
:filetype plugin indent on
let g:indent_guides_enable_on_vim_startup = 1
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set mouse=a
let g:tex_flavor='latex'
map <leader>pp :setlocal paste!<cr>
set splitbelow
set splitright
set number relativenumber
set autoread
set smartcase
set incsearch
set ai
set si
set wrap
set modeline
set colorcolumn=80
let g:ansible_unindent_after_newline = 1
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1

"--------------------------------------------------------------------------
" KeyMaps
"--------------------------------------------------------------------------
let mapleader = ","
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
" Allow gf to open non-existent files
map gf :edit <cfile><cr>
nmap <leader>l :set list!<cr>
map <C-t>h :tabr<cr>
map <C-t>l :tabl<cr>
map <C-t>k :tabp<cr>
map <C-t>j :tabn<cr>
map <C-t>t 	:tabnew<cr>
nmap <M-j> mz:m+<cr>`
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
nmap <leader>f <cmd>lua vim.lsp.buf.formatting_sync(nil, 100)<cr>
"--------------------------------------------------------------------------
" Spellchecking
"--------------------------------------------------------------------------
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
"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------
" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/vim-airline.vim
source ~/.config/nvim/plugins/gruvbox.vim
" source ~/.config/nvim/plugins/nightfox.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/signify.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/tagbar.vim
source ~/.config/nvim/plugins/indent-guides.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/nerdcommenter.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/lsp-completion.vim
source ~/.config/nvim/plugins/colorizer.vim
source ~/.config/nvim/plugins/lion.vim
source ~/.config/nvim/plugins/peekabo.vim
source ~/.config/nvim/plugins/targets.vim
source ~/.config/nvim/plugins/floatingterm.vim
source ~/.config/nvim/plugins/easyalign.vim
" source ~/.config/nvim/plugins/lualine.vim
" source ~/.config/nvim/plugins/whichkeys.vim
call plug#end()
doautocmd User PlugLoaded
