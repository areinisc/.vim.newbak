" Custom VIM Settings
" Original: Luke Maciak (2013); Modified by: Alex Reinisch
" Vim 7.3 recommended.

"============= Runtime Stuff ==================================================
" probably not necessary, but...
set nocompatible

" disable beeping
set noerrorbells
set visualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" Enable mouse usage (all modes) in terminals
set mouse=a

" Change the leader key to <space>
nnoremap <space> <nop>
let mapleader="\<space>"

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" use blowfish encryption (stronger than standard)
" Why? Just because. Only in recent versions
if v:version >= 703
    set cryptmethod=blowfish
endif

"============= System Specific Settings =======================================

if has('win32')
    " #############################
    " ########## WINDOWS ########## 
    " #############################

    " Make Cygwin the default shell on windows. This requires additional 
    " explanations below:
    "
    "   I'm using:
    "       - PuttyCyg: http://code.google.com/p/puttycyg/
    "       - VimShell: http://code.google.com/p/vimshell/
    "
    "   Drop vimrun.exe into $VIMRUNTIME directory
    "   Create shell.txt in $VIMRUNTIME with following contents:
    "
    "       putty.exe" -cygterm "bash -i '#F;read;#'"
    "       putty.exe" -cygterm "bash '#F#'"
    "       putty.exe" -cygterm -
    "
    " See http://www.terminally-incoherent.com/blog/2012/09/24/using-vim-and-cygwin/ 
    " 
    " These lines will make vim launch shell escape processes in PuttyCyg 
    " terminal using Cygwin:
    "
        "set shellxquote=
        "set shellpipe=2>&1\|tee
        "set shellredir=>%s\ 2>&1
        "set shellslash

    " Use Powershell as the default shell on windows:
    set shell=powershell
    set shellcmdflag=-command

    " Fix Ruby path to ensure things are working
    " this may need to be changed on your system
    let g:ruby_path = ':C:\Ruby193\bin'

" options for Mac only
elseif has('mac')
    " #############################
    " ##########  APPLE  ########## 
    " #############################

    " disable the annoying Byte Order Mark that ruins shell scripts
    set nobomb

" options for every other system
else   
    " #############################
    " ##########  LINUX  ########## 
    " #############################

    if !has("gui_running")
        " Change the cursor shape in Gnome Terminal based on the mode
        au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Solarized/cursor_shape ibeam"
        au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Solarized/cursor_shape block"

        " Try changing the mode in non-GnomeTerm consoles (including Tmux)
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif

endif

"=============  UI Options ====================================================

" FONT SETTINGS for all platforms
if has('win32')
                    set gfn=Consolas:h10:cANSI
elseif has('mac')
                    set gfn=Monaco:h12	
else   
                    set gfn=Inconsolata\ Medium\ 10
endif

" remove unnecessary toolbars (why do they exist anyway?)
if has('gui_running')
    set guioptions-=T 			" disable tool bar
    set guioptions-=m 			" disable menu bar

    " make the default window bigger 	
    if has('win32')
        " on my win machine 45 always puts status bar off screen
        " that's the only reason for this difference
        set lines=35 columns=160
    else
        set lines=45 columns=160
    endif
endif

"============= Key Mappings ===================================================

" press ; to issue commands in normal mode (no more shift holding)
nnoremap ; :

" move by screen lines, not by real lines - great for creative writing
nnoremap j gj
nnoremap k gk

" also in visual mode
xnoremap j gj
xnoremap k gk

" insert current date on F10 - useful for dated logs or journals
nnoremap <F10> "=strftime("%a %b %d, %Y")<CR>P
inoremap <F10> <C-R>=strftime("%a %b %d, %Y")<CR>

" run ctags on current directory recursively
nnoremap <f6> :!ctags -R<cr>

" pressing <leader><space> clears the search highlights
nmap <silent> <leader><space> :nohlsearch<CR>

" break a line at cursor without exiting normal mode
nnoremap <silent> <leader><CR> i<CR><ESC>

" insert a blank line with <leader>o and <leader>O
nnoremap <silent> <leader>o o<ESC>
nnoremap <silent> <leader>O O<ESC>

" use jj to quickly escape to normal mode while typing 
inoremap jj <ESC>

" toggle paste mode (to paste properly indented text)
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

" use ,y and ,p to copy and paste from system clipboard
noremap <leader>y "+y
noremap <leader>Y "+Y

" when pasting from clipboard toggle the paste feature and use the indent
" adjusted paste ]p and ]P. This prevents breaking of alignment when pasting
" in code from websites and etc.. 
noremap <leader>p :set paste<cr>"+]p:set nopaste<cr>
noremap <leader>P :set paste<cr>"+]P:set nopaste<cr>

" use +/- to increment/decrement numbers
nnoremap + <C-a>
nnoremap - <C-x>

" automatically jump to last misspelled word and attempt replacing it
noremap <C-l> [sz=

" use Ctrl+L in insert mode to correct last misspelled word
inoremap <C-l> <esc>[sz=

" Ctrl+Backspace deletes last word
inoremap <C-BS> <esc>bcw

" Ctrl+Del deletes next word
inoremap <C-Del> <esc>wcw

" repeated C-r pastes in the contents of the unnamed register
inoremap <C-r><C-r> <C-r>"

" reselect visual block after indent/outdent
xnoremap < <gv
xnoremap > >gv

" use regular regex syntax rather than vim regex
nnoremap / /\v
xnoremap / /\v

" Remap gm to skip to the actual middle of the line, not middle of screen
noremap gm :call cursor(0, virtcol('$')/2)<CR>

"============= Buffers ========================================================

" buffers can exist in background without being in a window
set hidden

" Automatically save before commands like :next and :make
set autowrite

" buffer browsing with left/right arrows
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" show buffer list using Unite on Up arrow
nnoremap <Up> :Unite buffer -no-split -buffer-name=Buffers<CR>

" show buffer list without Unite
"nnoremap <Up> :buffers<CR>:buffer<SPACE>

" jump to previous buffer
" nnoremap <Down> <C-^>

" jump to previous buffer with Tab
nnoremap <Tab> <C-^>

" Use Ctrl-Tab to toggle between splits
nnoremap <C-Tab> <C-W><C-W>

" Open Unite file browser in search mode with Down arrow
nnoremap <Down> :Unite file -no-split -start-insert -buffer-name=Files<CR>

" Recursive file search with shift-down
nnoremap <C-Down> :Unite file_rec -no-split -start-insert -buffer-name=FilesRec<CR>

" Split windows to the right
set splitright

"============= Editing Vimrc ==================================================

" open my vimrc in a split
" not using ~/.vimrc because it causes issues on windows
" editing a soft link created with MKLINK command un-links it and creates a
" copy which is independent. Not sure why but this is a workaround.
command! VIMRC :e $HOME/.vim/.vimrc

" now source it
command! SOURCE source $MYVIMRC

"============ Saving and Closing ==============================================

" for when you mess up and hold shift too long (using ! to prevent errors while 
" sourcing vimrc after it was updated)
command! W w
command! WQ wq
command! Wq wq
command! Q q

" changing file types:
command! DOS  set ff=dos  " force windows style line endings
command! UNIX set ff=unix " force unix style line endings
command! MAC  set ff=mac  " force mac style line endings


" Remove the ^M characters from files
command! RemoveEm :%s/
//g

" This will display the path of the current file in the status line
" It will also copy the path to the unnamed register so it can be pasted
" with p or C-r C-r
command! FILEPATH call g:getFilePath()

function! g:getFilePath()
    let @" = expand("%:p")
    echom "Current file:" expand("%:p")
endfunc

"============= Session Handling ===============================================

" where do you want to save sessions?
let g:session_dir = $HOME."/.vim/session"

" set session name using Ses command
command! -nargs=1 SessionName let g:sessionname=<f-args>
command! SessionSaveBuffersOnly :set sessionoptions=buffers

" Save sessions whenever vim closes
autocmd VimLeave * call SaveSession()

" Load session when vim is opened
autocmd VimEnter * nested call OpenSession()

" Saves the session to session dir. Creates session dir if it doesn't
" yet exist. Sessions are named after servername parameter or g:sessionname
function! SaveSession()

    " get the server (session) name
    if exists("g:sessionname")
        let s = g:sessionname
    else
        let s = v:servername
    endif

    " create session dir if needed
    if !isdirectory(g:session_dir)
        call mkdir(g:session_dir, "p")
    endif

    " save session using the server name
    execute "mksession! ".g:session_dir."/".s.".session.vim"
endfunc

" Open a saved session if there were no file-names passed as arguments
" The session opened is based on servername (session name). If there
" is no session for this server, none will be opened
function! OpenSession()

    " check if file names were passed as arguments
    if argc() == 0

        let sn = v:servername
        let file = g:session_dir."/".sn.".session.vim"

        " if session file exists, ask user if he wants to load it
        if filereadable(file)
            if(confirm("Load last session?\n\n".file, "&Yes\n&No", 1)==1)
                execute "source ".file
            endif
        endif

    endif
endfunc

"============ Snipmate ========================================================

"" Open or create a custom SnipMate snippet file for the current file type
"" I use this to quickly add snippets from currently edited files
"command! SNIP call g:editSnipmateFile()
"function! g:editSnipmateFile()
"    let p=$HOME."/.vim/bundle/snipmate-custom-snippets/snippets/".&ft.".snippets"
"    exec "edit ".p
"endfunc

"============= Spell Check ====================================================

set spell 		"enable in-line spell check
set spelllang=en

command! SPCLEAN :runtime spell/cleanadd.vim

"============= Line Numbers ===================================================

" Line numbers (set relative in 7.3 because it's useful); 
" Fall back to absolute if 7.2 and lower
if v:version >= 703
    set relativenumber 	" if version 7.3 set relative line numbers

    " toggle between relative and absolute line numbers
    " this will only be defined if vim supports it
    function! g:ToggleNuMode()
        if(&rnu == 1)
            set number
        else
            set relativenumber
        endif
    endfunc

    " map the above function to F5
    nnoremap <f5> :call g:ToggleNuMode()<cr>

else
    set number		" otherwise set absolute, because there is no rnu
endif

set nopaste	" pasting with auto-indent disabled (breaks bindings in cli vim)

"============= Scrolling & Position Tweaks ====================================

" hilight cursor line and cursor column markers
set cursorline
set cursorcolumn

if v:version >= 703
    " for some reason this does not work in 7.2
    " highlight column 80
    set colorcolumn=80
endif

set scrolloff=3	" 3 line offset when scrolling

" turn off the *FUCKING* cursor blink
set guicursor=a:blinkon0

"============= Formatting, Indentation & Behavior =============================

" enable soft word wrap
set formatoptions=l
set lbr

" Keep inserting comment leader character on subsequent lines
set formatoptions+=or

" use hard tabs for indentation
set tabstop=4
set softtabstop=4 	" makes backspace treat 4 spaces like a tab
set shiftwidth=4    " makes indents 4 spaces wide as well
set expandtab 		" actually, expand tabs into spaces
" set noexpandtab 	" don't expand tabs to spaces (cause fuck that)

set backspace=indent,eol,start

au FocusLost * silent! :wa	" save when switching focus 

"============= Search & Matching ==============================================

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching

set incsearch		" incremental search
set hlsearch		" highlights searches

set noerrorbells 	" suppress audible bell
set novisualbell 	" suppress bell blink

"============= History ========================================================

" save more in undo history
set history=1000000
set undolevels=1000000

if v:version >= 703
    set undofile        " keep a persistent backup file
    set undodir=$HOME/.vim/undo
endif


"=========== Syntax Highlighting & Indents ====================================
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set autoindent 		" always indent
set copyindent 		" copy previous indent on autoindenting
set smartindent

set backspace=indent,eol,start 	" backspace over everything in insert mode

" ============== Status Line ==================================================

set ls=2 			" Always show status line
set laststatus=2

"============== Folding =======================================================

set nofoldenable 	" screw folding

" Set up specific folding threshold 
"set foldmethod=indent
"set foldnestmax=3
"set foldenable

"============== Completion ====================================================

" Enable wild menu, but ignore nonsensical files
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*~
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**
set wildignore+=*/.nx/**,*.app

" longer more descriptive auto-complete prompts
set completeopt=longest,menuone
set ofu=syntaxcomplete#Complete

"============== Swap Files ====================================================

set noswapfile 		" suppress creation of swap files
set nobackup 		" suppress creation of backup files
set nowb 		" suppress creation of ~ files

"============== Filetypes =====================================================

" Individual settings for php, ruby, python and etc are in ftplugin/ foldr

" type detection for JSON files (makes snippets work)
au! BufRead,BufNewFile *.json set filetype=json 

" force txt files to be highlighted as html (useful when composing blog posts)
au BufRead,BufNewFile *.txt setfiletype html

" Fix HTML indenting quirk as per http://bit.ly/XnlHJz
autocmd FileType html setlocal indentkeys-=*<Return>

" Disable folding in Markdown files
let g:vim_markdown_folding_disabled=1

" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"============== Pathogen ======================================================
" Plugin manager:
" Lets you store your plugins in individual folders
" inside the .vim/bundle directory (also as git submodules).
" This line initializes it and loads all plugins:
call pathogen#infect()


"==============================================================================
"============== Plugin Specific Settings ======================================
"==============================================================================

" Must be specified after pathogen#infect call to take
" effect. These modify plugin behavior.

" Solarized color scheme setup:
if has('gui_running')
    " use the light (yellowish background) scheme in GUI
    set background=light
else
    " specific settings for terminal 
    set t_Co=256                        " force vim to use 256 colors
    let g:solarized_termcolors=256      " use solarized 256 fallback
    set background=light                " change this if you want dark scheme

endif

" enable solarized color scheme
colorscheme solarized

" change the color of the column 80
" this needs to be called after solarized
highlight ColorColumn guibg=lightyellow ctermbg=227

" Change color of the list characters and use
" special chars to indicate tabs and newlines
" These can be displayed using :set list!
"set showbreak=↪
highlight NonText guifg=orange
highlight SpecialKey guifg=orange

if &listchars ==# 'eol:$'
    set listchars=tab:>\	,trail:-,extends:>,precedes:<,nbsp:+
    if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
        let &listchars = "tab:\u21e5	,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
    endif
endif

" Change solarized theme toggle from F5 to F4 so it doesn't conflict with vim-latex
call togglebg#map("<F4>")


" bind NERDTree to F1 (we don't need help)
nnoremap <f1> :NERDTreeToggle<cr>

" vim-latex tweaks
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
