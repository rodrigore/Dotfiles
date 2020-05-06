" vim:fdm=marker

" Vim-Plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/undoquit.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'arzg/vim-colors-xcode'
Plug 'andymass/vim-matchup'
Plug 'benmills/vimux'
Plug 'cohama/lexima.vim'   " auto close parentheses
Plug 'dart-lang/dart-vim-plugin'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'enricobacis/paste.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'kana/vim-repeat'
Plug 'liuchengxu/vista.vim'
Plug 'liuchengxu/vim-clap'
Plug 'pbogut/fzf-mru.vim'
Plug 'maximbaz/lightline-ale'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mg979/vim-visual-multi'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake'
Plug 'nelstrom/vim-visual-star-search'
Plug 'pangloss/vim-javascript'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', { 'do': 'npm install'}
Plug 'reisub0/hot-reload.vim' " flutter hot-reload
Plug 'rodrigore/nuake'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/context_filetype.vim'
Plug 'stanAngeloff/php.vim', { 'for': 'php' }
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'TaDaa/vimade'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tyru/caw.vim'      " comment
Plug 'wincent/terminus'
Plug 'w0rp/ale'

" Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

Plug 'autozimu/LanguageClient-neovim', {
             \ 'branch': 'next',
             \ 'do': 'bash install.sh',
            \ }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

" Add plugins to &runtimepath
call plug#end()
" }}}
" Base config {{{
let mapleader=','
set laststatus=2          " Make visible the status bar
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
set cmdheight=2           " Better display for messages
set updatetime=300        " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c          " don't give |ins-completion-menu| messages.


if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set termguicolors

set tags+=tags,tags.vendors

" statusline
set statusline=%=\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,
set noshowmode
set clipboard=unnamed

" }}}
" colorscheme {{{
set background=dark

colorscheme palenight
let g:palenight_terminal_italics=1
" colorscheme xcodedarkhc
" let g:xcodedarkhc_emph_types = 0
" let g:xcodedarkhc_emph_funcs = 1
" let g:xcodedarkhc_emph_idents = 0

" let g:lightline = {
"       \ 'colorscheme': 'palenight',
"       \ 'active': {
"             \ 'left': [[ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified'], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
"             \ 'right' : [[]],
"       \},
"         \ 'component_function': {
"         \   'cocstatus': 'coc#status',
"         \   'gitbranch': 'fugitive#head',
"         \ },
"         \ 'component_expand': {
"         \  'linter_checking': 'lightline#ale#checking',
"         \  'linter_warnings': 'lightline#ale#warnings',
"         \  'linter_errors': 'lightline#ale#errors',
"         \  'linter_ok': 'lightline#ale#ok',
"         \ },
"         \ 'component_type': {
"         \     'linter_checking': 'left',
"         \     'linter_warnings': 'warning',
"         \     'linter_errors': 'error',
"         \     'linter_ok': 'left',
"         \ },
" \}

" ====================================================================
set noshowmode

set laststatus=2
let g:lightline = {}
let g:lightline.enable = {
  \  'statusline': 0
  \ }
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

function! TestStatus() abort
  if g:TESTING_STATUS == 'passing'
      hi MyStatuslineTestStatus guifg=#AAFFE4
    return "  "
  elseif g:TESTING_STATUS == 'running'
    return "   "
  elseif g:TESTING_STATUS == 'failing'
    hi MyStatuslineTestStatus guifg=#ff5370
    return "   "
  endif
endfunction

function! LSDiagnostic()
  let info = get(b:, 'coc_diagnostic_info', {})

  if get(info, 'error', 0)
    return "   "
  endif

  if get(info, 'warning', 0)
    return info['warning'] . "   "
  endif

  return "   "
endfunction

" Statusbar items
" ====================================================================

" This will not be displayed, but the function RedrawModeColors will be
" called every time the mode changes, thus updating the colors used for the
" components.
set statusline=%{RedrawModeColors(mode())}
" " Left side items
" " =======================
set statusline+=%#MyStatuslineAccent#
set statusline+=%#MyStatuslineAccentBody#
set statusline+=\   "
set statusline+=\   "

" " Filename
set statusline+=%#MyStatuslineFilename#\ %t
set statusline+=%#MyStatuslineModified#\ "

" " Modified status
set statusline+=%#MyStatuslineModified#
set statusline+=%#MyStatuslineModifiedBody#%{SetModifiedSymbol(&modified)}
set statusline+=%#MyStatuslineModified#
" " Right side items
" " =======================
set statusline+=%=
set statusline+=%#MyStatuslineAccent#
set statusline+=%#MyStatuslineAccentLabel#Tests\ "
set statusline+=%#MyStatuslineTestStatus#%{TestStatus()}
set statusline+=%#MyStatuslineLineCol#\ "

" " Filetype
set statusline+=%#MyStatuslineFiletype#
set statusline+=%#MyStatuslineFiletypeBody#%{SetFiletype(&filetype)}
set statusline+=%#MyStatuslineFiletype#\ "
set statusline+=%#MyStatuslineReset#

" pmenu palenight
hi pmenu guibg=#212333
hi pmenusel guibg=#6a3eb5 guifg=#bfc7d5
hi pmenusbar guibg=#352b59 guifg=#352b59
hi pmenuthumb guibg=#352b59 guifg=#352b59

" nerdree palenight
hi comment cterm=italic gui=italic
hi def link nerdtreero statement
hi def link nerdtreebookmark statement
hi def link nerdtreeflags statement
hi def link nerdtreedirslash StatusLineNC
hi def link nerdtreedir StatusLineNC
hi def link nerdtreeup StatusLineNC
hi def link nerdtreefile StatusLineNC
hi def link nerdtreecwd StatusLineNC
hi def link nerdtreeopenable StatusLineNC
hi def link nerdtreeclosable StatusLineNC
hi def link nerdtreeignore StatusLineNC

" visual palenight ctrlp_custom
hi Visual guibg=#3A3C5B guifg=NONE gui=NONE
hi Typedef guifg=#6bdfff guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi LocalType guifg=#acf2e4 guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi LibraryType guifg=#dabaff guibg=NONE guisp=NONE gui=NONE cterm=NONE

" sh variable palenight (.env files)
hi def link shVariable statement
hi shNumber guifg=#bfc7d5

" Make status line without color and dont show on nerdtree
hi StatusLine guibg=NONE guifg=NONE gui=NONE

" }}}
" Autocommands and functions {{{

" call macro in visual region
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" vue (fix highlight when stop working)
" autocmd FileType vue syntax sync fromstart
" autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue
"
" let g:vue_disable_pre_processors = 1

" vim-php-namespace
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>
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
autocmd BufWritePre * call StripWhitespace()

" indent html tag
let g:html_indent_inctags = "html,body,head,tbody" " Indent html tag (Vim 7.4)

autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell         " Enable spell check on git commit messages

autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby    " Highlight Vagrant files like ruby
autocmd BufRead,BufNewFile *.md,*.txt set filetype=markdown " Highlight Markdown files

autocmd BufRead,BufNewFile *.go  set tabstop=4 shiftwidth=4  softtabstop=4
autocmd BufRead,BufNewFile *.php set tabstop=4 shiftwidth=4 tabstop=4
" autocmd BufRead,BufNewFile *.blade.php set filetype=blade.html
autocmd BufRead,BufNewFile *.js set tabstop=2 shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.rb set tabstop=2 shiftwidth=2 tabstop=2

" }}}
" Mappings {{{
"nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" Fast save
nmap <leader>w :w!<CR>
imap <leader>w <esc>:w<CR>

" source vimrc
nmap <Leader>so :so $MYVIMRC<CR>  " Fast source .vimrc
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

" Buffer delete
" nnoremap <leader>d :bd<cr>
nnoremap <leader>d :bp<cr>:bd #<cr>

" Format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Set (No)Paste Toogle
set pastetoggle=<leader>z

" Jump to next error and previous error
map ]l :lnext<CR>
map [l :lprevious<CR>

" move in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" }}}
" Plugins configuration {{{

" Nuake
let g:start_insert = 1 " Disable insert mode when opening Nuake.
let g:nuake_size = 0.4
" disable status line
autocmd FileType,BufEnter *
            \ if &filetype == 'nuake' && (g:nuake_start_insert == 1) |
            \ execute 'silent! normal i' |
            \ execute 'set laststatus=0 noshowmode noruler' |
            \ endif
nnoremap <C-t> :Nuake<CR>
inoremap <C-t> <C-\><C-n>:Nuake<CR>
tnoremap <C-t> <C-\><C-n>:Nuake<CR>

" vim-visual-multi
let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '<C-j>'
let g:VM_maps["Select Cursor Up"]   = '<C-k>'

"indent lines
" let g:indentLine_char = '│'
" let g:indentLine_first_char = g:indentLine_char
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_color_gui = '#2C323C'
" let g:indentLine_bgcolor_gui = 'NONE'
" let g:indentLine_setConceal = 0
" let g:indentLine_fileTypeExclude = ['help', 'defx', 'vimwiki']
" let g:indentLine_autoResetWidth = 0
" let g:indent_blankline_space_char = ' '

" hi ColorColumn  term=reverse ctermbg=1 guibg=#3E4452
hi! link ColorColumn Comment

" vim vue
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_foldexpr = 0

" Vista
map <leader>vv :Vista!!<CR>
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:vista#renderer#enable_icon = 1
let g:vista_disable_statusline = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
" let g:vista_icon_indent = ["▸ ", ""]

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" https://github.com/liuchengxu/vista.vim/blob/master/autoload/vista/renderer.vim
let g:vista#renderer#icons = {
\   "function": "ƒ",
\   "var": "",
\   "variable": "",
\   "variables": "",
\   "class": " ",
\   "namespaces": "",
\   "default": ""
\ }

" Colorizer
" let g:colorizer_use_virtual_text = 0
" let g:colorizer_colornames = 0
" let g:colorizer_syntax = 1
let g:colorizer_auto_filetype='css,scss'
au BufNewFile,BufRead *.css,*.scss :ColorHighlight!


" vim-matchup
let g:loaded_matchit = 1

" coc-nvim
" let $COC_NO_PLUGINS=1
" let $NODE_CLIENT_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_LEVEL = 'debug'
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
" let g:node_client_debug = 1
 let g:coc_global_extensions = []
let g:coc_watch_extensions = []
let g:coc_node_path = '/usr/local/bin/node'
 let g:coc_global_extensions = [
\  'coc-json',
\  'coc-eslint',
\  'coc-css',
\  'coc-emmet',
\  'coc-html',
\  'coc-diagnostic',
\  'coc-vetur',
\  'coc-phpls',
\  'coc-snippets',
\  'coc-tailwindcss'
\ ]

" User configuration.
let g:coc_user_config = {
	\ 'suggest': {
		\ 'enablePreview': v:true,
		\ 'noselect': v:false,
		\ 'timeout': 500,
		\ 'preferCompleteThanJumpPlaceholder': v:true,
		\ 'minTriggerInputLength': 2,
	\ },
	\ 'diagnostic': {
		\ 'displayByAle': v:false,
		\ 'errorSign': '•',
		\ 'warningSign': '•',
		\ 'infoSign': '•',
		\ 'hintSign': '•',
	\ }
\ }


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <Tab> and <S-Tab> for navigate completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" snippets with tab
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" jump to symbol under cursor (go to definition)
nnoremap <silent> <C-s>  :exe 'CocList -I --normal --input='.expand('<cword>').' symbols'<CR>

" add current to selection and go to next
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

nmap <silent> <C-e> <Plug>(coc-cursors-word)*
xmap <silent> <C-e> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn

"eleline
let g:eleline_powerline_fonts = 1
let g:eleline_slim = 1

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

" gutentags
" let g:gutentags_ctags_extra_args = [
"             \ '--recurse=yes',
"             \ '--tag-relative=yes',
"             \ '--exclude=.git',
"             \ '--languages=php',
"             \ '--PHP-kinds=+cdfint-av',
"             \ '--langmap=php:.engine.inc.module.theme.install.php',
"             \ '--PHP-kinds=+cf-v'
"             \]
" let g:gutentags_ctags_exclude = [
"             \ '*.css', '*.html', '*.js', '*.json', '*.xml',
"             \ '*.phar', '*.ini', '*.rst', '*.md',
"             \ '*var/cache*', '*var/log*'
"             \]

"php pactor
" Include use statement
nmap <Leader>u :PhpactorImportClass<CR>

" Invoke the context menu
nmap <Leader>cm :PhpactorContextMenu()<CR>

nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" php server
" au User lsp_setup call lsp#register_server({
"             \ 'name': 'php-language-server',
"             \ 'cmd': {server_info->['php', expand('~/.vim/plugged/php-language-server/bin/php-language-server.php')]},
"             \ 'whitelist': ['php'],
"             \ })

" vim easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim prettier
let g:prettier#config#tab_width = 2
let g:prettier#exec_cmd_async = 1
let g:prettier#config#parser = 'babylon'
let g:prettier#quickfix_enabled = 0
let g:prettier#exec_cmd_async = 1
" autocmd BufWritePre *.vue Prettier

" neomake
let g:neomake_open_list = 1
let g:neomake_warning_sign = {
  \   'text': '◉'
  \ }
let g:neomake_error_sign = {
  \   'text': '◉'
  \ }

" Show message that tests have started
function! MyOnNeomakeJobStarted() abort
  let g:TESTING_STATUS = 'running'
endfunction

" Show message when all tests are passing
function! MyOnNeomakeJobFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    let g:TESTING_STATUS = 'passing'
  endif
  if context.jobinfo.exit_code == 1
    let g:TESTING_STATUS = 'failing'
  endif
endfunction

augroup my_neomake_hooks
  au!
  autocmd User NeomakeJobFinished call MyOnNeomakeJobFinished()
  autocmd User NeomakeJobStarted call MyOnNeomakeJobStarted()
augroup END

" vim-test
" nuake strategy
function! NuakeStrategy(cmd)
  call nuake#ToggleWindowCMD(a:cmd)
endfunction

let g:test#custom_strategies = {'nuake': function('NuakeStrategy')}

let g:TESTING_STATUS = 'passing'
let g:test#preserve_screen = 0
if has('nvim')
   let test#strategy = {
    \ 'nearest': 'nuake',
    \ 'file':    'neomake',
    \ 'suite':   'neomake',
    \}
   tmap <C-o> <C-\><C-n>
else
   let test#strategy = "vimterminal"
endif
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

"ale
let g:ale_disable_lsp = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_php_phpcs_standard='psr2 -n'
let g:ale_php_phpcs_use_global=1
" let g:ale_php_langserver_executable = 'intelephense'
" let g:ale_php_langserver_executable = expand('~/.composer/vendor/bin/php-language-server.php')
let g:ale_php_langserver_use_global = 1

let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'html': [''],
      \}

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['vue'] = ['prettier']
let g:ale_virtualtext_cursor= 0
let g:ale_set_highlights = 0

" vim-devicon
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let NERDTreeDirArrowExpandable = "\u00a0" "non-breaking space to make the arrows appear to have been removed. Regular spaces won't work, as they causes keypresses on lower-level directories to not be recognized
let NERDTreeDirArrowCollapsible = "\u00a0"
let g:DevIconsEnableFoldersOpenClose = v:true
let g:DevIconsEnableFolderExtensionPatternMatching = 1
" Use one space after a glyph instead of two.
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" Set default file and directory icons.
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

" CtrlP
" let g:ctrlp_max_height = 30
" let g:ctrlp_custom_ignore = '\.git$\|public\/images$\|public\/uploads$\|log\|tmp$\|node_modules\|bower_components\'
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_use_caching = 0
" let g:ctrlp_working_path_mode=0

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" vim-javascript
let g:javascript_enable_domhtmlcss = 1

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Ag.vim
let g:ag_working_path_mode="r"
let g:ag_prg='ag -S --nocolor --nogroup --column --ignore public --ignore node_modules --ignore "./storage/*" --ignore "./public/stylesheets/*"'

" php.vim
let php_var_selector_is_identifier=1
hi phpClass gui=bold
hi phpClasses gui=bold
hi phpClassExtends gui=bold
hi phpClassImplements gui=bold
hi def link phpFunctionCall phpMethod
hi def link phpLastUseClass phpClass
" hi def link phpStart phpMethod

function! PhpSyntaxOverride()
  syn match phpFunctionCall /\v\h\w*\ze(\s?\()/ containedin=phpRegion,phpIdentifier " highlight function names like global or laravel helpers
  syn match phpLastUseClass /.*\zs\<\w\+/ containedin=phpRegion,phpUseClass         " highlight class from namespace
  " syn match phpStart /<?php/ containedin=phpRegion,Delimiter
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

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
" Plugins mappings {{{

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeStatusline = '%#NonText#'
let NERDTreeMinimalUI=1

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <leader>m :FZFFreshMru<cr>
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'

" let $FZF_DEFAULT_OPTS="--color=bg+:#212333,bg:#262337,spinner:#89DDFF,hl:#82AAFF --color=fg:#8796B0,header:#C792EA,info:#FFCB6B,pointer:#89DDFF --color=marker:#89DDFF,fg+:#959DCB,prompt:#FFCB6B,hl+:#C792EA --layout=reverse --margin=1,2"
let $FZF_DEFAULT_OPTS="--color=bg+:#212333,bg:#262337,spinner:#89DDFF,hl:#82AAFF --color=fg:#8796B0,header:#C792EA,info:#FFCB6B,pointer:#89DDFF --color=marker:#89DDFF,fg+:#959DCB,prompt:#FFCB6B,hl+:#C792EA --layout=reverse --preview 'bat --theme=base16 --color always --line-range :40 {};'"

" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

" function! FloatingFZF()
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')
"
"   let height = float2nr(10)
"   let width = float2nr(80)
"   let horizontal = float2nr((&columns - width) / 2)
"   let vertical = 1
"
"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': vertical,
"         \ 'col': horizontal,
"         \ 'width': width,
"         \ 'height': height,
"         \ 'style': 'minimal'
"         \ }
"
"   call nvim_open_win(buf, v:true, opts)
" endfunction

" let g:fzf_colors = {
" 			\ 'fg':      ['fg', 'Fold'],
" 			\ 'bg':      ['bg', 'Normal'],
" 			\ 'hl':      ['fg', 'Error'],
" 			\ 'fg+':     ['fg', 'String'],
" 			\ 'bg+':     ['bg', 'Normal'],
" 			\ 'hl+':     ['fg', 'Error'],
" 			\ 'info':    ['fg', 'Type'],
"             \ 'border':  ['fg', 'Ignore'],
" 			\ 'prompt':  ['fg', 'Special'],
" 			\ 'pointer': ['fg', 'Statement'],
" 			\ 'marker':  ['fg', 'Statemetn'],
" 			\ 'spinner': ['fg', 'Statement'],
" 			\ 'header':  ['fg', 'Special'],
"             \ }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  " let height = float2nr(10)
  " let width = float2nr(80)
  let height = float2nr(&lines * 0.85)
  let width = float2nr(&columns * 0.9)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Ale
nmap <silent> <M-C-k> <Plug>(ale_previous_wrap)
nmap <silent> <M-C-j> <Plug>(ale_next_wrap)
" }}}

hi Normal guibg=none

" Debug: Show the stack of syntax highlighting classes affecting whatever is under the cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc

" nnoremap <leader>m :call SynStack()<CR>

