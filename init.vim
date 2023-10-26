set nocompatible

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'benmills/vimux'
Plug 'bling/vim-airline'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ecomba/vim-ruby-refactoring'
" Plug 'elixir-lang/vim-elixir'
Plug 'hrsh7th/nvim-cmp'
" Plug 'jalvesaq/Nvim-R'
Plug 'jgdavey/tslime.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kana/vim-textobj-user'
Plug 'keith/investigate.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'mileszs/ack.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'nelstrom/vim-markdown-folding'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'onsails/lspkind.nvim'
Plug 'Raimondi/delimitMate'
Plug 'RRethy/nvim-treesitter-endwise'
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
" Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline-themes'
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'w0rp/ale'
Plug 'ggandor/leap.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-tree/nvim-web-devicons'

" Tree navigation
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" JS/TS
Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'

" Plug 'YankRing.vim'
if has('nvim')
  " Plug 'autozimu/LanguageClient-neovim', {
  "   \ 'branch': 'next',
  "   \ 'do': 'bash install.sh',
  "   \ }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Colors
Plug 'rktjmp/lush.nvim'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'whatyouhide/vim-gotham'
Plug 'ksevelyar/joker.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'doums/darcula'
Plug 'lettertwo/laserwave.nvim'
Plug 'jonathanfilip/vim-lucius'
Plug 'lunacookies/vim-colors-xcode'
Plug 'Abstract-IDE/Abstract-cs'
Plug 'nyoom-engineering/oxocarbon.nvim'
Plug 'folke/tokyonight.nvim'

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
" set background=light
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_contrast_light="medium"
let g:challenger_deep_termcolors=16

if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme oxocarbon

" lua << EOF
" local lush = require('lush')
" local laserwave = require('laserwave')

" local spec = lush.extends({laserwave}).with(function()
"   return {
"     Comment { fg = laserwave.Comment.fg, bg = laserwave.Comment.bg, gui = "NONE" },
"   }
" end)

" lush(spec)
" EOF

let g:tokyonight_style = "day"
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
" set synmaxcol=128
"hi! link Search DiffAdd " better search highlighting
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
" nnoremap <silent> ss :sp<CR>
nnoremap <silent> <Leader>qo :copen<CR>
nnoremap <silent> <Leader>qc :ccl<CR>


" Telescope
nnoremap <leader>t <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Disable deoplete while in Telescope
autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)

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
nnoremap <Leader>gb  :Git blame<CR>
map <Leader>gh :GBrowse master:%<CR> " GitHub
map <Leader>gH :GBrowse! master:%<CR> " GitHub

" NERDTree
nnoremap <Leader>ntt :NvimTreeToggle<CR>
nnoremap <Leader>ntf :NvimTreeFindFile<CR>

" Abbreviations
iabbr pry binding.pry


" Test-runner
nnoremap <leader>s :wa<CR>\|:TestNearest<CR>
nnoremap <leader>ra :wa<CR>\|:TestFile<CR>
nnoremap <leader>l :wa<CR>\|:TestLast<CR>
let test#strategy = "vimux"

let test#python#runner = 'pytest'
let test#python#pytest#executable = 'docker-compose exec web py.test'
" let test#java#runner = 'gradletest'

" rails specs
nnoremap <leader>a :A<CR>
nnoremap <leader>av :AV<CR>
nnoremap <leader>as :AS<CR>

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
" nmap <leader>sp :set paste<CR>


" Golden ratio
let g:golden_ratio_autocommand = 0

" SplitJoin
let g:splitjoin_ruby_curly_braces=0
let g:splitjoin_ruby_hanging_args=0

" Ack
nnoremap <Leader>gg :Ack! -g "!spec"<Space>
" nnoremap <S-k> :Ack! <C-R><C-W><CR>
nnoremap <S-k> :Ack! <CR>

if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" fzf
function! g:FzfFilesSource()
  let l:base = fnamemodify(expand('%'), ':h:.:S')
  let l:proximity_sort_path = $HOME . '/.cargo/bin/proximity-sort'

  if base == '.'
    "f you prefer something like git ls-files, use that here instead!
    return 'rg --files'
  else
    return printf('rg --files | %s %s', l:proximity_sort_path, expand('%'))
  endif
    " return 'rg --files'
endfunction

function! RipgrepFzf(query, fullscreen)
  " Use proximity sorting
  let l:proximity_sort_path = $HOME . '/stripe/.cargo/bin/proximity-sort'
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s | %s %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query), l:proximity_sort_path, expand('%'))
  let reload_command = printf(command_fmt, '{q}', l:proximity_sort_path, expand('%'))

  " let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -U -- %s || true'
  " let initial_command = printf(command_fmt, shellescape(a:query))
  " let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
let g:fzf_preview_cmd = g:plug_home . "/fzf.vim/bin/preview.sh {}"

noremap <leader>ff :call fzf#vim#files('', { 'source': g:FzfFilesSource(),
      \ 'options': [
      \   '--tiebreak=index',
      \   '--preview', g:fzf_preview_cmd
      \  ]})<CR>
" nnoremap <silent> <leader>t :GFiles<cr>
nnoremap <silent> ,b :Buffers<cr>
nnoremap <silent> <C-p> :GFiles<cr>
nnoremap <silent> ,m :Marks<cr>
nnoremap <silent> ,cm :Commands<cr>
" nnoremap <Leader>gg :RG<CR>
" nnoremap <S-k> :Rg <C-R><C-W><CR>

" autocmd BufReadPost *.kt setlocal filetype=kotlin
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ 'kotlin': ['kotlin-language-server'],
"     \ }
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" set shell=/bin/bash\ --norc\ -i

" Vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vc :VimuxClearRunnerHistory<CR>
map <Leader>vx :VimuxInterruptRunner<CR>

map <Leader>z :VimuxZoomRunner<CR>

" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "vim", "ruby", "kotlin", "typescript", "python"},
  auto_install = true,

   highlight = {
    enable = true,
    disable = {},
   },

   indent = {
     enable = true
   }
}
EOF

" Leap
lua require('leap').add_default_mappings()

" Goyo
" From https://github.com/junegunn/goyo.vim
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Language server
lua << EOF
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

-- Typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
EOF

" nvim-tree
lua << EOF
require("nvim-tree").setup {
  view = {
    width = 40,
  },
}
EOF

" treesitter-endwise
lua << EOF
require('nvim-treesitter.configs').setup {
    endwise = {
        enable = true,
    },
}
EOF
