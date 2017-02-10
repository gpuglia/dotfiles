set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rking/ag.vim'
" Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
" Plugin 'YankRing.vim'

call vundle#end()
filetype plugin indent on

" General
syntax enable
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite
set autoread
set clipboard=unnamed
set noerrorbells
set novisualbell

" Appearance
let base16colorspace=256
set background=dark
set number
set ruler
set nocursorline
set showcmd
set scrolloff=5
set hidden
set nowrap
set novisualbell
set list listchars=tab:»·,trail:·,nbsp:·
set ttyfast
set lazyredraw
set synmaxcol=128
hi! link Search DiffAdd " better search highlighting

" Mouse
set mousehide
set mouse=a

" Tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Wildmenu
set wildmenu
set wildmode=longest,list

" Searching
set hlsearch " highlight search results
nohlsearch " stop highlighting when opening a new file
set incsearch
set ignorecase
set smartcase

" Panes
set splitright
set splitbelow
" set winheight=5
" set winminheight=5
" set winheight=999

" Mappings
let mapleader=','

nnoremap <Leader><Leader> <c-^>

" clear search buffer
nnoremap <silent> // :nohlsearch<CR>

" easier navigation between split windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" faster splits
nnoremap <silent> vv :vsp<CR>
nnoremap <silent> ss :sp<CR>
nnoremap <silent> <Leader>qc :ccl<CR>

" Ag
let g:ag_working_path_mode="r"
nnoremap <Leader>gg :Ag
nnoremap <S-k> :Ag <C-R><C-W><CR>

" Ctrl-p
let g:ctrlp_map = "<Leader>t"
let g:ctrlp_user_command = "ag %s -l --nocolor -g ''"
nnoremap <silent> ,b :CtrlPBuffer<cr> " CtrlP on buffers

" Rails navigation
map <Leader>ja :CtrlP app/assets<CR>
map <Leader>jc :CtrlP app/controllers<CR>
map <Leader>jm :CtrlP app/models/<CR>
map <Leader>jv :CtrlP app/views<CR>
map <Leader>jh :CtrlP app/helpers<CR>
map <Leader>jl :CtrlP lib<CR>
map <Leader>jp :CtrlP public<CR>
map <Leader>js :CtrlP spec<CR>
map <Leader>jd :CtrlP db<CR>

" Ember navigation
map <Leader>jt :CtrlP app/templates<CR>
map <Leader>jo :CtrlP app/components<CR>

" Ctags
map <Leader>ct :!ctags -R .<CR>
nnoremap <silent> ,f <C-]> " jump to tag
nnoremap <silent> ,F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr> " jump to tag in vetical split

" Fugitive
nnoremap <Leader>gs  :Gstatus<CR>
nnoremap <Leader>gd  :Gdiff<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gw  :Gwrite<CR>
nnoremap <Leader>gr  :Gread<CR>
nnoremap <Leader>gb  :Gblame<CR>

" Airline
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Abbreviations
iabbr pry binding.pry

" vim-rspec
nnoremap <leader>s :wa<CR>\|:call RunNearestSpec()<CR>
nnoremap <leader>a :w<CR>\|:call RunCurrentSpecFile()<CR>
nnoremap <leader>l :w<CR>\|:call RunLastSpec()<CR>

" tab completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" promote to let
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" copy filename
nmap <leader>cf :let @*=expand("%")<CR>
nmap <leader>cl :let @*=expand("%:p")<CR>

" Misc
nmap 0 ^
" inoremap <C-S> :w<CR>
"
" File execution
nmap <leader>x :w<CR>:make<CR>

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
