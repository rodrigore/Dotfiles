" vim:fdm=marker

" Vim-Plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'andymass/vim-matchup'
Plug 'editorconfig/editorconfig-vim'
Plug 'enricobacis/paste.vim'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kana/vim-repeat'
Plug 'mg979/vim-visual-multi'
Plug 'nelstrom/vim-visual-star-search'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
Plug 'TaDaa/vimade' "pip3 install pynvim
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'

" autopairs
" Plug 'windwp/nvim-autopairs'
" Plug 'windwp/nvim-ts-autotag'

" Colorscheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'rose-pine/neovim'

" comment
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" colorizer
Plug 'norcalli/nvim-colorizer.lua'

" complete
" Plug 'github/copilot.vim'

" debug
Plug 'mfussenegger/nvim-dap'
" Plug 'rcarriga/nvim-dap-ui'

" filetype
" Plug 'nathom/filetype.nvim'

" Formatter
" Plug 'mhartington/formatter.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" flutter
Plug 'dart-lang/dart-vim-plugin'
Plug 'reisub0/hot-reload.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-lua/plenary.nvim'  "requirement for diffview
Plug 'sindrets/diffview.nvim'

" Indent
" Plug 'lukas-reineke/indent-blankline.nvim'

"nvim-cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" markdown
Plug 'ellisonleao/glow.nvim'

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" PHP
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }

" Scroll
Plug 'karb94/neoscroll.nvim'

" Snippet
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'

" Telescope
" Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim' " telescope requirement
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Test
Plug 'vim-test/vim-test'
Plug 'benmills/vimux'

" (neo)test
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'

" Terminal (mainly use for lazygit inside nvim)
Plug 'akinsho/toggleterm.nvim'

" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

" Tree-Sidebar navigation
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Trouble
" Plug 'kyazdani42/nvim-web-devicons' "already import in nvim-tree
Plug 'folke/trouble.nvim'

" UI
Plug 'edluffy/specs.nvim'

" vue
Plug 'leafOfTree/vim-vue-plugin'

" window maximizer
Plug 'declancm/windex.nvim'

" Add plugins to &runtimepath
call plug#end()
" }}}
" Base config {{{
let mapleader=','
set laststatus=3          " Make visible the status bar
syntax on                  " Turn on syntax highlighting
set grepprg='rg'           " Use ripgrep instead of grep
" set cursorline            " Highlight the current line
set visualbell            " Don't beep
set noerrorbells          " Don't beep
set hlsearch              " Highlight search
set incsearch             " Highlight while typing the search
set ignorecase            " Make search case-insensitive
set lazyredraw            " Redraw only when we need to
set conceallevel=1
set undofile               " Maintain undo history between sessions
set undodir=~/.vim/undodir "set dir for persistent undo
set number
set relativenumber
" set concealcursor=nc
" (do not redraw while running macros)

set noswapfile             " No swap files (I don't like files.swap)
set nobackup               " No backup files
set nowritebackup
set hidden                 " Open files without saving the current file
set autoread               " Allow read files that changes outside vim
set encoding=utf-8         " Set the encoding that is showing in the terminal
set fileencoding=utf-8     " Set the encoding of the file that is written
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

set nowrap                " Don't Wrap the text (windows size)
set linebreak             " Wrap at 'breakat' instead of the last character
set tabstop=4             " The width of a tab is four spaces
set shiftwidth=4          " Spaces to use when (auto)indent.
set softtabstop=4         " when hitting <BS>, pretend like a tab is removed, even if spaces"
set expandtab             " Use spaces instead of Tabs
set shiftround            " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent            " always set autoindenting on
set copyindent            " copy the previous indentation on autoindenting

" set formatoptions-=o      " Don't auto-comment the next line when pressing 'o'
" Actually is not working for me :'(
set wildmenu              " Autocomplete like zsh in command mode
set noshowmode            " Hide mode from bottom status
set scrolloff=999         " Keep the cursor vertically centered
set ttyfast               " For better redrawing when scrolling
set sidescroll=1          " Sensible Horizontal Scroll in Vim
setg fixendofline         " EOL
set cmdheight=1           " Better display for messages
set updatetime=300        " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c          " don't give |ins-completion-menu| messages.

set clipboard=unnamed      " Use system clipboard

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set termguicolors

set tags+=tags,tags.vendors

" statusline
set statusline=%=\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,
set noshowmode

" }}}
" Colorscheme {{{
"
set background=dark

" let g:tokyonight_dark_sidebar = 0
" let g:tokyonight_transparent_sidebar = 1
" colorscheme tokyonight

lua <<EOF
vim.g.nvcode_termcolors = 256

vim.o.background = "dark"

vim.g.tokyonight_dev = true
vim.g.tokyonight_style = "moon"
vim.g.tokyonight_sidebars = {
  "qf",
  "vista_kind",
  "terminal",
  "packer",
  "spectre_panel",
  "NeogitStatus",
  "help",
}
vim.g.tokyonight_cterm_colors = false
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = false
vim.g.tokyonight_colors = {}
-- vim.g.tokyonight_colors = { border = "orange" }

require("tokyonight").colorscheme()
EOF

lua <<EOF
require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'moon',
	bold_vert_split = true,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = true,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'rose' }
	}
})

-- set colorscheme after options
--vim.cmd('colorscheme rose-pine')
EOF

" ====================================================================
set noshowmode

" let g:lightline = {}
" let g:lightline.enable = {
"   \  'statusline': 0
"   \ }

" ~~~~ Statusline configuration ~~~~
function! RedrawModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi MyStatuslineAccent guifg=#565575
    hi MyStatuslineAccentBody guifg=#cbe3e7 guibg=#565575
    hi MyStatuslineAccentLabel guifg=#cbe3e7 guibg=#565575
    hi MyStatuslineFilename guifg=#91ddff guibg=#3E3859
    hi MyStatuslineSeparator guifg=#3E3859 guibg=#1e1c31
    hi MyStatuslineModified guifg=#3E3859
    hi MyStatuslineFiletype guifg=#3E3859
    hi MyStatuslineFiletypeBody guibg=#3E3859 guifg=#c991e1

    hi MyStatuslinePercentage guifg=#3E3859
    hi MyStatuslinePercentageBody guibg=#3E3859 guifg=#95ffa4

    hi MyStatuslineLineCol guifg=#3E3859
    hi MyStatuslineLineColBody guifg=#aaffe4 guibg=#3E3859
    hi MyStatuslineTestStatus guibg=#3E3859 guifg=#ffe9aa
    hi MyStatuslineLangServer guibg=#3E3859

    hi MyStatuslineReset guibg=#1e1c31 guifg=#1e1c31
  " Insert mode
  elseif a:mode == 'i'
    hi MyStatuslineAccentBody guifg=#ff8080
  " Replace mode
  elseif a:mode == 'R'
    hi MyStatuslineAccent ctermfg=8
    hi MyStatuslineFilename ctermfg=3
    hi MyStatuslineAccentBody ctermbg=8
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    hi MyStatuslineAccentBody guifg=#ffe9aa
  " Command mode
  elseif a:mode == 'c'
    hi MyStatuslineAccent ctermfg=8
    hi MyStatuslineFilename ctermfg=6
    hi MyStatuslineAccentBody ctermbg=8
  " Terminal mode
  elseif a:mode == 't'
    hi MyStatuslineAccent ctermfg=8
    hi MyStatuslineFilename ctermfg=1
    hi MyStatuslineAccentBody ctermbg=8
  endif
  " Return empty string so as not to display anything in the statusline
  return ''
endfunction
" }}}
function! SetModifiedSymbol(modified) " {{{
    if a:modified == 1
        hi MyStatuslineModifiedBody guibg=#3E3859 guifg=#ff8080
    else
        hi MyStatuslineModifiedBody guibg=#3E3859 guifg=#aaffe4
    endif
    return "\u25CF"
endfunction
" }}}
function! SetFiletype(filetype) " {{{
  if a:filetype == ''
      return '-'
  else
    return  WebDevIconsGetFileTypeSymbol() . ' ' . a:filetype
  endif
endfunction
" }}}

" Statusbar items
" ====================================================================

" This will not be displayed, but the function RedrawModeColors will be
" called every time the mode changes, thus updating the colors used for the
" components.
set statusline=%{RedrawModeColors(mode())}
" Left side items
" =======================
set statusline+=%#MyStatuslineAccent#
set statusline+=%#MyStatuslineAccentBody#
set statusline+=\   "
set statusline+=\   "

" Filename
set statusline+=%#MyStatuslineFilename#\ %t
set statusline+=%#MyStatuslineModified#\ "

" Modified status
set statusline+=%#MyStatuslineModified#
set statusline+=%#MyStatuslineModifiedBody#%{SetModifiedSymbol(&modified)}
set statusline+=%#MyStatuslineModified#
" Right side items
" =======================
" Filetype
" set statusline+=%=
" set statusline+=%#MyStatuslineFiletype#
" set statusline+=%#MyStatuslineFiletypeBody#%{SetFiletype(&filetype)}
" set statusline+=%#MyStatuslineFiletype#\ "
" set statusline+=%#MyStatuslineReset#

" }}}
" Autocommands and functions {{{

" https://github.com/wincent/wincent/commit/84a48540b6f10095ba0fe25dc359060e71804a2e
if exists('##TextYankPost')
    au TextYankPost * silent! lua require'vim.highlight'.on_yank()
endif

" create file with subdirectories if needed :E
function s:MKDir(...)
    if         !a:0
           \|| stridx('`+', a:1[0])!=-1
           \|| a:1=~#'\v\\@<![ *?[%#]'
           \|| isdirectory(a:1)
           \|| filereadable(a:1)
           \|| isdirectory(fnamemodify(a:1, ':p:h'))
        return
    endif
    return mkdir(fnamemodify(a:1, ':p:h'), 'p')
endfunction
command -bang -bar -nargs=? -complete=file E :call s:MKDir(<f-args>) | e<bang> <args>

" call macro in visual region
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" vim-php-namespace
autocmd FileType php inoremap <Leader>ps <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>ps :call PhpSortUse()<CR>
let g:php_namespace_sort = "'{,'}-1!awk '{print length, $0}' | sort -n -s | cut -d' ' -f2-"

" Make sure Vim open in the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     execute 'normal! g`"zvzz' |
                \ endif
augroup END

" Auto-remove trailing spaces
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
" autocmd BufWritePre * call StripWhitespace()

" indent html tag
let g:html_indent_inctags = "html,body,head,tbody" " Indent html tag (Vim 7.4)

autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell         " Enable spell check on git commit messages

autocmd BufRead,BufNewFile *.md,*.txt set filetype=markdown " Highlight Markdown files

autocmd BufRead,BufNewFile *.go  set tabstop=4 shiftwidth=4  softtabstop=4
autocmd BufRead,BufNewFile *.php set tabstop=4 shiftwidth=4 tabstop=4
" autocmd BufRead,BufNewFile *.blade.php set filetype=blade.html
autocmd BufRead,BufNewFile *.js set tabstop=2 shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.rb set tabstop=2 shiftwidth=2 tabstop=2

" }}}
" Mappings {{{

" Fast save
nmap <leader>w :w!<CR>
imap <leader>w <esc>:w<CR>

" source vimrc
nmap <Leader>vso :so $MYVIMRC<CR>  " Fast source .vimrc
map <Leader>vi :vsp $MYVIMRC<CR>  " Obviously :)

" Make Arrowkey do something usefull, resize the viewports accordingly
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Up> :resize -5<CR>
nnoremap <Down> :resize +5<CR>

" Buffer navigation
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
nnoremap <leader>a :bprev<cr>
nnoremap <leader>t :bnext<cr>

" Set (No)Paste Toogle
set pastetoggle=<leader>z

" Jump to next error and previous error
map ]l :lnext<CR>
map [l :lprevious<CR>

" move in visual mode
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv

" }}}
" Plugins configuration {{{

" diff-view
lua <<EOF
local actions = require("diffview.actions")

require("diffview").setup{
}

EOF

" git-signs
lua <<EOF
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
EOF

" windex (maximize)
lua <<EOF
require('windex').setup {
    -- KEYMAPS:
    default_keymaps = true, -- Enable default keymaps.
    extra_keymaps = false,  -- Enable extra keymaps.
    arrow_keys = false,     -- Default window movement keymaps use arrow keys instead of 'h,j,k,l'.

    -- OPTIONS:
    numbered_term = false,  -- Enable line numbers in the terminal.
    save_buffers = false,   -- Save all buffers before switching tmux panes.
    warnings = true,        -- Enable warnings before some actions such as closing tmux panes.
}
EOF

" neoscroll
lua <<EOF
require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '100'}}

require('neoscroll.config').set_mappings(t)
EOF

" colorizer
lua <<EOF
require'colorizer'.setup()
EOF

" nvim-autopairs
lua << EOF
--require('nvim-autopairs').setup{}
EOF

" sideway
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>
autocmd FileType php let b:sideways_definitions = [{
      \   'start': '\(\w\+::\|\$\w\+->\)\_s*',
      \   'end': ';',
      \   'delimiter': '\_s*->\_s*',
      \   'brackets':  ['(', ')'],
      \ }]

" lsp-config and lsp-install
lua << EOF

-- Use an on_attach function to only map the following keys after the language server attaches to the current buffer

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'ge', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('v', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  --if client.resolved_capabilities.document_formatting then
  --  vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  --end
  --client.resolved_capabilities.document_formatting = false
  ---client.resolved_capabilities.document_range_formatting = false

    -- show diagnostic in hover line
    vim.o.updatetime = 250
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

     --update diagnostics icons
     local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
     for type, icon in pairs(signs) do
         local hl = "DiagnosticSign" .. type
         vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
     end

end

local nvim_lsp = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
    }

    if server.name == "intelephense" then
        opts.init_options = {
            licenceKey = os.getenv('INTELEPHENSE_LICENSE_KEY'),
        }
    end

    if server.name == "eslint" then
        -- local eslint_config = require("lspconfig.server_configurations.eslint")
        -- opts.cmd = { "yarn", "exec", unpack(eslint_config.default_config.cmd) }
    end

    server:setup(opts)

    -- Automatically update diagnostics
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        -- virtual_text = { spacing = 4, prefix = "●" },
        virtual_text = false,
        severity_sort = true,
        })

    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

    for type, icon in pairs(signs) do
        local hl = "LspDiagnosticsSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end)
EOF

" trouble
nnoremap gr <cmd>TroubleToggle lsp_references<cr>
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>

lua << EOF
 require("trouble").setup {
}

-- local actions = require("telescope.actions")
-- local trouble = require("trouble.providers.telescope")
-- local telescope = require("telescope")
--
-- telescope.setup {
--   defaults = {
--     mappings = {
--       i = { ["<c-r>"] = trouble.open_with_trouble },
--       n = { ["<c-r>"] = trouble.open_with_trouble },
--     },
--   },
-- }
EOF

" nvim-tree
lua <<EOF
require'nvim-tree'.setup {
    view = {
        width = 40,
        side = 'right'
    },

}
EOF

" let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', 'vendor' ] "empty by default
" let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
" let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
" let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
" let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
" let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
" let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
" let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
" let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
" let g:nvim_tree_root_folder_modifier = ':t' "This is the default. See :help filename-modifiers for more options
" let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
" let g:nvim_tree_auto_resize = 0 "1 by default, will resize the tree to its saved width when opening a file
" let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
" let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
" let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
" let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
" let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
" let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
" let g:nvim_tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
" let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
" let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
" let g:nvim_tree_update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
" let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
" let g:nvim_tree_window_picker_exclude = {
"     \   'filetype': [
"     \     'packer',
"     \     'qf'
"     \   ],
"     \   'buftype': [
"     \     'terminal'
"     \   ]
"     \ }
" " Dictionary of buffer option names mapped to a list of option values that
" " indicates to the window picker that the buffer's window should not be
" " selectable.
" let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
" let g:nvim_tree_show_icons = {
"     \ 'git': 1,
"     \ 'folders': 1,
"     \ 'files': 1,
"     \ 'folder_arrows': 1,
"     \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
" let g:nvim_tree_icons = {
"    \ 'default': '',
"    \ 'symlink': '',
"    \ 'git': {
"    \   'unstaged': "✗",
"    \   'staged': "✓",
"    \   'unmerged': "",
"    \   'renamed': "➜",
"    \   'untracked': "★",
"    \   'deleted': "",
"    \   'ignored': "◌"
"    \   },
"    \ 'folder': {
"    \   'arrow_open': "",
"    \   'arrow_closed': "",
"    \   'default': "",
"    \   'open': "",
"    \   'empty': "",
"    \   'empty_open': "",
"    \   'symlink': "",
"    \   'symlink_open': "",
"    \   },
"    \   'lsp': {
"    \     'hint': "",
"    \     'info': "",
"    \     'warning': "",
"    \     'error': "",
"    \   }
"    \ }

nnoremap <leader>nn :NvimTreeToggle<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
   context_commentstring = {
      enable = true,
      enable_autocmd = false,
   },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true
    },
   incremental_selection = {
    enable = true,
    keymaps = {
        init_selection = '<CR>',
        scope_incremental = '<CR>',
        node_incremental = '<TAB>',
        node_decremental = '<S-TAB>',
        },
   },
   textobjects = {
     enable = true
   },
   ensure_installed = {
     "comment",
     "css",
     "javascript",
     "json",
     "jsonc",
     "help",
     "html",
     "lua",
     "php",
    "typescript",
     "vim",
     "vue",
   },
    autotag = {
     enable = true,
     filetypes = {
        'html',
        'xml',
        'javascript',
        'javascriptreact',
        'typescriptreact',
        'vue',
        'php',
        'blade',
        'blade.php',
        'jsx',
        'tsx'
     },
    }
}
EOF

" comment.nvim
lua <<EOF
require('Comment').setup {
  pre_hook = function(ctx)
    local U = require 'Comment.utils'

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring {
      key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
      location = location,
    }
  end,
  }
EOF

" vim-visual-multi
let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '<C-j>'
let g:VM_maps["Select Cursor Up"]   = '<C-k>'
let g:VM_mouse_mappings = 1

"indent lines
" let g:indent_blankline_filetype = ['vue', 'html', 'blade']
let g:indent_blankline_use_treesitter = 1
let g:indent_blankline_show_trailing_blankline_indent = 0

lua <<EOF
vim.g.indent_blankline_show_current_context = false
vim.g.indent_blankline_context_patterns = {
  "class",
  "return",
  "function",
  "method",
  "^if",
  "^while",
  "jsx_element",
  "^for",
  "^object",
  "^table",
  "block",
  "arguments",
  "if_statement",
  "else_clause",
  "jsx_element",
  "jsx_self_closing_element",
  "try_statement",
  "catch_clause",
  "import_statement",
  "operation_type",
}
-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
--vim.wo.colorcolumn = "99999"
EOF

" nvim-dap

lua << EOF
local dap = require('dap')

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/config/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv('HOME') .. "/config/vscode-chrome-debug/out/src/chromeDebug.js"}
}
dap.configurations.javascript = {
  {
    name = 'node2',
    type = 'node2',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
    --port = 7009,
  },
  {
    name = 'chrome',
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}"
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    restart = true,
    processId = require'dap.utils'.pick_process,
    port = 7009,
  },
}
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

function debugJest(testName, filename)
  print("starting " .. testName .. " in " .. filename)
  dap.run({
      type = 'node2',
      request = 'launch',
      cwd = vim.fn.getcwd(),
      runtimeArgs = {'--inspect-brk', 'node_modules/.bin/jest', '--no-coverage', '--config=test/jest.config.js', '-t', testName, '--', filename},
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = {'<node_internals>/**/*.js'},
      console = 'integratedTerminal',
      port = 9229,
      })
end
EOF

nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>dk :lua require'dap'.step_out()<CR>
nnoremap <leader>dj :lua require'dap'.step_into()<CR>
nnoremap <leader>dq :lua require'dap'.step_over()<CR>
nnoremap <leader>dn :lua require'dap'.continue()<CR>
" nnoremap <leader>dk :lua require'dap'.up()<CR>
" nnoremap <leader>dj :lua require'dap'.down()<CR>
nnoremap <leader>d_ :lua require'dap'.run_last()<CR>
nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
nnoremap <leader>di :lua require'dap.ui.variables'.hover()<CR>
vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
" nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
" nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>

nnoremap <leader>dd :TestNearest -strategy=jest<CR>
function! JestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  let fileName = matchlist(a:cmd, '\v'' -- (.*)$')[1]
  call luaeval("debugJest([[" . testName . "]], [[" . fileName . "]])")
endfunction      
let g:test#custom_strategies = {'jest': function('JestStrategy')}

" Colorizer
" let g:colorizer_use_virtual_text = 0
" let g:colorizer_colornames = 0
" let g:colorizer_syntax = 1
let g:colorizer_auto_filetype='css,scss'
au BufNewFile,BufRead *.css,*.scss :ColorHighlight!

" vim-matchup
let g:loaded_matchit = 1
let g:matchup_matchparen_enabled = 0

" dart-vim
let dart_style_guide = 2
let dart_format_on_save = 1

"vim slash
if has('timers')
  " Blink 2 times with 50ms interval
  noremap <expr> <plug>(slash-after) slash#blink(2, 50)
endif

" splitjoin
let splitjoin_php_method_chain_full=1

"php actor
" Include use statement
nmap <Leader>u :PhpactorImportClass<CR>

" Invoke the context menu
nmap <Leader>cm :PhpactorContextMenu()<CR>

" vim easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:TESTING_STATUS = 'passing'
let g:test#preserve_screen = 0
if has('nvim')
   let test#strategy = {
    \ 'nearest': 'vimux',
    \ 'file':    'vimux',
    \ 'suite':   'nuake',
    \}
else
   let test#strategy = "vimterminal"
endif
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

let test#javascript#jest#options = "--config=test/jest.config.js"
" let test#javascript#jest#options = "--config=public/js/__tests__/jest.config.js"
" let test#javascript#jest#options = "--config=test/jest.config.js --forceExit --detectOpenHandles"

" vim-devicon
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = v:true
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Php CS Fixer
let g:php_cs_fixer_fixers_list="-psr0"
let g:php_cs_fixer_level = "psr2"                  " which level ?
let g:php_cs_fixer_config = "default"             " configuration
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 0
let g:phpfmt_php_path = "php"
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 1                    " Return the output of command if 1, else an inline information.
nnoremap <silent><leader>pf :w \| :call PhpCsFixerFixFile()<CR><CR>

" vim-php-namespace
let g:php_namespace_sort_after_insert = 1
" }}}

" vim-vue-plugin
let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript', 'typescript'],
      \   'style': ['css', 'scss', 'sass', 'less', 'stylus'],
      \   'i18n': ['json', 'yaml'],
      \   'route': 'json',
      \},
      \'full_syntax': ['json'],
      \'attribute': 1,
      \'keyword': 1,
      \'foldexpr': 0,
      \'debug': 0,
      \}

" toggleterm-lazygit
lua <<EOF
     require("toggleterm").setup({
        shade_terminals = false,
      })
      -- Add a `lazygit` terminal
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
          width = vim.o.columns - 6,
          height = vim.o.lines - 5,
        },
        on_open = function(term)
        vim.keymap.set("t", "<leader>l", "<cmd>close<CR>", {
            noremap = true,
            silent = true,
            buffer = term.bufnr,
          })
        end,
      })
      -- Toggle the state of the `lazygit` terminal
      local function lazygit_toggle()
        lazygit:toggle()
      end

      -- Setup the keybindings
      vim.keymap.set("n", "<leader>l", lazygit_toggle, { noremap = true, silent = true })
EOF

" Plugins mappings {{{

" specs
lua <<EOF
require("specs").setup({
  show_jumps = true,
  min_jump = 10,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 20, -- time increments used for fade/resize effects
    blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 20,
    winhl = "PMenu",
    fader = require("specs").linear_fader,
    resizer = require("specs").shrink_resizer,
  },
  ignore_filetypes = {},
  ignore_buftypes = { nofile = true },
})
EOF

" telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>* :execute 'Telescope live_grep default_text=' . expand('<cword>')<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>s <cmd>Telescope git_status<cr>
nnoremap <leader>co <cmd>Telescope commands<cr>

lua << EOF
require('telescope').setup {
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
      prompt_prefix = "   ",
      prompt_position = "top",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "top",
            --preview_width = 0.55,
            --results_width = 0.8,
         },
         vertical = {
            prompt_position = "top",
            width = 0.5,
            --mirror = false,
         },
         width = 0.87,
         height = 0.80,
         preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

require('telescope').load_extension('fzf')
EOF

" nvim-cmp
set completeopt=menu,menuone,noselect
inoremap <C-x><C-o> <Cmd>lua require('cmp').complete()<CR>
lua <<EOF
  -- Setup nvim-cmp.

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local luasnip = require("luasnip")
  local cmp = require'cmp'
  require("luasnip.loaders.from_vscode").lazy_load()


  cmp.setup({
    completion = {
      autocomplete = false
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-CR>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      --{ name = 'luasnip' },
      { name = 'luasnip', option = { use_show_condition = false } },
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    }),
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  --[[ local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) ]]
  --[[ require('lspconfig')['intelephense'].setup { ]]
  --[[   capabilities = capabilities, ]]
  --[[ } ]]
EOF

" null-ls
lua <<EOF
    require("null-ls").setup({
        debounce = 150,
        save_after_format = true,
        debug = true,
        sources = {
            require("null-ls").builtins.formatting.stylua,
            require("null-ls").builtins.completion.spell,
            require("null-ls").builtins.formatting.phpcsfixer,
            -- require('null-ls').builtins.formatting.prettier,
            -- require('null-ls').builtins.diagnostics.phpcs,
            -- require('null-ls').builtins.formatting.eslint_d,
        },

        -- on_attach = function(client)
        --         if client.resolved_capabilities.document_formatting then
        --             vim.cmd([[
        --             augroup LspFormatting
        --                 autocmd! * <buffer>
        --                 autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
        --             augroup END
        --             ]])
        --         end
        --     end,

    })

    --require("lspconfig")["null-ls"].setup({
        --on_attach = my_custom_on_attach,
    --[]})
EOF

" }}}

lua <<EOF
EOF

" vim -copilot
" imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

" autocmd BufNewFile,BufRead *.env :set filetype=sh

" hi Normal guibg=none

" set runtimepath^=/Users/rodrigore/proyectos/coc-tailwind-intellisense
