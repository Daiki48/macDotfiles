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
g:netrw_timefmt = "%Y/%m/%d(%a) %H:%M:%S"
 
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
colorscheme desert

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
set cursorcolumn 
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

# end of vimrc
