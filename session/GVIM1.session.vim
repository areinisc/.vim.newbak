let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <F4> <Plug>ToggleBackground
imap <F5> <Plug>ToggleBackground
inoremap <C-Del> wcw
inoremap <C-BS> bcw
inoremap <F10> =strftime("%a %b %d, %Y")
nnoremap 	 
noremap  [sz=
noremap  P :set paste"+]P:set nopaste
noremap  p :set paste"+]p:set nopaste
noremap  Y "+Y
noremap  y "+y
nnoremap <silent>  O O
nnoremap <silent>  o o
nnoremap <silent>   i
nmap <silent>    :nohlsearch
nnoremap   <Nop>
nnoremap + 
nnoremap - 
xnoremap / /\v
nnoremap / /\v
nnoremap ; :
xnoremap < <gv
xnoremap > >gv
nmap gx <Plug>NetrwBrowseX
noremap gm :call cursor(0, virtcol('$')/2)
xnoremap j gj
nnoremap j gj
xnoremap k gk
nnoremap k gk
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <F1> :NERDTreeToggle
vmap <F4> <Plug>ToggleBackground
nmap <F4> <Plug>ToggleBackground
vmap <F5> <Plug>ToggleBackground
nnoremap <F5> :call g:ToggleNuMode()
nnoremap <C-Down> :Unite file_rec -no-split -start-insert -buffer-name=FilesRec
nnoremap <Down> :Unite file -no-split -start-insert -buffer-name=Files
nnoremap <C-Tab> 
nnoremap <Up> :Unite buffer -no-split -buffer-name=Buffers
nnoremap <Right> :bnext
nnoremap <Left> :bprev
nnoremap <F3> :set invpaste paste?
nnoremap <F6> :!ctags -R
nnoremap <F10> "=strftime("%a %b %d, %Y")P
inoremap  [sz=
inoremap  "
inoremap jj 
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autowrite
set backspace=indent,eol,start
set completeopt=longest,menuone
set copyindent
set cryptmethod=blowfish
set expandtab
set fileencodings=ucs-bom,utf-8,latin1
set formatoptions=lor
set guicursor=a:blinkon0
set guifont=Inconsolata\ Medium\ 10
set guioptions=aegirLt
set helplang=en
set hidden
set history=1000000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:⇥\	,trail:␣,extends:⇉,precedes:⇇,nbsp:·
set mouse=a
set omnifunc=syntaxcomplete#Complete
set pastetoggle=<F3>
set ruler
set runtimepath=~/.vim,~/.vim/bundle/vim-colors-solarized,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,~/.vim/after
set scrolloff=3
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smartindent
set softtabstop=4
set splitright
set noswapfile
set tabstop=4
set termencoding=utf-8
set undodir=~/.vim/undo
set undofile
set undolevels=1000000
set visualbell
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*~,*DS_Store*,*.gem,log/**,tmp/**,*.png,*.jpg,*.gif,*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.nx/**,*.app
set wildmenu
set wildmode=list:longest
set window=44
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +235 ~/.vim/.vimrc
badd +13 ~/Desktop/To\ Do\ List.md
silent! argdel *
edit ~/.vim/.vimrc
set splitbelow splitright
set nosplitbelow
wincmd t
set winheight=1 winwidth=1
argglobal
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal copyindent
setlocal cryptmethod=
setlocal nocursorbind
set cursorcolumn
setlocal cursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=syntaxcomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=4
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=78
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 229 - ((16 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
229
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
