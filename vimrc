set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'VimClojure'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wincent/command-t'
Plugin 'L9'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'cmdalias.vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'nacitar/terminalkeys.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'paredit.vim'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"



" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.1

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 1
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set number
set shiftwidth=2
set tabstop=2
set expandtab

set background=dark
colorscheme distinguished
" show number column
set number
set numberwidth=3
" max items in popup menu
set pumheight=8
"
" " current mode in status line
set showmode

" display the number of (characters|lines) in visual mode, also cur command
set showcmd




set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P
set showcmd
set wildmenu

set shortmess=atTI
" show fold column, fold by markers
set foldcolumn=2
set foldmethod=marker

" indicate when a line is wrapped by prefixing wrapped line with '> '
set showbreak=>\ 
" always show tab line
set showtabline=2

" highlight search matches
set hlsearch

" highlight position of cursor
set cursorline
"set cursorcolumn

" fast terminal for smoother redrawing
set ttyfast


set omnifunc=syntaxcomplete#Complete

" indentation options
" Note: smartindent is seriously outdated. cindent, even, is unnecessary.
" Let the filetype plugins do the work.
set shiftwidth=2
set tabstop=2
filetype indent on
"set autoindent
set cindent

" show matching enclosing chars for .1 sec
set showmatch
set matchtime=1

" t: autowrap text using textwidth
" l: long lines are not broken in insert mode
" c: autowrap comments using textwidth, inserting leader
" r: insert comment leader after <CR>
" o: insert comment leader after o or O
set formatoptions-=t
set formatoptions+=lcro
set textwidth=80

" context while scrolling
set scrolloff=3
" arrow keys, bs, space wrap to next/prev line
set whichwrap=b,s,<,>,[,]

" backspace over anything
set backspace=indent,eol,start

" case insensitive search if all lowercase
set ignorecase smartcase

" turn off bells, change to screen flash
set visualbell

" show our whitespace
set listchars=tab:\|\ ,trail:.
"set list

" complete to longest match, then list possibilities
set wildmode=longest,list

" turn off swap files
set noswapfile

" options for diff mode
set diffopt=filler
set diffopt+=context:4
set diffopt+=iwhite
set diffopt+=vertical

" keep a lot of history
set history=100

" keep lots of stuff
set viminfo+=:100
set viminfo+=/100

" don't duplicate an existing open buffer
set switchbuf=useopen

" }}}
" {{{ colors
highlight SpecialKey cterm=bold ctermfg=0
" tabe line colors
highlight TabLineFill ctermfg=DarkGray
highlight TabLine ctermfg=4 ctermbg=DarkGray cterm=bold
highlight TabLineSel ctermfg=7 cterm=none ctermbg=DarkGray

" number column colors
highlight LineNr cterm=none ctermbg=none ctermfg=4

" fold colors
highlight Folded cterm=none ctermbg=none ctermfg=4
highlight FoldColumn cterm=none ctermbg=none ctermfg=4

" visual mode colors
highlight Visual ctermbg=7 ctermfg=4

" dictionary menu colors
highlight Pmenu ctermbg=7 ctermfg=0
highlight PmenuSel ctermbg=Yellow ctermfg=0

" diff colors
highlight DiffAdd cterm=none ctermbg=4
highlight DiffDelete cterm=none ctermbg=4
highlight DiffChange cterm=none ctermbg=4
highlight DiffText cterm=none ctermbg=4


" keep cursor column last so it overrides all others
highlight CursorColumn cterm=none ctermbg=Black
highlight CursorLine cterm=none ctermbg=Black

highlight Search cterm=none ctermbg=7 ctermfg=4

" make sure bold is disabled or your terminal will look like the vegas strip
set background=dark
" }}}
" {{{ filetype dependent
autocmd BufNewFile,BufRead *.html setlocal commentstring=<!--%s-->
" ruby commenstring
autocmd FileType ruby setlocal commentstring=#%s
" make help navigation easier
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
"}}}

" mappings
" {{{ general
let mapleader = "\\"
" easier move screen up/down
nmap <C-j> <C-e>
nmap <C-k> <C-y>
nmap <space> za
" turns off highlighting
nmap <Leader>/ :nohl<CR>
" search for highlighted text
vmap // y/<C-R>"<CR>
" keep block highlighted when indenting
vmap >> >gv
vmap << <gv
" fix a block of XML; inserts newlines, indents properly, folds by indent
nmap <Leader>fx :setlocal filetype=xml<CR>:%s/></>\r</g<CR>:1,$!xmllint --format -<CR>:setlocal foldmethod=indent<CR>
" comment/uncomment highlighted block
vmap <Leader>cc :s!^!//!<CR>
vmap <Leader>cu :s!^//!!<CR>
" open local projects list file
nmap <Leader>l :70vsplit ~/Dropbox/projects.list<CR>
" fix syntax highlighting
nmap <Leader>ss :syntax sync fromstart<CR>
" toggle the tag list
nmap <Leader>tl :TlistToggle<CR>
" toggle gundo
nmap <Leader>gu :GundoToggle<CR>
" make arrow keys useful
" use them to swap between split windows
"nmap <left> <C-W>h
"nmap <right> <C-W>l
"nmap <up> <C-W>k
"nmap <down> <C-W>j
com -range XselCopy :<line1>,<line2>w !xsel -i -b
com XselPaste :r !xsel -o -b
vmap <silent> <Leader>xc :XselCopy<CR>
nmap <silent> <Leader>xp :XselPaste<CR>

"}}}
"f keys {{{
nmap <F2> :call ToggleColumns()<CR>
imap <F2> <C-o>:call ToggleColumns()<CR>
nmap <F3> :Nload<CR>
nmap <F4> :NERDTree<CR>
set pastetoggle=<F5>
" <F6>
nmap <F7> :!updatedev.php %:p<CR>
nmap <F8> :call WriteTrace()<CR>
nmap <F9> \ph
" <F10>
" <F11> don't use; terminal full-screen
" <F12>
" }}}
"{{{ list file
let g:listFile_ranks = ['=','1','2','3','4','5','!','o','-','?','x']
autocmd BufNewFile,BufRead *.list call MyListFileStuff()
fun! MyListFileStuff()
	nmap <buffer> ,! :Lmark !<CR>
	vmap <buffer> ,! :Lmark !<CR>
	nmap <buffer> ,tq :Ltag quick<CR>
	vmap <buffer> ,tq :Ltag quick<CR>
	nmap <buffer> ,sq :Lsearch tag quick<CR>
	nmap <buffer> ,d ,x,t,r
endfunction
"}}}

" minor helpful stuff
fun! ToggleColumns() "{{{
	"make it easy to remove line number column etc. for cross-terminal copy/paste
  if &number
    set nonumber
    set foldcolumn=0
    let s:showbreaktmp = &showbreak
    set showbreak=
  else
    set number
    set foldcolumn=2
    let &showbreak = s:showbreaktmp
  end
endfunction
"}}}
fun! WriteTrace() "{{{
	let lineNum = line('.')
	let lineFile = bufname('%')
	let lineVal = getline(lineNum)

	let allLines = readfile($HOME."/trace.txt")
	let allLines = add(allLines,lineFile.":".lineNum)
	let allLines = add(allLines,lineVal)
	let allLines = add(allLines,"")

	call writefile(allLines,$HOME."/trace.txt")
endfunction
"}}}
"{{{ctags stuff
nmap <Leader>tf :call CtagsFind(expand('<cword>'))<CR>
com! -nargs=+ Tf :call CtagsFind("<args>")
" split window and search for tag
nmap <Leader>ts :exe('stj '.expand('<cword>'))<CR>

" open new tab and search for tag
fun! CtagsFind(keyword)
	tabe
	exe "tj ".a:keyword
endfunction
"}}}

" stand-alone components
"{{{ TAB-COMPLETE and SNIPPETS
" add new snippets as regex=>completion
" first match encountered is used
let s:snippets = {}
let s:snippets['^\s*if$'] = " () {\<CR>}\<ESC>k^f)i" 
let s:snippets['function$'] = " () {\<CR>}\<ESC>k^f(i" 
let s:snippets['^\s*class$'] = "  {\<CR>}\<ESC>kt{i"
let s:snippets['^\s*interface$'] = "  {\<CR>}\<ESC>kt{i"
let s:snippets['^\s*foreach$'] = " () {\<CR>}\<ESC>k^f)i" 
let s:snippets['^\s*while$'] = " () {\<CR>}\<ESC>k^f)i" 

" when tab is pressed:
" 1) checks snippets for matches, return match if there is one
" 2) if character behind cursor is whitespace, just return a tab
" 3) if word behind cursor contains a slash, try filename complete
" 4) otherwise, try to ctrl-p complete
fun! CleverTab()
	if pumvisible()
		return "\<C-N>"
	endif
	if col('.') > 1
		let beginning = strpart( getline('.'), 0, col('.')-1 )
		let words = split(l:beginning,' ')
		let thisWord = l:words[-1]

		for key in keys(s:snippets)
			if l:beginning =~ key
				return s:snippets[key]
			endif
		endfor
	else
		let beginning = ''
	endif

	if l:beginning == '' || l:beginning =~ '\s$'
		return "\<Tab>"
	elseif (l:thisWord =~ '/')
		return "\<C-X>\<C-F>"
	else
		return "\<C-X>\<C-O>"
		"return "\<C-P>"
	endif
endfunction
" imap <Tab> <C-R>=CleverTab()<CR>
"}}}
"CODE GREP {{{
" grep for given string (second is case insensitive)
" simply a wrapper for vimgrep
" eg: :F /badxmlexception/ lib php
com! -nargs=+ F :call CommandFind("<args>")
fun! CommandFind(args)
	tabe
	let parts = split(a:args,' ')
	exe "vimgrep ".l:parts[0]." ".l:parts[1]."/**/*.".l:parts[2]
	exe "copen"
endfunction
"}}}
"{{{ TAB MGMT
" Some useful bits for managing tabs.
" Also changes format of tab line.
" Commands and shortcuts:
" \oc - open dir of current file in new tab
" H - navigate to tab to the left
" L - navigate to tab to the right
" C-l - move current tab left
" C-h - move current tab right
" gf - changes default behavior from opening file under cursor in current window to opening in new tab
nmap <Leader>oc :tabe %:h<CR>

" quicker aliases for navigating tabs
nmap H gT
nmap L gt
" move tab left or right
nmap <C-l> :call MoveTab(0)<CR>
nmap <C-h> :call MoveTab(-2)<CR>

" gf should use new tab, not current buffer
map gf :tabe <cfile><CR>

"tab line
fun! MyTabLine()
	let s = ''
	for i in range(tabpagenr('$'))
		" select the highlighting
		if i + 1 == tabpagenr()
			let s .= '%#TabLineSel#'
		else
			let s .= '%#TabLine#'
		endif
		" set the tab page number (for mouse clicks)
		let s .= '%' . (i + 1) . 'T'.(i+1).''
		" the filename is made by MyTabLabel()
		let s .= '%{MyTabLabel(' . (i + 1) . ')}  '
	endfor
	" after the last tab fill with TabLineFill and reset tab page nr
	let s .= '%#TabLineFill#%T'
	return s
endfunction

fun! MyTabLabel(n)
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let fullname = bufname(buflist[winnr - 1])
	" show a/b/c/filename.ext
	"let fullname = substitute(fullname,"(\w){1}\w*/","\1/","g")
	" show filename.ext
	let fullname = substitute(fullname,".*/","","")
	if getbufvar(buflist[winnr - 1],"&mod")
		let modified = "+"
	else
		let modified = " "
	endif
	return modified.fullname
endfunction

" Use the above tabe naming scheme
set tabline=%!MyTabLine()

"tab moving
fun! MoveTab(n)
	let which = tabpagenr()
	let which = which + a:n
	exe "tabm ".which
endfunction
"}}}


if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set autoread
set fileformats+=mac

if &history < 10000
  set history=10000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
" if &t_Co == 8 && $TERM !~# '^linux'
"   set t_Co=16
" endif
set t_Co=256

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

let mapleader = ","
let g:mapleader = ","

set vb
set t_vb=
set clipboard=unnamed

fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
    \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

call SetupCommandAlias('WQ', 'wq')
call SetupCommandAlias('wQ', 'wq')
call SetupCommandAlias('Wq', 'wq')
call SetupCommandAlias('W', 'w')
call SetupCommandAlias('Q', 'q')



if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

