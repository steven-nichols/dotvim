" ===== Basic Settings =====
" Color scheme -- put custom colors in ~/.vim/colors/<colorname>.vim
"colorscheme wombat256
colorscheme wombat256mod

" Turn on filetype detection and syntax highlighting
filetype on
filetype plugin on
syntax enable

" Show line numbers
set number

" ignorecase + smartcase will ignore case unless a captial letter was used in the search.
set ignorecase
set smartcase 

" Tab behavior
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Turn on auto-indentation
set autoindent

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
    set spl=en spell
    set nospell
endif

" Split windows at bottom
set splitbelow 


" ===== Custom key bindings =====
" 'Y' yanks entire line
map Y y$

" Copy & paste
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-Y> "+Y
vnoremap <C-Y> "+Y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Global variable replace
nnoremap gr :%s/<C-R><C-W>//gc<left><left><left>
nnoremap gR :%s/<C-R><C-W>//g<left><left>

" :W invokes sudo
command W w !sudo tee % > /dev/null


" ===== Terminal/GUI specific config =====

" Enable 256-color
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

" Nicer gVim settings
if has('gui_running')
    set guioptions-=T " Disable toolbar
    "set guioptions-=r
    set lines=40 columns=100

    if has("gui_gtk2")
        "set guifont=Inconsolata\ 10
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif
endif

" ===== Cursor colors =====
" Change cursor based on insert mode or normal mode

if &term =~ "xterm"
  " Insert mode cursor color
  let &t_SI = "\<Esc>]12;orange\x7"

   " Normal mode cursor color
  let &t_EI = "\<Esc>]12;steelblue\x7"
  silent !echo -ne "\033]12;steelblue\007"

  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal 
endif

if has('gui_running')
    highlight iCursor guifg=black guibg=orange
    highlight Cursor guifg=white guibg=steelblue
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait1
endif

