" Vim color file
" Maintainer:	Thorsten Maerz <info@netztorte.de>
" Last Change:	2001 Jul 23
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "whamoocolor"


"
" COLOR DEFINITION
"

hi Azure        guifg=#87ceff
hi Aquamarine   guifg=#2db0c2
hi Violeta       guifg=#b77cff


hi pythonDot guifg=#90f020

" html
"
hi htmlEndTag guifg=#35eeff
hi htmlTag guifg=#35eeff

" GUI
highlight Normal     guifg=#87ceff	guibg=#2f4f4f
highlight Search     guifg=#90fff0	guibg=#1248d1	
highlight Visual     guifg=#229e98	guibg=fg	
highlight Cursor     guifg=#000020	guibg=#ffaf38	
highlight Comment    guifg=#cd950c
highlight Statement  guifg=#3cb371
"highlight Type	     guifg=#20b2aa
highlight Type	     guifg=#95db66
"highlight Constant   guifg=#cd950c
highlight Constant   guifg=#b586ee
highlight Identifier guifg=#35eeff

"highlight Function   guifg=#20b2aa 
highlight Function   guifg=#95db66
highlight PreProc    guifg=#b0c4de
highlight LineNr     guifg=#90f020
highlight NonText    guifg=#3cb371
highlight ModeMsg    guifg=#3cb371
highlight MoreMsg    guifg=#cd950c
highlight Question   guifg=#cd950c
highlight Title      guifg=#95db66
 
highlight Special    guifg=Orange
"highlight StatusLine guifg=Blue 	guibg=Darkgray  gui=NONE
highlight Directory  guifg=#35eeff

" Tab color
hi TabLine guibg=#00487D guifg=#20b2aa gui=NONE
hi TabLineSel guibg=#009999 gui=NONE 
hi TabLineFill guibg=#00487D guifg=#00487D 

" status bar
"highlight StatusLine guifg=#000000 guibg=#00487D 
hi User1 guifg=#009999 guibg=#00487D 



" Cursor Line
hi cursorline guibg=#00487D

" Folding color
hi Folded	     guifg=#87ceff guibg=#2C664F
hi FoldColumn        guifg=#87ceff guibg=#2f4f4f

"Omni menu colors                                                        
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff


"Diff
hi DiffAdd guibg=#3b7241
hi DiffDelete guifg=#87ceff guibg=#933e3e
hi DiffText guifg=#87ceff guibg=#233a5f
hi DiffChange guifg=#87ceff guibg=#546b91

