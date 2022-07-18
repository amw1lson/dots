" Vim color file
" Maintainer:	Austin Wilson <amwilson@college.harvard.edu>
" Last Change:	2022 April 2

" dec - a dec emulator colorscheme for vim

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "dec"

hi Normal	guifg=darkgreen guibg=black	ctermfg=green ctermbg=black
hi ErrorMsg	guifg=black guibg=lightgreen	ctermfg=lightgreen ctermbg=lightgreen
hi Visual       guifg=lightgreen guibg=lightgreen ctermbg=lightgreen ctermfg=black
hi VisualNOS	guifg=lightgreen guibg=fg	gui=reverse,underline	ctermfg=lightgreen ctermbg=fg cterm=reverse,underline
hi Todo		guifg=green guibg=black	ctermfg=green	ctermbg=black
hi Search	cterm=NONE ctermfg=black ctermbg=lightgreen cterm=underline term=underline
hi IncSearch	guifg=green guibg=black	ctermfg=black ctermbg=lightgreen

hi SpecialKey	guifg=cyan	ctermfg=green
hi Directory	guifg=cyan	ctermfg=cyan
hi Title	guifg=green gui=none ctermfg=green cterm=bold
hi WarningMsg	guifg=green	ctermfg=green
hi WildMenu	guifg=green guibg=black ctermfg=green ctermbg=black cterm=none term=none
hi ModeMsg	guifg=green	ctermfg=green
hi MoreMsg	ctermfg=22	ctermfg=22
hi Question	guifg=green gui=none ctermfg=green cterm=none
hi NonText	guifg=lightgreen	ctermfg=green

hi StatusLine	guifg=green guibg=22 gui=none	ctermfg=black ctermbg=green term=none cterm=none
hi StatusLineNC	guifg=black guibg=22 gui=none	ctermfg=black ctermbg=22 term=none cterm=none
hi VertSplit	guifg=black guibg=22 gui=none	ctermfg=black ctermbg=green term=none cterm=none

hi Folded	guifg=22 guibg=black	ctermfg=22 ctermbg=black cterm=bold term=bold
hi FoldColumn	guifg=22 guibg=black	ctermfg=22 ctermbg=black cterm=bold term=bold
hi LineNr	guifg=green	ctermfg=green cterm=none

hi DiffAdd	guibg=black ctermbg=black term=none cterm=none
hi DiffChange	guibg=green ctermbg=green cterm=none
hi DiffDelete	ctermfg=green ctermbg=green gui=bold guifg=green guibg=green
hi DiffText	cterm=bold ctermbg=green gui=bold guibg=green

hi Cursor       guifg=bg guibg=lightgreen ctermfg=black ctermbg=lightgreen
hi Search       ctermfg=black ctermbg=darkgreen

hi Comment	ctermfg=lightgreen guifg=lightgreen 
hi Constant	ctermfg=green guifg=green cterm=none
hi Special	ctermfg=green guifg=Orange cterm=none gui=none
hi Identifier	ctermfg=green guifg=cyan cterm=none
hi Statement	ctermfg=green cterm=none guifg=lightgreen gui=none
hi PreProc	ctermfg=green guifg=green gui=none cterm=none
hi type		ctermfg=green guifg=green gui=none cterm=none
hi Underlined	cterm=underline term=underline
hi Ignore	guifg=bg ctermfg=bg

