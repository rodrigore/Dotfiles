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
Plug 'andymass/vim-matchup'
Plug 'chrisbra/Colorizer'
Plug 'cohama/lexima.vim'   " auto close parentheses
Plug 'dart-lang/dart-vim-plugin'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'kana/vim-repeat'
Plug 'liuchengxu/vista.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'maximbaz/lightline-ale'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nelstrom/vim-visual-star-search'
Plug 'pangloss/vim-javascript'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'leafOfTree/vim-vue-plugin'
Plug 'prettier/vim-prettier', { 'do': 'npm install'}
Plug 'reisub0/hot-reload.vim' " flutter hot-reload
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
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Plug 'tyru/caw.vim'      " comment
Plug 'wincent/terminus'
Plug 'w0rp/ale'

"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" Plug 'autozimu/LanguageClient-neovim', {
"             \ 'branch': 'next',
"             \ 'do': 'bash install.sh',
"             \ }
" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

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

let NERDTreeStatusline="%8*%=%7*NERD%8*%="

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
    return "  "
  elseif g:TESTING_STATUS == 'running'
    return "   "
  elseif g:TESTING_STATUS == 'failing'
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
set statusline+=%#MyStatuslineAccentBody#
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
set statusline+=%#MyStatuslineAccentLabel#LS\ "
set statusline+=%#MyStatuslineLangServer#%{LSDiagnostic()}
set statusline+=%#MyStatuslineLineCol#\ "
" Test status
" set statusline+=%#MyStatuslineAccent#
" set statusline+=%#MyStatuslineAccentLabel#Tests\
" set statusline+=%#MyStatuslineTestStatus#%{TestStatus()}
" set statusline+=%#MyStatuslineLineCol#\
" " Line and Column
set statusline+=%#MyStatuslineLineCol#
set statusline+=%#MyStatuslineLineColBody#%2l
set statusline+=\/%#MyStatuslineLineColBody#%2c
set statusline+=%#MyStatuslineLineCol#
" " Padding
set statusline+=\ "
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

" hi statusline ctermfg=235 ctermbg=245 guibg=none
" hi vertsplit ctermfg=235 ctermbg=none guibg=none guifg=none
" hi nonascii  ctermfg=none ctermbg=none  guibg=none guifg=none
hi comment cterm=italic gui=italic
hi def link nerdtreedirslash folded
hi def link nerdtreero statement
hi def link nerdtreebookmark statement
hi def link nerdtreeflags statement
hi def link nerdtreedir folded
hi def link nerdtreeup folded
hi def link nerdtreefile folded
hi def link nerdtreecwd folded
hi def link nerdtreeopenable folded
hi def link nerdtreeclosable folded
hi def link nerdtreeignore folded


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
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>i <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>i :call PhpInsertUse()<CR>

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
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>cm :call phpactor#ContextMenu()<CR>

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

" vim-test
"
if has('nvim')
   let test#strategy = "neovim"
   tmap <C-o> <C-\><C-n>
else
   let test#strategy = "vimterminal"
endif
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" pangloss/vim-javascript
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_arrow_function       = "⇒"

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

" vim-devicon
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:DevIconsEnableFoldersOpenClose = v:true
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

" FZF
nnoremap <C-p> :call Fzf_files_with_dev_icons()<CR>
nnoremap <leader>m :FZFFreshMru<cr>
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
let g:fzf_colors = {
			\ 'fg':      ['fg', 'Fold'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Error'],
			\ 'fg+':     ['fg', 'String'],
			\ 'bg+':     ['bg', 'Normal'],
			\ 'hl+':     ['fg', 'Error'],
			\ 'info':    ['fg', 'Type'],
            \ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Special'],
			\ 'pointer': ['fg', 'Statement'],
			\ 'marker':  ['fg', 'Statemetn'],
			\ 'spinner': ['fg', 'Statement'],
			\ 'header':  ['fg', 'Special'],
            \ }
" fzf + devicons
function! Fzf_files_with_dev_icons()
  let l:fzf_files_options = ' -m --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up --preview "bat --theme=base16 --color always --style numbers {2..}"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

hi Normal guibg=none
