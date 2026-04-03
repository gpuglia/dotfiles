set nocompatible
packadd matchit

" vim-tmux-navigator: don't wrap at edges
let g:tmux_navigator_no_wrap = 1
" Disable default mappings so Ctrl+\ is free for toggleterm
let g:tmux_navigator_no_mappings = 1

call plug#begin()
Plug 'AndrewRadev/splitjoin.vim'
Plug 'akinsho/toggleterm.nvim', {'tag': '*'}
Plug 'benmills/vimux'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'lewis6991/gitsigns.nvim'
Plug 'jgdavey/tslime.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'keith/investigate.vim'
Plug 'mileszs/ack.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'main', 'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'Raimondi/delimitMate'
Plug 'RRethy/nvim-treesitter-endwise'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'https://codeberg.org/andyg/leap.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim', { 'branch': 'v3.x' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

" Language server management
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" LSP support
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'Saghen/blink.cmp', { 'tag': 'v0.*', 'do': 'cargo build --release' }
Plug 'saghen/blink.compat', { 'tag': '2.*' }

" AI autocomplete
Plug 'supermaven-inc/supermaven-nvim'

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

" Tree navigation
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Sidekick - symbol outline
" Sidekick - AI assistant (NES + CLI terminal)
Plug 'folke/sidekick.nvim'

" Neotest - testing framework
Plug 'nvim-neotest/nvim-nio'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'olimorris/neotest-rspec'
Plug 'zidhuss/neotest-minitest'
Plug 'nvim-neotest/neotest-python'
Plug 'fredrikaverpil/neotest-golang'
Plug 'jfpedroza/neotest-elixir'

" Colors
Plug 'rktjmp/lush.nvim'
Plug 'metalelf0/jellybeans-nvim'
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
if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme jellybeans-nvim
" colorscheme rose-pine
" colorscheme catppuccin-mocha

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

" Appearance
set t_ut=
set number
set ruler
set cursorline
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

" vim-tmux-navigator keymaps (manual, since we disabled defaults to free Ctrl+\)
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" faster splits
nnoremap <silent> vv :vsp<CR>
" nnoremap <silent> ss :sp<CR>
nnoremap <silent> <Leader>qo :copen<CR>
nnoremap <silent> <Leader>qc :ccl<CR>


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>



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

" Lazygit
nnoremap <Leader>lg :LazyGit<CR>

" Neo-tree
nnoremap <Leader>e :Neotree toggle<CR>
nnoremap <Leader>ef :Neotree reveal<CR>
nnoremap <Leader>eb :Neotree toggle show buffers<CR>
nnoremap <Leader>eg :Neotree toggle show git_status<CR>

" Abbreviations
iabbr pry binding.pry


" Test-runner
nnoremap <leader>s :wa<CR>\|:TestNearest<CR>
nnoremap <leader>ra :wa<CR>\|:TestFile<CR>
nnoremap <leader>l :wa<CR>\|:TestLast<CR>
let test#strategy = "toggleterm"

let test#python#runner = 'pytest'
let test#python#pytest#executable = 'docker-compose exec web py.test'
" let test#java#runner = 'gradletest'

" rails specs
nnoremap <leader>a :A<CR>
nnoremap <leader>av :AV<CR>
nnoremap <leader>as :AS<CR>

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

" Old fzf mapping - commented out in favor of Telescope
" noremap <leader>ff :call fzf#vim#files('', { 'source': g:FzfFilesSource(),
"       \ 'options': [
"       \   '--tiebreak=index',
"       \   '--preview', g:fzf_preview_cmd
"       \  ]})<CR>
" nnoremap <silent> <leader>t :GFiles<cr>
nnoremap <silent> <C-p> :GFiles<cr>
nnoremap <silent> ,m :Marks<cr>
nnoremap <silent> ,cm :Commands<cr>

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
-- nvim-treesitter main branch: setup only handles parser installation
require('nvim-treesitter').setup({
  ensure_installed = { "vim", "javascript", "ruby", "kotlin", "markdown", "typescript", "python", "go", "elixir", "sql", "dockerfile" },
})

-- nvim-treesitter-textobjects: keymaps must be registered manually (new API no longer reads them from setup())
require('nvim-treesitter-textobjects').setup({
  select = { lookahead = true },
  move  = { set_jumps = true },
})

local ts_select = require('nvim-treesitter-textobjects.select')
local ts_move   = require('nvim-treesitter-textobjects.move')

-- Select text objects (operator-pending + visual)
local select_maps = {
  ["af"] = "@function.outer",
  ["if"] = "@function.inner",
  ["ac"] = "@class.outer",
  ["ic"] = "@class.inner",
  ["aa"] = "@parameter.outer",
  ["ia"] = "@parameter.inner",
  ["ab"] = "@block.outer",
  ["ib"] = "@block.inner",
}
for key, query in pairs(select_maps) do
  vim.keymap.set({ "x", "o" }, key, function() ts_select.select_textobject(query, "textobjects") end, { desc = "TS select " .. query })
end

-- Move to next/previous function/class
vim.keymap.set({ "n", "x", "o" }, "]f", function() ts_move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function start" })
vim.keymap.set({ "n", "x", "o" }, "]c", function() ts_move.goto_next_start("@class.outer",    "textobjects") end, { desc = "Next class start" })
vim.keymap.set({ "n", "x", "o" }, "]F", function() ts_move.goto_next_end("@function.outer",   "textobjects") end, { desc = "Next function end" })
vim.keymap.set({ "n", "x", "o" }, "]C", function() ts_move.goto_next_end("@class.outer",      "textobjects") end, { desc = "Next class end" })
vim.keymap.set({ "n", "x", "o" }, "[f", function() ts_move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev function start" })
vim.keymap.set({ "n", "x", "o" }, "[c", function() ts_move.goto_previous_start("@class.outer",    "textobjects") end, { desc = "Prev class start" })
vim.keymap.set({ "n", "x", "o" }, "[F", function() ts_move.goto_previous_end("@function.outer",   "textobjects") end, { desc = "Prev function end" })
vim.keymap.set({ "n", "x", "o" }, "[C", function() ts_move.goto_previous_end("@class.outer",      "textobjects") end, { desc = "Prev class end" })

-- Incremental selection (native Neovim treesitter API)
vim.keymap.set("n", "gnn", function() vim.treesitter.start() end,             { desc = "Start treesitter selection" })
vim.keymap.set("x", "grn", function() vim.treesitter.node_incremental() end,  { desc = "Expand to parent node" })
vim.keymap.set("x", "grc", function() vim.treesitter.scope_incremental() end, { desc = "Expand to enclosing scope" })
vim.keymap.set("x", "grm", function() vim.treesitter.node_decremental() end,  { desc = "Shrink to child node" })

-- Highlighting, indentation, and folding via FileType autocmd (pure lua, no vimscript mixing)
local ts_filetypes = { "javascript", "typescript", "typescriptreact", "ruby", "python", "go", "elixir", "kotlin", "lua", "vim", "markdown", "sql", "dockerfile" }
vim.api.nvim_create_autocmd("FileType", {
  pattern = ts_filetypes,
  callback = function()
    vim.treesitter.start()
    vim.wo[0][0].foldmethod = "expr"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldenable = false
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
EOF

" Leap
lua << EOF
local leap = require('leap')
-- Set up default mappings (s, S, gs)
vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
EOF

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
" lua << EOF
" local status, nvim_lsp = pcall(require, "lspconfig")
" if (not status) then return end

" local protocol = require('vim.lsp.protocol')

" local on_attach = function(client, bufnr)
"   -- format on save
"   if client.server_capabilities.documentFormattingProvider then
"     vim.api.nvim_create_autocmd("BufWritePre", {
"       group = vim.api.nvim_create_augroup("Format", { clear = true }),
"       buffer = bufnr,
"       callback = function() vim.lsp.buf.formatting_seq_sync() end
"     })
"   end
" end

" -- Typescript
" nvim_lsp.tsserver.setup {
"   on_attach = on_attach,
"   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
"   cmd = { "typescript-language-server", "--stdio" }
" }
" EOF

" nvim-tree
lua << EOF
require("nvim-tree").setup {
  view = {
    width = 40,
  },
}
EOF

" neo-tree
lua << EOF
require("neo-tree").setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  window = {
    width = 40,
  },
  filesystem = {
    follow_current_file = { enabled = true },
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  buffers = {
    follow_current_file = { enabled = true },
  },
})
EOF

" treesitter-endwise (no config needed, works automatically)

" Save before make
" autocmd BufWritePost <buffer> make

" LSP
lua <<EOF
-- Suppress lspconfig deprecation warning until mason-lspconfig updates
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Filter out the lspconfig deprecation warning
local notify = vim.notify
vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:match("lspconfig.*deprecated") then
    return
  end
  notify(msg, level, opts)
end

-- Also suppress vim.deprecate warnings from lspconfig
local deprecate = vim.deprecate
vim.deprecate = function(...)
  local args = {...}
  if args[1] and type(args[1]) == "string" and args[1]:match("lspconfig") then
    return
  end
  deprecate(...)
end

local lsp_zero = require('lsp-zero')

-- Common capabilities for all servers
local function get_capabilities()
  local caps = vim.lsp.protocol.make_client_capabilities()
  caps = vim.tbl_deep_extend('force', caps, require('blink.cmp').get_lsp_capabilities())
  return caps
end

-- Common on_attach for all servers
local function on_attach(client, bufnr)
  -- lsp-zero default keymaps
  lsp_zero.default_keymaps({buffer = bufnr})
end

-- Setup Mason-managed servers
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = get_capabilities(),
        on_attach = on_attach,
      })
    end,
  }
})

-- Setup ruby-lsp separately (installed globally, not via Mason)
require('lspconfig').ruby_lsp.setup({
  cmd = { "ruby-lsp" },
  capabilities = get_capabilities(),
  on_attach = on_attach,
})

-- Setup kotlin-language-server separately (installed via Homebrew)
require('lspconfig').kotlin_language_server.setup({
  cmd = { "/opt/homebrew/bin/kotlin-lsp" },
  capabilities = get_capabilities(),
  on_attach = on_attach,
  filetypes = { "kotlin" },
  root_dir = require('lspconfig').util.root_pattern("settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", ".git"),
})

-- Copilot LSP (for sidekick.nvim NES)
vim.lsp.enable("copilot")
EOF

" Blink completion setup
lua <<EOF
local blink = require('blink.cmp')

require('blink.cmp').setup({
  -- 'default' for control-y, 'super-tab' for tab, 'enter' for enter
  -- or 'full' for all of the above
  keymap = {
    preset = 'enter',
    ['<Tab>'] = {
      'snippet_forward',
      function() -- sidekick next edit suggestion
        return require('sidekick').nes_jump_or_apply()
      end,
      'fallback',
    },
    ['<C-l>'] = { 'select_and_accept', 'fallback' }, -- alternative accept for Blink
    ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },

  completion = {
    list = {
      selection = {
        preselect = true,
        auto_insert = true
      }
    },
    menu = {
      draw = {
        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
      }
    }
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'supermaven' },
    providers = {
      supermaven = {
        name = 'supermaven',
        module = 'blink.compat.source',
      },
    },
  },
})

EOF

" Supermaven
lua << EOF
require("supermaven-nvim").setup({
  disable_inline_completion = true, -- blink.cmp handles display
  disable_keymaps = true,           -- blink.cmp handles acceptance
})
EOF

" Running files
autocmd FileType elixir nnoremap <leader>x :w<CR>:TermExec cmd="elixir %"<CR>
autocmd FileType ruby   nnoremap <leader>x :w<CR>:TermExec cmd="ruby %"<CR>
autocmd FileType go     nnoremap <leader>x :w<CR>:TermExec cmd="go run %"<CR>
autocmd FileType rust   nnoremap <leader>x :w<CR>:TermExec cmd="cargo run"<CR>

" Neotest configuration
lua << EOF
require("neotest").setup({
  adapters = {
    require("neotest-rspec")({
      rspec_cmd = function()
        -- Check if bin/rspec exists in the project root
        if vim.fn.filereadable("bin/rspec") == 1 then
          return vim.tbl_flatten({
            "bin/rspec",
          })
        else
          return vim.tbl_flatten({
            "bundle",
            "exec",
            "rspec",
          })
        end
      end
    }),
    require("neotest-minitest"),
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-golang"),
    require("neotest-elixir"),
  },
})
EOF

" Neotest keymaps (using ,t* prefix)
" vim-test uses: <leader>s, <leader>ra, <leader>l
" neotest uses: <leader>t* prefix
nnoremap <silent> <leader>tn :echo "Testing nearest"<CR>:lua require("neotest").run.run()<CR>
nnoremap <silent> <leader>tf :echo "Testing file"<CR>:lua require("neotest").run.run(vim.fn.expand("%"))<CR>
nnoremap <silent> <leader>tl :echo "Testing last"<CR>:lua require("neotest").run.run_last()<CR>
nnoremap <silent> <leader>td :echo "Debug test"<CR>:lua require("neotest").run.run({strategy = "dap"})<CR>
nnoremap <silent> <leader>ts :echo "Stopping test"<CR>:lua require("neotest").run.stop()<CR>
nnoremap <silent> <leader>ta :echo "Attaching to test"<CR>:lua require("neotest").run.attach()<CR>
nnoremap <silent> <leader>to :lua require("neotest").output.open({ enter = true })<CR>
nnoremap <silent> <leader>tO :lua require("neotest").output_panel.toggle()<CR>
nnoremap <silent> <leader>tt :lua require("neotest").summary.toggle()<CR>

" Toggleterm configuration
lua << EOF
require("toggleterm").setup({
  open_mapping = [[<C-\>]],
  direction = "float",
  float_opts = {
    border = "curved",
    width = math.floor(vim.o.columns * 0.85),
    height = math.floor(vim.o.lines * 0.85),
  },
  shade_terminals = true,
  persist_mode = true,
})
EOF

" Lualine configuration
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      'filename',
      {
        function() return " " end,
        color = function()
          local status = require("sidekick.status").get()
          if status then
            return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
          end
        end,
        cond = function()
          return require("sidekick.status").get() ~= nil
        end,
      },
    },
    lualine_x = {
      {
        function()
          local status = require("sidekick.status").cli()
          return " " .. (#status > 1 and #status or "")
        end,
        cond = function()
          return #require("sidekick.status").cli() > 0
        end,
        color = function() return "Special" end,
      },
      'encoding', 'fileformat', 'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF

" Sidekick
lua << EOF
require("sidekick").setup({
  cli = {
    mux = {
      backend = "tmux",
      enabled = true,
    },
    picker = "telescope", -- you have telescope, not snacks.nvim
  },
})

-- Workaround: vim.tbl_filter requires true, but string.find returns a number
local config = require("sidekick.config")
config.is_copilot = function(client)
  local name = type(client) == "table" and client.name or client
  return name and name:lower():find("copilot") ~= nil
end
EOF

" NES: jump to / apply next edit suggestion (<Tab> handled via blink.cmp above)
nnoremap <silent> <Tab> :lua require('sidekick').nes_jump_or_apply()<CR>

" CLI keymaps
nnoremap <silent> <leader>aa :lua require("sidekick.cli").toggle()<CR>
nnoremap <silent> <leader>as :lua require("sidekick.cli").select()<CR>
nnoremap <silent> <leader>ad :lua require("sidekick.cli").close()<CR>
nnoremap <silent> <leader>ap :lua require("sidekick.cli").prompt()<CR>
xnoremap <silent> <leader>ap :lua require("sidekick.cli").prompt()<CR>
nnoremap <silent> <leader>af :lua require("sidekick.cli").send({ msg = "{file}" })<CR>
nnoremap <silent> <leader>at :lua require("sidekick.cli").send({ msg = "{this}" })<CR>
xnoremap <silent> <leader>at :lua require("sidekick.cli").send({ msg = "{this}" })<CR>
xnoremap <silent> <leader>av :lua require("sidekick.cli").send({ msg = "{selection}" })<CR>
nnoremap <silent> <leader>ac :lua require("sidekick.cli").toggle({ name = "claude", focus = true })<CR>
noremap <silent> <C-.> :lua require("sidekick.cli").focus()<CR>
tnoremap <silent> <C-.> <C-\><C-n>:lua require("sidekick.cli").focus()<CR>

" Gitsigns
lua << EOF
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']g', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[g', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})
EOF
