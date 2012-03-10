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
    set guioptions-=T " Disable toolbar
    "set guioptions-=r
    set lines=40 columns=100

    if has("gui_gtk2")
        "set guifont=Inconsolata\ 10
    elseif has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")


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
