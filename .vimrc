" Pathogen
" Call this before enabling filetype detection
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"call pathogen#infect()

if &term =~ "xterm"
 " Enable 256 color
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif


if has('gui_running')
    set guioptions-=T
    "set guioptions-=r
    set lines=40 columns=100

    if has("gui_gtk2")
        "set guifont=Inconsolata\ 10
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif
endif


" ===== Basic Settings =====

colorscheme wombat256

filetype on
filetype plugin on
syntax enable

set number
set ignorecase
set smartcase 
set autoindent

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

set splitbelow " Split windows at bottom

" Change cursor based on insert mode or normal mode
highlight Cursor guifg=black guibg=orange
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait1


" ===== Key bindings =======

" 'Y' yanks entire line
map Y y$
" Global variable replace
nnoremap gr :%s/<C-R><C-W>//gc<left><left><left>
nnoremap gR :%s/<C-R><C-W>//g<left><left>

