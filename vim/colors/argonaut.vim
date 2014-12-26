" Vim color file
" Converted from Textmate theme Argonaut using Coloration v0.3.3 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Argonaut"

hi Cursor ctermfg=16 ctermbg=39 cterm=NONE guifg=#101421 guibg=#00a2fa gui=NONE
hi Visual ctermfg=NONE ctermbg=23 cterm=NONE guifg=NONE guibg=#00384c gui=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#212531 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=17 cterm=NONE guifg=NONE guibg=#212531 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=200 cterm=NONE guifg=NONE guibg=#212531 gui=NONE
hi LineNr ctermfg=59 ctermbg=236 cterm=NONE guifg=#686a70 guibg=#212531 gui=NONE
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#43464f guibg=#43464f gui=NONE
hi MatchParen ctermfg=154 ctermbg=NONE cterm=underline guifg=#a4ed2d guibg=NONE gui=underline
hi StatusLine ctermfg=250 ctermbg=59 cterm=bold guifg=#bfbfbf guibg=#43464f gui=bold
hi StatusLineNC ctermfg=250 ctermbg=59 cterm=NONE guifg=#bfbfbf guibg=#43464f gui=NONE
hi Pmenu ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=23 cterm=NONE guifg=NONE guibg=#00384c gui=NONE
hi IncSearch ctermfg=16 ctermbg=221 cterm=NONE guifg=#101421 guibg=#ffd852 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Folded ctermfg=97 ctermbg=16 cterm=NONE guifg=#815db3 guibg=#101421 gui=NONE

hi Normal ctermfg=250 ctermbg=235 cterm=NONE guifg=#bfbfbf guibg=#101421 gui=NONE
hi Boolean ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Character ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Comment ctermfg=97 ctermbg=NONE cterm=NONE guifg=#815db3 guibg=NONE gui=NONE
hi Conditional ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi DiffAdd ctermfg=250 ctermbg=64 cterm=bold guifg=#bfbfbf guibg=#427f0b gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#860407 guibg=NONE gui=NONE
hi DiffChange ctermfg=250 ctermbg=17 cterm=NONE guifg=#bfbfbf guibg=#182f54 gui=NONE
hi DiffText ctermfg=250 ctermbg=24 cterm=bold guifg=#bfbfbf guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc400 guibg=NONE gui=NONE
hi Function ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi Identifier ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi Keyword ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi Label ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffd852 guibg=NONE gui=italic
hi NonText ctermfg=17 ctermbg=16 cterm=NONE guifg=#242841 guibg=#191d29 gui=NONE
hi Number ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc400 guibg=NONE gui=NONE
hi Operator ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi PreProc ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi Special ctermfg=250 ctermbg=NONE cterm=NONE guifg=#bfbfbf guibg=NONE gui=NONE
hi SpecialKey ctermfg=17 ctermbg=17 cterm=NONE guifg=#242841 guibg=#212531 gui=NONE
hi Statement ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi StorageClass ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi String ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffd852 guibg=NONE gui=italic
hi Tag ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi Title ctermfg=250 ctermbg=NONE cterm=bold guifg=#bfbfbf guibg=NONE gui=bold
hi Todo ctermfg=97 ctermbg=NONE cterm=inverse,bold guifg=#815db3 guibg=NONE gui=inverse,bold
hi Type ctermfg=196 ctermbg=NONE cterm=NONE guifg=#ff260e guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi rubyFunction ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyConstant ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffd852 guibg=NONE gui=italic
hi rubyBlockParameter ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyInclude ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRegexp ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffd852 guibg=NONE gui=italic
hi rubyRegexpDelimiter ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffd852 guibg=NONE gui=italic
hi rubyEscape ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyControl ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyOperator ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyException ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=97 ctermbg=NONE cterm=NONE guifg=#815db3 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=154 ctermbg=NONE cterm=NONE guifg=#a4ed2d guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi yamlAnchor ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi yamlAlias ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=221 ctermbg=NONE cterm=NONE guifg=#ffd852 guibg=NONE gui=italic
hi cssURL ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi cssFunctionName ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi cssColor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssClassName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssValueLength ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffc400 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
