set nocompatible

call plug#begin('~/.vim/bundle')
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bling/vim-airline'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'elixir-lang/vim-elixir'
Plug 'jgdavey/tslime.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kana/vim-textobj-user'
Plug 'keith/investigate.vim'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'liuchengxu/space-vim-theme'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'nelstrom/vim-markdown-folding'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'
Plug 'roman/golden-ratio'
Plug 'scrooloose/nerdtree'
Plug 'thoughtbot/vim-rspec'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline-themes'
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'vim-scripts/octave.vim'
" Plug 'jremmen/vim-ripgrep'
Plug 'w0rp/ale'
" Plug 'YankRing.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Colors
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'

call plug#end()


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
set noerrorbells visualbell t_vb=

" Colors
set background=dark
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_contrast_light="medium"
let g:gruvbox_plugin_hi_groups=1
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme gruvbox

" Airline
let g:airline_powerline_fonts = 1

" Appearance
set t_ut=
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
set guifont=Fira\ Mono:h16

" if filereadable(expand("~/.vimrc_background"))
"   source ~/.vimrc_background
" endif

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

" Filetypes
augroup filetype_markdown
  au!
  au FileType markdown setl tw=80
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt,ft} set filetype=markdown
augroup END

augroup filetype_python
  au!
  au FileType python setl sts=4 ts=4 sw=4
augroup END

augroup filetype_kotlin
  au!
  au FileType kotlin setl sts=4 ts=4 sw=4
augroup END

" Mappings
let mapleader=','

nnoremap <Leader>. <c-^>

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
let g:ackprg = 'ag --vimgrep'
" nnoremap <S-k> :Ag <C-R><C-W><CR>

" Ctrl-p

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

" Tabs
nnoremap <silent> <Leader>Tc :tabc<CR>
nnoremap <silent> <Leader>Te :tabe<CR>

" Fugitive
nnoremap <Leader>gs  :Gstatus<CR>
nnoremap <Leader>gd  :Gdiff<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gw  :Gwrite<CR>
nnoremap <Leader>gr  :Gread<CR>
nnoremap <Leader>gb  :Gblame<CR>
nnoremap <Leader>gh  :Gbrowse<CR> " GitHub

" NERDTree
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Abbreviations
iabbr pry binding.pry

" vim-rspec
" nnoremap <leader>s :wa<CR>\|:call RunNearestSpec()<CR>
" nnoremap <leader>ra :w<CR>\|:call RunCurrentSpecFile()<CR>
" nnoremap <leader>l :w<CR>\|:call RunLastSpec()<CR>

" Test-runner
nnoremap <leader>s :wa<CR>\|:TestNearest<CR>
nnoremap <leader>ra :wa<CR>\|:TestFile<CR>
nnoremap <leader>l :wa<CR>\|:TestLast<CR>

" rails specs
nnoremap <leader>a :A<CR>
nnoremap <leader>av :AV<CR>
nnoremap <leader>as :AS<CR>

" Golden Ratio
nnoremap <leader>rr :GoldenRatioResize<CR>
nnoremap <leader>rt :GoldenRatioToggle<CR>

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

" Tslime
let g:tslime_always_current_window = 1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Misc
" Move cursor to first character
nmap 0 ^
" inoremap <C-S> :w<CR>
"
" File execution
nmap <leader>x :w<CR>:make<CR>

" Markdown
let g:markdown_fenced_languages = ['ruby', 'html', 'python', 'bash=sh', 'javascript']

" Investigate
let g:investigate_use_dash=1

" Set paste
nmap <leader>sp :set paste<CR>

" EasyMotion
nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Golden ratio
let g:golden_ratio_autocommand = 0

" SplitJoin
let g:splitjoin_ruby_curly_braces=0
let g:splitjoin_ruby_hanging_args=0

" Ack
" nnoremap <Leader>gg :Ack! 
" nnoremap <S-k> :Ack! <C-R><C-W><CR>

if executable('rg')
  let g:ackprg = 'rg --vimgrep -S'
endif
"ALE
let g:ale_linters = {'markdown': ['proselint', 'writegood'], 'sql': ['sqlint']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_lint_delay = 1000
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)
nmap <leader>af <Plug>(ale_fix)

" CtrlP
" let g:ctrlp_map = "<Leader>t"
" nnoremap <silent> ,b :Buffers<cr> " CtrlP on buffers
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" fzf
nnoremap <silent> ,b :Buffers<cr>
nnoremap <silent> ,t :GFiles<cr>
nnoremap <Leader>gg :Rg<cr>
nnoremap <S-k> :Rg <C-R><C-W><CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

