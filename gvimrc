set linespace=6
set guifont=Source\ code\ pro\ for\ Powerline:h14
set go-=L                       " Removes left hand scroll bar
set guioptions-=T               " hide toolbar
set guioptions-=r               " hide scrollbar
"set lines=999 columns=999       "Maximize gvim window.

" Yank-Paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
