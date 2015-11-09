" Vi-Plug Init Setting
set nocompatible                        " be iMproved
call plug#begin('~/.vim/plugged')

" General plugins
Plug 'bling/vim-airline'              " Status bar
" Plug 'edkolev/tmuxline.vim'         " Tmux bar generator like vim-airline
Plug 'christoomey/vim-tmux-navigator' " Navigation through Vim-Tmux panels
" Plug 'jgdavey/tslime.vim'             " Send command from Vim to a Tmux
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy file, buffer, mru, tags finder
Plug 'scrooloose/nerdtree'            " Project - Sidebar explorer
Plug 'scrooloose/syntastic'           " Syntax checking of multiples langs.
Plug 'rking/ag.vim', { 'on': ['Ag']}  " Grep with steroids
Plug 'tpope/vim-commentary'           " Make easy un/comment lines of code
Plug 'tpope/vim-fugitive'             " Nice Git wrapper(it should be ilegal)
Plug 'tpope/vim-surround'             " Add/Remove/Change surrounding text
Plug 'godlygeek/tabular'              " Line up text (like this comments)
Plug 'ryanoasis/vim-webdevicons'

" Syntax and improvements
Plug 'jelera/vim-javascript-syntax'           " Enhanced js syntax
Plug 'pangloss/vim-javascript'                " Indentation and syntax improved for js files
Plug 'Raimondi/delimitMate'                   " Autocompletion for quotes, parens, brackets, etc.
Plug 'tpope/vim-endwise'                      " Autocompletion the 'end' word in langs like ruby, lua
Plug 'vim-scripts/camelcasemotion'            " Motion for CamelCaseWords and underscore_notation
Plug 'stephpy/vim-php-cs-fixer'               " Run PHP CS Fixer
Plug 'rodrigore/php.vim'                      " Modern PHP syntax 5.3, 5.4, 5.5

" Colorschemes
Plug 'crusoexia/vim-dracula'
Plug 'chriskempson/base16-vim'
Plug 'jpo/vim-railscasts-theme'

" Testing
Plug 'ktonga/vim-follow-my-lead'

call plug#end()
filetype plugin indent on               " [Vundle requirement]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","        " Change the default leader '\' to ','
syntax on                  " Turn on syntax highlighting
set grepprg='ag'           " Use the silver searcher instead of grep
set noswapfile             " No swap files (I don't like files.swap)
set nobackup               " No backup files
set hidden                 " Open files without saving the current file
set autoread               " Allow read files that changes outside vim
set encoding=utf-8         " Set the encoding that is showing in the terminal
set fileencoding=utf-8     " Set the encoding of the file that is written
set backspace=indent,eol,start  " allow backspacing over everything in insert
mode
set visualbell             " Don't beep
set noerrorbells           " Don't beep
set autoread

if !has("gui_running")
    set term=screen-256color " Colourful and uniform behaviuor with Tmux/Screen
endif
set t_Co=256                " 256 color for terminal

if exists('$TMUX')
  set clipboard=
else
  set clipboard=unnamedplus " Sync with OS clipboard
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let base16colorspace=256   " Make the base16-theme  look pretty in the terminal
set background=dark        " Make the background color to dark
" colorscheme base16-railscasts " Cool and pretty colorscheme
colorscheme dracula

highlight Normal ctermbg=None
highlight clear SignColumn
highlight clear SignWarning
highlight clear SignSWarning
highlight clear SignSError
highlight clear Conceal

highlight VertSplit    guibg=NONE guifg=#bd93f9 ctermbg=233 ctermfg=4
highlight IncSearch    guibg=red ctermbg=233   ctermfg=3
highlight Search       guibg=red ctermbg=233   ctermfg=1
highlight MatchParen   cterm=none ctermbg=1  ctermfg=0

" highlight Visual       ctermbg=3   ctermfg=0
" highlight Pmenu        ctermbg=240 ctermfg=12
" highlight PmenuSel     ctermbg=0   ctermfg=3

" highlight CursorLineNr ctermfg=3 ctermbg=237
" highlight CursorLineNr ctermbg=236 ctermfg=240
" highlight CursorLine  ctermbg=238

" highlight LineNr ctermbg=black ctermfg=239 guibg=#2b303b " Set background color of numbers
" highlight WildMenu ctermfg=3 " Set background color of wildmenu
" highlight ColorColumn ctermbg=237            " Color of the 'cursor' at 81
call matchadd('ColorColumn', '\%81v', 100)   " Highlight the character at the column 81

hi clear SpellBad                            " This is the spelling error group
hi SpellBad cterm=underline,bold ctermfg=red " Highlight bad spell words to underline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Vim UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set number                " Show line numbers
" set relativenumber        " Show line with relative number

set hlsearch              " Highlight search
set incsearch             " Highlight while typing the search
set ignorecase            " Make search case-insensitive
set lazyredraw            " Redraw only when we need to
                          " (do not redraw while running macros)

set nowrap                " Don't Wrap the text (windows size)
set linebreak             " Wrap at 'breakat' instead of the last character
set tabstop=4             " The width of a tab is four spaces
set shiftwidth=4          " Spaces to use when (auto)indent.
set softtabstop=4         " when hitting <BS>, pretend like a tab is removed, even if spaces"
set expandtab             " Use spaces instead of Tabs
set shiftround            " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent            " always set autoindenting on
set copyindent            " copy the previous indentation on autoindenting

set formatoptions-=o      " Don't auto-comment the next line when pressing 'o'
                          " Actually is not working for me :'(
set laststatus=2          " Make visible the status bar
set wildmenu              " Autocomplete like zsh in command mode
set noshowmode            " Hide mode from bottom status
set cursorline            " Highlight the current line
set scrolloff=999         " Keep the cursor vertically centered
set ttyfast               " For better redrawing when scrolling

" set list                               " Enable listschars
" set listchars=tab:·.,trail:.,extends:> " Show tabs and trailing

let g:html_indent_inctags = "html,body,head,tbody" " Indent html tag (Vim 7.4)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Plugin Customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" vim commentary
autocmd FileType blade set commentstring={{--%s--}}
" autocmd FileType blade.php set tabstop=2 shiftwidth=2  softtabstop=2

" make PHP conform to PSR-1 standards
au FileType blade set textwidth=0

" php.vim
let php_var_selector_is_identifier=1

" Php CS Fixer
let g:php_cs_fixer_level = "psr2"                  " which level ?
let g:php_cs_fixer_config = "default"             " configuration
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 1                    " Return the output of command if 1, else an inline information.

" Status line: Vim-airline
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 1
" let g:airline_theme='bubblegum'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" Replace Branch with te current working directory, followed by the filename.
" let g:airline_section_b = '%{getcwd()}'
" let g:airline_section_c = '%t'

" Add Tabs, Line, Column and Total lines to the right
" Taken from: https://github.com/remiprev/vimfiles/blob/8329f4cb1090b58c5b0d631f1b21bc567ec7333d/settings.vim#L116-146
" let g:airline_section_x= airline#section#create(['filetype',' tab:%{&ts}, %{&sts}, %{&sw}, %{&et? "et": "noet"}'])
" let g:airline_section_z='line:%l, col: %c, total: %L'

" Add Shortmode
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }



" Fix delay when you leave insert mode
if ! has('gui_running')
  set ttimeoutlen=10
endif

"CtrlP
let g:ctrlp_max_height = 30
let g:ctrlp_custom_ignore = '\.git$\|\.o$\|\.app$\|\.beam$\|\.dSYM\|\.ipa$\|\.csv\|tags\|public\/images$\|public\/uploads$\|log\|tmp$\|source_maps\|app\/assets\/images\|test\/reports\|node_modules\|bower_components'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0

"AG
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Javascript syntax 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'angularjs,jquery'

"syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=psr2"
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_html_checkers=['']

" rainbow
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

"tmux-line
" let g:tmuxline_preset = {
"       \'a'    : '#S',
"       \'b'    : '#W',
"       \'win'  : '#I #W',
"       \'cwin' : '#I #W',
"       \'x'    : '%a',
"       \'y'    : ['%R', '#[fg=yellow] #(~/dotfiles/weather_santiago)'],
"       \'z'    : '#H'}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source vimrc after save vimrc and then refresh airline
autocmd! BufWritePost .vimrc,vimrc source $MYVIMRC | AirlineRefresh

" Auto-remove trailing spaces
autocmd BufWritePre * call StripWhitespace()

autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell         " Enable spell check on git commit messages

autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby    " Highlight Vagrant files like ruby
autocmd BufRead,BufNewFile *.md,*.txt set filetype=markdown " Highlight Markdown files

autocmd BufRead,BufNewFile *.go  set tabstop=4 shiftwidth=4  softtabstop=4
autocmd BufRead,BufNewFile *.php set tabstop=4 shiftwidth=4 tabstop=4
autocmd BufRead,BufNewFile *.blade.php set filetype=html
autocmd Filetype js set tabstop=2 shiftwidth=2 tabstop=2

" Make sure Vim open in the same line when you reopen a file.
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Plugins Map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDtree
nnoremap <leader>n :NERDTreeToggle<CR>

function! NERDTreeHighlightFile(extension, symbol, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+\[' .  a:symbol .'\s\+\]#'
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 " exec 'autocmd filetype nerdtree highlight def link ' . a:extension .' Function'
endfunction

let s:orange = "215"
" let s:pink   = "212"
" let s:green  = "84"
" let s:aqua   = "117"
" let s:yellow = "228"
" let s:orange = "215"
" let s:purple = "141"
" let s:red    = "231"

call NERDTreeHighlightFile('ini', '', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('php', '', 'cyan', 'none', '#ff0000', '#ff0000')
call NERDTreeHighlightFile('gulp', '', s:orange, 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('json', '', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('js', '', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', '', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('html', '', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('md', '', 'Magenta', 'none', '#ff00ff', '#151515')
" source: https://github.com/scrooloose/nerdtree/issues/201#issuecomment-9954740

" CtrlP
nnoremap <C-p> :CtrlP<CR>
nnoremap <leader>m :CtrlPMRU<CR>

" Commentary
map <leader>cc <Plug>CommentaryLine
map <leader>cu <Plug>CommentaryUndo
xmap <leader>cc <Plug>Commentary

" Camelcase plugin
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" tslime
" vmap <C-c><C-c> <Plug>SendSelectionToTmux
" nmap <C-c><C-c> <Plug>NormalModeSendToTmux

" tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>

"Vim-smooth-scroll
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 1, 7)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 1, 7)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast source .vimrc
map <Leader>so :so $MYVIMRC<CR>

" Make Arrowkey do something usefull, resize the viewports accordingly
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Up> :resize -5<CR>
nnoremap <Down> :resize +5<CR>

" Erase the highlighting of a search
nnoremap <space><space> :nohlsearch<cr>

" Yank to clipboard OS
vnoremap <leader>y "+y
nnoremap <leader>y "+y
" nnoremap p "+p
" nnoremap P "+P

" Delete buffer without losing the split window
" http://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
nmap <leader>d :bp \| sp \| bn \| bd! <cr>

" Fast save
nmap <leader>w :w!<CR>
imap <leader>w <esc>:w<CR>

" Delete a line forever (Black hole register)
nnoremap <space>d "_dd

" Repeat last command
map @@ @:

" Auto change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Set (No)Paste Toogle
set pastetoggle=<leader>z

" Fast Paste
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>


" pbcopy for OSX copy/paste
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" Navigation
nnoremap j gj
nnoremap k gk
" nnoremap $ g$ "only with set wrap
" nnoremap 0 g0 " only with set wrap

" bind K to grep word under cursor
nnoremap <leader>K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Move between buffers
nmap gn :bnext<cr>
nmap go :bprevious<cr>
map <Leader>t :bnext<Return>
map <Leader>a :bprevious<Return>

" Move between buffers - Only GUI
nmap <C-Tab> :bnext<cr>
nmap <C-S-Tab> :bprevious<cr>

" Move between quickfix like unimpaired.vim
map ]q :cnext<cr>
map [q :cprev<cr>
map [Q :cfirst<cr>
map ]Q :clast<cr>

" List buffer
nmap <Leader>bb :ls<CR>:buffer<Space>

" Disabled Exit Mode
nnoremap Q <nop>

" 'Maximize' window split
" nmap <C-w>- :res<CR>:vertical res<CR>$

" Save read-only files
cnoremap sudow w !sudo tee % >/dev/null

" Fast access to frequent files
map <Leader>vi :vsp $MYVIMRC<CR>  " Obviously :)
map <Leader>cn :vsp ~/Documents/connections-data.txt<CR>
map <Leader>pn :vsp ~/Documents/project-notes.txt<CR>

" Bubble single lines
nmap <C-k> ddkP
nmap <C-j> ddp

" Bubble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'

" Motion for "next object". For example, "din(" would go to the next "()" pair
" and delete its contents.
" Taken from: https://gist.github.com/AndrewRadev/1171559

onoremap an :<c-u>call <SID>NextTextObject('a')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i')<cr>

function! s:NextTextObject(motion)
  echo
  let c = nr2char(getchar())
  exe "normal! f".c."v".a:motion.c
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             TEMP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hack to render Vim in Iterm2 'faster' when scrolling
set fillchars=diff:⣿,vert:│
set fillchars=diff:⣿,vert:\|

" Change Cursor shape for Tmux running in iTerm2
if $TMUX != ""
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  " change Cursor shape for iTerm2
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
