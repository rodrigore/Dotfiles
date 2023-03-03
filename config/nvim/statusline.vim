set statusline=%=\ %f\ %m

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
