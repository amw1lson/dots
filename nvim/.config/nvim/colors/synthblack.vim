" Vim color file
" Maintainer:	Austin Wilson <amwilson@college.harvard.edu>
" Last Change:	2022 Feb 14

" synthblack -- an alteration to the darkblack colorscheme


hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "synthblack"

hi Normal	ctermfg=lightblue ctermbg=black
hi ErrorMsg	ctermfg=red ctermbg=bg
hi Visual       ctermfg=black ctermbg=lightblue
hi VisualNOS	ctermfg=black ctermbg=lightblue cterm=reverse,underline
hi Todo		ctermfg=red	ctermbg=black
hi Search	ctermfg=lightgreen ctermbg=green 
hi IncSearch	ctermfg=lightgreen ctermbg=green

hi SpecialKey	ctermfg=blue
hi Directory	ctermfg=cyan
hi Title	ctermfg=magenta cterm=bold
hi WarningMsg	ctermfg=red
hi WildMenu	ctermbg=black cterm=none term=none
hi ModeMsg	ctermfg=lightblue
hi MoreMsg	ctermfg=darkgreen	ctermfg=darkgreen
hi Question	ctermfg=green cterm=none
hi NonText	ctermfg=lightcyan

hi StatusLine	ctermfg=lightblue ctermbg=blue term=none cterm=none
hi StatusLineNC	ctermfg=black ctermbg=gray term=none cterm=none
hi VertSplit	ctermfg=black ctermbg=gray term=none cterm=none

hi Folded	ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi FoldColumn	ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr	ctermfg=red cterm=none

hi DiffAdd	ctermbg=black term=none cterm=none
hi DiffChange	ctermbg=magenta cterm=none
hi DiffDelete	ctermfg=blue ctermbg=cyan 
hi DiffText	cterm=bold ctermbg=red 

hi Cursor       ctermfg=bg cterm=underline ctermbg=darkblue

hi Comment	ctermfg=green
hi Constant	ctermfg=red cterm=none
hi Special	ctermfg=green cterm=none
hi Identifier	ctermfg=cyan cterm=none
hi Statement	ctermfg=magenta cterm=none 
hi PreProc	ctermfg=lightblue cterm=none
hi type		ctermfg=blue cterm=none
hi Underlined	cterm=underline term=underline
hi Ignore	ctermfg=white

