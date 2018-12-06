" vim:fdm=marker

" Vim-Plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'blueyed/vim-diminactive'
Plug 'editorconfig/editorconfig-vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-gutentags'
Plug 'pbogut/fzf-mru.vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'nelstrom/vim-visual-star-search'
Plug 'pangloss/vim-javascript'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', { 'do': 'npm install'}
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'stanAngeloff/php.vim', { 'for': 'php' }
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
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
set grepprg='ag'           " Use the silver searcher instead of grep
set cursorline            " Highlight the current line
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
" set termguicolors

set tags+=tags,tags.vendors

" statusline
set statusline=%=\ %f\ %m
" set fillchars=vert:\ ,stl:\ ,stlnc:\
set noshowmode
set clipboard=unnamed

" }}}
" Colorscheme {{{
set background=dark
colorscheme gruvbox

highlight Normal ctermbg=None guibg=NONE
hi Default ctermfg=1
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
highlight Visual ctermbg=4 ctermfg=0
highlight NonText ctermbg=NONE ctermfg=234
highlight Comment cterm=italic gui=italic
highlight clear SignColumn
highlight clear SignWarning
highlight clear SignSWarning
highlight clear SignSError
highlight vertsplit ctermfg=235 ctermbg=NONE
highlight IncSearch    guibg=red ctermbg=233   ctermfg=3
highlight Search       guibg=red ctermbg=233   ctermfg=1
" highlight Search ctermbg=58 ctermfg=15
highlight MatchParen   cterm=none ctermbg=1  ctermfg=0
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii  ctermfg=NONE ctermbg=NONE
hi EndOfBuffer ctermfg=237 ctermbg=235
hi link NERDTreeOpenable GruvboxYellow
hi link NERDTreeClosable GruvboxYellow

" hi vertsplit ctermfg=238 ctermbg=235
" hi LineNr ctermfg=237
" hi StatusLine ctermfg=235 ctermbg=245
" hi StatusLineNC ctermfg=235 ctermbg=237
" hi Search ctermbg=58 ctermfg=15
" hi Default ctermfg=1
" hi clear SignColumn
" hi SignColumn ctermbg=235
" hi GitGutterAdd ctermbg=235 ctermfg=245
" hi GitGutterChange ctermbg=235 ctermfg=245
" hi GitGutterDelete ctermbg=235 ctermfg=245
" hi GitGutterChangeDelete ctermbg=235 ctermfg=245
" hi EndOfBuffer ctermfg=237 ctermbg=235


"ale hi
highlight CursorLine ctermbg=236

" hi ALEError guibg=re
hi link ALEErrorSign GruvboxYellow
hi ALEError  ctermfg=245
hi ALEWarning  ctermfg=245
hi ALEWarningSign  ctermfg=245

" }}}
" Autocommands and functions {{{

" vue (fix highlight when stop working)
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors = 1

" php.vim
function! PhpSyntaxOverride()
    hi! def link phpType phpIdentifier
    hi! def link phpSCKeyword phpIdentifier
    hi! phpClass cterm=italic ctermfg=106 gui=italic guifg=#edb443
    hi! phpStaticClasses cterm=italic ctermfg=172 gui=italic guifg=#edb443
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

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
autocmd BufRead,BufNewFile *.blade.php set filetype=blade.html
autocmd BufRead,BufNewFile *.js set tabstop=2 shiftwidth=2 tabstop=2
autocmd BufRead,BufNewFile *.rb set tabstop=2 shiftwidth=2 tabstop=2
autocmd FileType vue syntax sync fromstart

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

" gutentags
let g:gutentags_ctags_extra_args = [
            \ '--recurse=yes',
            \ '--tag-relative=yes',
            \ '--exclude=.git',
            \ '--languages=php',
            \ '--PHP-kinds=+cdfint-av',
            \ '--langmap=php:.engine.inc.module.theme.install.php',
            \ '--PHP-kinds=+cf-v'
            \]
let g:gutentags_ctags_exclude = [
            \ '*.css', '*.html', '*.js', '*.json', '*.xml',
            \ '*.phar', '*.ini', '*.rst', '*.md',
            \ '*var/cache*', '*var/log*'
            \]

"php pactor
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>cm :call phpactor#ContextMenu()<CR>

" php server
au User lsp_setup call lsp#register_server({
            \ 'name': 'php-language-server',
            \ 'cmd': {server_info->['php', expand('~/.vim/plugged/php-language-server/bin/php-language-server.php')]},
            \ 'whitelist': ['php'],
            \ })


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
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_php_phpcs_standard='psr2 -n'
"let g:ale_php_phpcs_use_global=1

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
let g:fzf_layout = { 'down': '~50%' }
nnoremap <C-p> :FZF<CR>
nnoremap <leader>m :FZFFreshMru<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_colors = {
			\ 'fg':      ['fg', 'GruvboxGray'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'GruvboxRed'],
			\ 'fg+':     ['fg', 'GruvboxGreen'],
			\ 'bg+':     ['bg', 'GruvboxBg1'],
			\ 'hl+':     ['fg', 'GruvboxRed'],
			\ 'info':    ['fg', 'GruvboxOrange'],
			\ 'prompt':  ['fg', 'GruvboxBlue'],
			\ 'header':  ['fg', 'GruvboxBlue'],
			\ 'pointer': ['fg', 'Error'],
			\ 'marker':  ['fg', 'Error'],
			\ 'spinner': ['fg', 'Statement'],
            \ }

" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

