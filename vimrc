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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-emoji'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'nelstrom/vim-visual-star-search'
Plug 'laurentb/vim-cute-php'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'rking/ag.vim', { 'on': ['Ag']}
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'stanAngeloff/php.vim', { 'for': 'php' }
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'whatyouhide/vim-gotham'
Plug 'w0rp/ale'
Plug 'arnaud-lb/vim-php-namespace'


" Add plugins to &runtimepath
call plug#end()
" }}}
" Base config {{{
let mapleader=','
set laststatus=2          " Make visible the status bar
syntax on                  " Turn on syntax highlighting
set grepprg='ag'           " Use the silver searcher instead of grep
" set cursorline            " Highlight the current line
set visualbell            " Don't beep
set noerrorbells          " Don't beep
set hlsearch              " Highlight search
set incsearch             " Highlight while typing the search
set ignorecase            " Make search case-insensitive
set lazyredraw            " Redraw only when we need to
set conceallevel=1
set concealcursor=nc
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
set termguicolors

set tags+=tags,tags.vendors
" }}}
" Colorscheme {{{
set bg=dark
colorscheme gruvbox

 hi link NERDTreeOpenable GruvboxYellow
 hi link NERDTreeClosable GruvboxYellow
highlight Normal ctermbg=None guibg=NONE
highlight Visual ctermbg=4 ctermfg=0
" highlight NonText ctermbg=NONE ctermfg=234
highlight Comment cterm=italic gui=italic
highlight clear SignColumn
highlight clear SignWarning
highlight clear SignSWarning
highlight clear SignSError
highlight clear Conceal
highlight VertSplit    guibg=NONE guifg=#bd93f9 ctermbg=233 ctermfg=4
highlight IncSearch    guibg=red ctermbg=233   ctermfg=3
highlight Search       guibg=red ctermbg=233   ctermfg=1
highlight MatchParen   cterm=none ctermbg=1  ctermfg=0
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii  ctermfg=NONE ctermbg=NONE
"ale hi
hi clear ALEError
hi clear ALEErrorSign
hi clear ALEWarning
hi clear ALEWarningSign
" }}}
" Autocommands and functions {{{

" php.vim
function! PhpSyntaxOverride()
    hi! def link phpType phpIdentifier
    hi! def link phpSCKeyword phpIdentifier
    hi! phpClass cterm=italic gui=italic guifg=#edb443
    hi! phpStaticClasses cterm=italic gui=italic guifg=#edb443
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

" pangloss/vim-javascript
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_arrow_function       = "⇒"

"ale
" let g:ale_sign_error = '!'
" let g:ale_sign_warning = '$'
let g:ale_sign_error = emoji#for('boom')
let g:ale_sign_warning = emoji#for('small_orange_diamond')
let g:ale_php_phpcs_standard='psr2 -n'

let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'html': [''],
      \}

" vim-devicon
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '^V' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '^S' : 'S',
            \ }

" CtrlP
let g:ctrlp_max_height = 30
let g:ctrlp_custom_ignore = '\.git$\|public\/images$\|public\/uploads$\|log\|tmp$\|node_modules\|bower_components\'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode=0

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
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

" CtrlP
nnoremap <C-p> :CtrlP<CR>
nnoremap <leader>m :CtrlPMRU<CR>

" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

