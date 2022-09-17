vim9script

# .VIMRC FILE:
# From now on this file uses Vim9script.

# PLUGINS:

# Use Vim-Plug for plugins.

# FILE BROWSING:

# Use Netrw for file browsing.

g:netrw_banner = 0
g:netrw_altv = 1 
g:netrw_alto = 1 
# g:netrw_liststyle = 3
# g:netrw_browse_split = 4 
g:netrw_fastbrowse = 0
g:netrw_ffkeep = 0
g:netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
 
# Fuzzy Finder
# def FZF()
# 	tempname = tempname()
# 	# fzf | awk '{ print $1":1:0" }' > file
# 	execute 'silent !fzf --multi ' . '| awk ''{ print $1":1:0" }'' > ' . fnameescape(tempname)
# 	try
# 		execute 'cfile ' . tempname
# 		redraw!
# 	finally
# 		delete(tempname)
# 	endtry
# enddef
# 
# # :Files
# command! Files call FZF()
# 
# # \ff
# nnoremap ff :Files<cr>

# STATUSLINE:

set laststatus=2 # Always show statusline.
set statusline+=\ %y%h 
set statusline+=\ %F%R
set statusline+=%= # Right justify everything else.
set statusline+=\ col\ %c\ row\ %l\ of\ %L\ | # Output 'col x row y of line'. 

# OTHER SETTINGS:

filetype plugin indent on 
syntax on
set textwidth=100
set background=dark
# colorscheme desert

&t_SI = "\e[6 q"
&t_EI = "\e[2 q"


augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

# OPTIONS:

# Everything else is organized by :options.

# 1 IMPORTANT:

set nocompatible # Disable Vi compatibility.
set noinsertmode # Don't use insert as default mode

# 2 MOVING AROUND, SEARCHING AND PATTERNS

set startofline # Jump commands move cursor to first non-blank char of a line.
set cdhome # cd w/o arguments goes to home directory.
set autochdir # change to directory of file in buffer 
set incsearch # show match for partly typed search command 
set ignorecase # ignore case when using a search command
set smartcase  # override ignorecase when using a search pattern

# 3 TAGS

# 4 DISPLAYING TEXT

set scroll=5 # ctrl-d and ctrl-u scroll by 5
# set number
# set relativenumber

# 5 SYNTAX, HIGHLIGHTING AND SPELLING

set hlsearch
set termguicolors
set cursorline 
# set cursorcolumn 
set spell 
set spelllang=en_us 

# 6 MULTIPLE WINDOWS

set splitright  

# 7 MULTIPLE TAB PAGES

# 8 TERMINAL

set term=xterm-256color
set esckeys 
 
# 9 USING THE MOUSE

set mouse=a 

# 10 PRINTING

# 11 MESSAGES AND INFO

set showcmd

# 12 SELECTING TEXT

# 13 EDITING TEXT

# 14 TABS AND INDENTING

set tabstop=4
set shiftwidth=4 
set softtabstop=4
set expandtab
set autoindent 

# 15 FOLDING

# 16 DIFF MODE

# 17 MAPPING
# buffer
nnoremap <silent> <C-h> :bprev<CR>
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-q> :bd<CR>
nnoremap <silent> ;fj :Ex<CR>

# 18 READING AND WRITING FILES

# 19 THE SWAP FILE

# 20 COMMAND LINE EDITING

set wildmode=list:longest
set wildmenu

# 21 EXECUTING EXTERNAL COMMANDS

# 22 RUNNING MAKE AND JUMPING TO ERRORS (QUICKFIX)

# 23 LANGUAGE SPECIFIC

# 24 MULTI-BYTE CHARACTERS

# 25 VARIOUS

# 26 colorscheme setting
set background=dark

hi clear

hi Normal guifg=#ffffff guibg=#333333 gui=NONE cterm=NONE
hi! link EndOfBuffer NonText
hi StatusLine guifg=#d4c1c1 guibg=#283446 gui=NONE cterm=NONE
hi StatusLineNC guifg=#d4c1c1 guibg=#0d2a52 gui=NONE cterm=NONE
hi StatusLineTerm guifg=#333333 guibg=#c2bfa5 gui=NONE cterm=NONE
hi StatusLineTermNC guifg=#ffffff guibg=#c2bfa5 gui=NONE cterm=NONE
hi VertSplit guifg=#7f7f8c guibg=#c2bfa5 gui=NONE cterm=NONE
hi Pmenu guifg=#ffffff guibg=#666666 gui=NONE cterm=NONE
hi PmenuSel guifg=#333333 guibg=#f0e68c gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#333333 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#c2bfa5 gui=NONE cterm=NONE
hi TabLine guifg=#333333 guibg=#c2bfa5 gui=NONE cterm=NONE
hi TabLineFill guifg=NONE guibg=#c2bfa5 gui=NONE cterm=NONE
hi TabLineSel guifg=#333333 guibg=#f0e68c gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=#666666 gui=NONE cterm=NONE
hi ToolbarButton guifg=#333333 guibg=#ffde9b gui=bold cterm=NONE
hi NonText guifg=#6dceeb guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#9acd32 guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#eeee00 guibg=#4d4d4d gui=NONE cterm=NONE
hi Visual guifg=#f0e68c guibg=#6b8e24 gui=NONE cterm=NONE
hi VisualNOS guifg=#f0e68c guibg=#6dceeb gui=NONE cterm=NONE
hi LineNr guifg=#eeee00 guibg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=#eeee00 guibg=#4d4d4d gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#eeee00 guibg=NONE gui=bold cterm=NONE
hi QuickFixLine guifg=#333333 guibg=#f0e68c gui=NONE cterm=NONE
hi SignColumn guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Underlined guifg=#75a0ff guibg=NONE gui=underline cterm=underline
hi Error guifg=#ff0000 guibg=#ffffff gui=reverse cterm=reverse
hi ErrorMsg guifg=#ff0000 guibg=#ffffff gui=reverse cterm=reverse
hi ModeMsg guifg=#ffde9b guibg=NONE gui=bold cterm=NONE
hi WarningMsg guifg=#cd5c5c guibg=NONE gui=bold cterm=NONE
hi MoreMsg guifg=#9acd32 guibg=NONE gui=bold cterm=NONE
hi Question guifg=#89fb98 guibg=NONE gui=bold cterm=NONE
hi Todo guifg=#ff0000 guibg=#eeee00 gui=NONE cterm=NONE
hi MatchParen guifg=#7f7f8c guibg=#bdb76b gui=NONE cterm=NONE
hi Search guifg=#f0e68c guibg=#7f7f8c gui=NONE cterm=NONE
hi IncSearch guifg=#f0e68c guibg=#cd853f gui=NONE cterm=NONE
hi WildMenu guifg=#333333 guibg=#eeee00 gui=NONE cterm=NONE
hi ColorColumn guifg=#ffffff guibg=#cd5c5c gui=NONE cterm=NONE
hi Cursor guifg=#333333 guibg=#f0e68c gui=NONE cterm=NONE
hi lCursor guifg=#333333 guibg=#ff0000 gui=NONE cterm=NONE
hi debugPC guifg=#666666 guibg=NONE gui=reverse cterm=reverse
hi debugBreakpoint guifg=#ffa0a0 guibg=NONE gui=reverse cterm=reverse
hi SpellBad guifg=#b85454 guibg=NONE guisp=#cd5c5c gui=undercurl cterm=underline
hi SpellCap guifg=#b85454 guibg=NONE guisp=#75a0ff gui=undercurl cterm=underline
hi SpellLocal guifg=#b85454 guibg=NONE guisp=#ffde9b gui=undercurl cterm=underline
hi SpellRare guifg=#b85454 guibg=NONE guisp=#9acd32 gui=undercurl cterm=underline
hi Comment guifg=#6d5279 guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#2a6a6b guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#c4be82 guibg=NONE gui=bold cterm=NONE
hi Constant guifg=#d69090 guibg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#4a9ca1 guibg=NONE gui=NONE cterm=NONE
hi Type guifg=#a39e53 guibg=NONE gui=bold cterm=NONE
hi Special guifg=#ffde9b guibg=NONE gui=NONE cterm=NONE
hi Directory guifg=#6dceeb guibg=NONE gui=NONE cterm=NONE
hi Conceal guifg=#666666 guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Title guifg=#cd5c5c guibg=NONE gui=NONE cterm=NONE
hi! link Terminal Normal
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi DiffAdd guifg=#ffffff guibg=#5f875f gui=NONE cterm=NONE
hi DiffChange guifg=#ffffff guibg=#5f87af gui=NONE cterm=NONE
hi DiffText guifg=#000000 guibg=#c6c6c6 gui=NONE cterm=NONE
hi DiffDelete guifg=#ffffff guibg=#af5faf gui=NONE cterm=NONE

# end of vimrc
