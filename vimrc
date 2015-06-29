" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"set t_Co=256

set encoding=utf-8

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
"

set history=100		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ch=2
set hidden
set cpoptions=cesB$


" set visual bell
"set vb

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
set ttyfast
set ttymouse=xterm2
set mouse=a
"if has('mouse')
"    set mouse=a
"    set mousehide
"    set mousemodel=popup
"    map <MiddleMouse> <Esc>"*p
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
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
  set copyindent        " copy the previos indentation and autoindentating

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent cindent
set hlsearch incsearch ignorecase smartcase

":h g:incsearch#auto_nohlsearch
"let g:incsearch#auto_nohlsearch = 1
"let g:incsearch#magic = '\v'
"
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
"map n  <Plug>(incsearch-nohl-n)
"map N  <Plug>(incsearch-nohl-N)
"map *  <Plug>(incsearch-nohl-*)
"map #  <Plug>(incsearch-nohl-#)
"map g* <Plug>(incsearch-nohl-g*)
"map g# <Plug>(incsearch-nohl-g#)



set undodir=~/.vim/undodir
set undofile


syntax   on               " syntax highlighting on
filetype on               " detect the type of file
filetype plugin indent on " load filetype plugins

"====================================================================
" setting theme & colors
"====================================================================
if has("gui_running")
  winpos 20 20
  set columns=140
  set lines=50
  "set background=dark
  colorscheme desert
  "set showtabline=2    " show tabline always
  set guioptions=agimrbLtT
  set mouse=a             " use mouse everywhere
else
  set background=light
  "colorscheme solarized 
  colorscheme  murphy 
endif


set guioptions-=T
set guioptions-=r

set noerrorbells
set wrap

let mapleader=','
let g:mapleader=','
set showcmd
set autochdir
set nu
set debug=msg "debug type

"short key to escape
inoremap jk <esc>
inoremap jj <esc>

"spaces are better than a tab character
set tabstop=4
set softtabstop=4 
set shiftwidth=4 
set expandtab 
set autoindent 
set cindent
set hlsearch incsearch ignorecase smartcase 

set backup
set backupdir=~/.myvim/backup
set directory=~/.myvim/tmp
set guifont=Monospace\ 9 

set laststatus=2 "always show the status line
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

nnoremap tj  :tabfirst<CR>
nnoremap tl  :tabnext<CR>
nnoremap th  :tabprev<CR>
nnoremap tj  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>


vmap <leader>; :s/^/;;/<CR>:nohlsearch<CR>
vmap <leader>: :s/^;;//<CR>:nohlsearch<CR>

vmap <leader>h :s/^/#/<CR>:nohlsearch<CR>
vmap <leader>H :s/^#//<CR>:nohlsearch<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
nnoremap <leader>. :CtrlPTag<cr>

"noremap <F2><ESC>:!echo%:p<CR>

"-------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces
"-------------------------------------------------------------------------------
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>

"vnoremap ( s()<Esc>P
"vnoremap [ s[]<Esc>P
"vnoremap { s{}<Esc>P
"
"-------------------------------------------------------------------------------
" autocomplete quotes
"-------------------------------------------------------------------------------
"vnoremap  '  s''<Esc>P<Right>
"vnoremap  "  s""<Esc>P<Right>
"vnoremap  `  s``<Esc>P<Right>

"inoremap  '  '<Esc>:call QuoteInsertionWrapper("'")<CR>a
"inoremap  "  "<Esc>:call QuoteInsertionWrapper('"')<CR>a
"inoremap  `  `<Esc>:call QuoteInsertionWrapper('`')<CR>a
"
"-------------------------------------------------------------------------------
" Add a second quote only if the left and the right character are not keyword
" characters.
"-------------------------------------------------------------------------------
function! QuoteInsertionWrapper (quote)
  let col = col('.')
  if getline('.')[col-2] !~ '\k' && getline('.')[col] !~ '\k'
    normal ax
    exe "normal r".a:quote."h"
  end
endfunction    " ----------  end of function QuoteInsertionWrapper  ----------

"map <F4>:set paste<CR>
"map <F5>:set nopaste<CR>
map <F6> :w<CR>:!perl -c %<CR>
"imap<F4><C-o>:set paste<CR>

function! Fp()
    echom expand('%:p')
endfunction

"select word
map <space> viw
"imap <C-d><Esc> ddi
map <leader>f : call Fp() <CR>
:nnoremap <leader>sv :source $MYVIMRC<cr>
map <leader>q :q<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

"disable esc
"inoremap <esc> <nop>
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
        
        
"set list listchars=extends:>,precedes:<,tab:>>,trail:~,eol:
set viminfo=\"200,%,'200,/200,:200,@100,f1,h


function CommentBlock(comment, ...)
    "If 1 or more optional args, first optional arg is introducer...
    let introducer =  a:0 >= 1  ?  a:1  :  "//"

    "If 2 or more optional args, second optional arg is boxing character...
    let box_char   =  a:0 >= 2  ?  a:2  :  "*"

    "If 3 or more optional args, third optional arg is comment width...
    let width      =  a:0 >= 3  ?  a:3  :   strlen(a:comment) + 2

    " Build the comment box and put the comment inside it...
    return introducer . repeat(box_char,width) . "\<CR>"
    \    . introducer . " " . a:comment        . "\<CR>"
    \    . introducer . repeat(box_char,width) . "\<CR>"
endfunction

"C++/Java/PHP comment...
imap <silent>  ,//  <C-R>=CommentBlock(input("Enter comment: "))<CR>

"Ada/Applescript/Eiffel comment...
imap <silent>  ,--  <C-R>=CommentBlock(input("Enter comment: "),'--')<CR>

"Perl/Python/Shell comment...
imap <silent>  ,##  <C-R>=CommentBlock(input("Enter comment: "),'#','--')<CR>

"Skill comment
imap <silent>  ,;;  <C-R>=CommentBlock(input("Enter comment: "),';;','-')<CR>


function AlignAssignments ()
    "Patterns needed to locate assignment operators...
    let ASSIGN_OP   = '[-+*/%|&]\?=\@<!=[=~]\@!\:'
    let ASSIGN_LINE = '^\(.\{-}\)\s*\(' . ASSIGN_OP . '\)'

    "Locate block of code to be considered (same indentation, no blanks)
    let indent_pat = '^' . matchstr(getline('.'), '^\s*') . '\S'
    let firstline  = search('^\%('. indent_pat . '\)\@!','bnW') + 1
    let lastline   = search('^\%('. indent_pat . '\)\@!', 'nW') - 1
    if lastline < 0
        let lastline = line('$')
    endif

    "Find the column at which the operators should be aligned...
    let max_align_col = 0
    let max_op_width  = 0
    for linetext in getline(firstline, lastline)
        "Does this line have an assignment in it?
        let left_width = match(linetext, '\s*' . ASSIGN_OP)

        "If so, track the maximal assignment column and operator width...
        if left_width >= 0
            let max_align_col = max([max_align_col, left_width])

            let op_width      = strlen(matchstr(linetext, ASSIGN_OP))
            let max_op_width  = max([max_op_width, op_width+1])
         endif
    endfor

    "Code needed to reformat lines so as to align operators...
    let FORMATTER = '\=printf("%-*s%*s", max_align_col, submatch(1),
    \                                    max_op_width,  submatch(2))'

    " Reformat lines with operators aligned in the appropriate column...
    for linenum in range(firstline, lastline)
        let oldline = getline(linenum)
        let newline = substitute(oldline, ASSIGN_LINE, FORMATTER, "")
        call setline(linenum, newline)
    endfor
endfunction

nmap <silent>  ,=  :call AlignAssignments()<CR>
vmap <silent>  ,=  :call AlignAssignments()<CR>

"put "" at word 
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
map <space> viw

"map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
map <c-w><c-t> :WMToggle<cr>


"for tagbar ctags bin
let g:tagbar_ctags_bin = '~chiangkl/bin/ctags'
let Tlist_Ctags_Cmd = '~chiangkl/bin/ctags'
set tags=/tags,tags,.tags

set hls
let g:HLSpace = 1
let g:HLColorScheme = g:colors_name
function ToggleSpaceUnderscoring()
    if g:HLSpace
        highlight Search cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
        let @/ = " "
    else
        highlight clear
        silent colorscheme "".g:HLColorScheme
        let @/ = ""
    endif
    let g:HLSpace = !g:HLSpace
endfunction


nmap <silent> <F9> <ESC>:call ToggleSpaceUnderscoring()<CR>

"use paste from clipboard with ctrl v
set pastetoggle=<F4>
inoremap <C-v> <F4><C-r>+<F4>

"yanking visual selection into clipboard with Ctr c
vnoremap <C-c> "+y

set noerrorbells
set title
set history=1000
set undolevels=1000
set lazyredraw
        

nmap <silent> ,/ :nohlsearch<CR>

autocmd FileType skill set commentstring=;;\ %s

"ack
nnoremap <leader>a :Ack!<space>
"let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'
"
"nnoremap <silent> <F11>:YRShow<CR>

let g:tagbar_type_calibre = {
    \ 'ctagstype' : 'calibre',
    \ 'kinds'     : [
        \ 'r:rule' ,
        \ 'g:gds_layer' ,
        \ 'd:derive_layer' ,
        \ 'e:env' ,
    \ ],
\}


au BufNewFile,BufRead *.cal		setf calibre 

set rtp+=/Desktop/powerline/powerline-develop/build/lib/powerline/bindings/vim
"Tagbar Toggle
let g:tagbar_userarrows = 1
nnoremap <leader>l :TagbarToggle<CR>

"hide mouse pointer while typing

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim

set ttyfast

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0 

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"quickly copy and paste to system clipboard using <leader>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>yy "+yy
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"better line wrap  <CTRL-V>u21aa
set showbreak=



if exists('$TMUX')
function! TmuxOrSplitSwitch(wincmd, tmuxdir)
let previous_winnr = winnr()
execute "wincmd " . a:wincmd
if previous_winnr == winnr()
        " The sleep and & gives time to get back to vim so tmux's focus tracking
        " can kick in and send us our ^[[O
        execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
        redraw!
    endif
endfunction
    let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
    let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
    let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
    nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
    nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
    nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
    nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
endif

"make vaa select the entire file 
vmap aa VGo1G

"====[ Show when lines extend past column 80 "]================================>-<=====================
highlight ColorColumn ctermbg=magenta

function! MarkMargin (on)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%81v', 100)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd BufEnter * :call MarkMargin(1)
    autocmd BufEnter *.vp* :call MarkMargin(0)
augroup END
