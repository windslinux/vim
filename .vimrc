au BufRead,BufNewFile grepresult call GrepresultInit()

function! GrepresultInit()
    setlocal ft=grepresult
    if line('.') != 1
        let currentLine = line('.')
        let currentCol = col('.')
        call cursor(1,1)
        exe "syn keyword searchKEY" expand("<cword>")
        call cursor(currentLine,currentCol)
    else
        exe "syn keyword searchKEY" expand("<cword>")
    endif

endfunction

function! ISgrepresult()
    if expand("%:t") == "grepresult"
        return 1
    else
        return 0
    endif
endfunction

function! GrepResultEnter()
    let words = split(getline('.'), ':')
    if get(words, 1) !=  0
        exec "vi " words[0]
        exec words[1]
    endif
endfunction


nmap <expr> <CR>       ISgrepresult()?":call GrepResultEnter()<CR>":"<CR>"
"nmap <CR> :call PressEnter()<CR>
vmap <CR> y/<C-R>"<CR>
vmap <C-R> y:! <C-R>"<CR>

let g:load_doxygen_syntax=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set mapleader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode.
set nocompatible

" Enable filetype plugin
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","



" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :qa<cr>

" Fast loading .vimrc file
nmap <leader>l :vi ~/.vimrc<cr>

" Fast loading .vimrc file
nmap <leader>s :source ~/.vimrc<cr>

"""

" 设置语言
set encoding=utf-8
set termencoding=utf-8
"set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler                           "Always show current position

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

"多buffer切换不需要保存
set hidden

set dy=lastline,uhex 				"display(dy)

set backspace=indent,eol,start
set nu                              "number(nu), nonumber(nonu)行号
set laststatus=2
set statusline=%<%f%h%m%r%=%{strftime(\"%I:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ \ \ %b\ 0x%B\ \ \ \ \ %l,%c%V\ \ \ \ %P
"set statusline=2

if &term != "xterm"
    " SecureCRT versions prior to 6.1.x do not support 4-digit DECSET
    "     let &t_ti = "\<Esc>[?1049h"
    "     let &t_te = "\<Esc>[?1049l"
    " Use 2-digit DECSET instead
    let &t_ti = "\<Esc>[?47h"
    let &t_te = "\<Esc>[?47l"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"设置缩进
set ai                              "autoindent(ai)
set cindent                         "C语言缩进
set shiftwidth=4                    "设置缩进长度
set tabstop=4                       "设置tab长度
set expandtab                       "设置空格替代tab
set smarttab                        "行首tab的四个空格可以整个删除

"M$ / Linux
set clipboard+=unnamed

"GUI
if has("gui_running")
    au GUIEnter * simalt ~x
    set go=                         "无菜单,无任务栏
endif

"nmap t i<tab><esc>l

nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

nmap <leader>tn :tabnew<CR>
nmap <leader>d :bd<CR>
nmap <C-p> :bp<CR>
nmap <C-n> :bn<CR>

"配色方案
colo desert                         "ColorScheme(colo)
"colo ChocolateLiquor
"colo evening
"colo darkZ

"语法高亮
syntax enable
syntax on

"Search
set magic                           " Set magic on, for regular expressions
set hlsearch                        " 高亮搜索结果
"set incsearch                       " 增量搜索

"Automatically remove trailing spaces when saving a file.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap ( ()<ESC>ha
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap { {<CR>}<ESC>k$a<CR>
"inoremap } <c-r>=ClosePair('}')<CR>
"inoremap [ []<ESC>i
"inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap < <><ESC>i
"inoremap > <c-r>=ClosePair('>')<CR>

"function! ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endf

"Split
nmap <silent> <leader>sp :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <silent> [ :vertical res -1<CR>
nmap <silent> ] :vertical res +1<CR>
nmap <silent> _ :res -1<CR>
nmap <silent> + :res +1<CR>
nmap <leader>hm <C-w>_
nmap <leader>vm <C-w>\|
nmap <leader>eq <C-w>=


" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

"Buffer
"nmap <right> :bn<cr>
"nmap <left> :bp<cr>

"Emacs-mode mapping
"map <expr> <C-e> pumvisible()?"\<C-E>":"\<End>"
"map! <expr> <C-e> pumvisible()?"\<C-E>":"\<End>"
"<C-e> <End>
"map <C-a> <Home>
"map! <C-a> <Home>
cmap <C-b> <Left>
cmap <C-f> <Right>
imap <C-u> <esc>d^xi
imap <C-k> <esc>ld$a
"imap <C-p> <Up>
"imap <C-n> <Down>
"imap <C-b> <Left>
"imap <C-f> <Right>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Switch wrap mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:wrapmode=1
nmap <silent> <F3> :call ToggleWrapMode()<CR>
function! ToggleWrapMode()
    if g:wrapmode == 0
        set wrap
        let g:wrapmode=1
    else
        set nowrap
        let g:wrapmode=0
    endif
endfunction

"nmap <leader>sc yaw:ConqueTermSplit bash<CR>sc<esc>p $PWD<CR>
nmap <leader>sc :!echo <C-R>=expand("<cword>")<CR> > /tmp/grepresult;sc <C-R>=expand("<cword>")<CR> $PWD >> /tmp/grepresult<CR><CR>:split<CR><C-J>:vi /tmp/grepresult<CR>:syn keyword searchKEY <C-R>=expand("<cword>")<CR><CR>

"command -nargs=0 REF :!sh refresh.sh<CR>

"------------For Plugins
"FuzzyFinder
map <leader>tf :FufTaggedFile<CR>
map <leader>file :FufFile<CR>

"BufExplorer
map <F6> :BufExplorer<cr>


"cscope
nmap <C-g> :cs f g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :scs f g <C-R>=expand("<cword>")<CR><CR>
nmap <C-y> :cs f c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>i :cs f f <C-R>=expand("<cfile>")<CR><CR>

"taglist
let Tlist_Show_One_File = 1             "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1           "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1          "在右侧窗口中显示taglist窗口
"map <silent> <F9> :TlistToggle<cr>

"NERDTree
map <silent> <F4> :NERDTreeToggle<cr>
let g:NERDTreeHighlightCursorline = 0

let g:winManagerWindowLayout = "TagList|FileExplorer"
let g:winManagerWidth = 30

nmap <silent> <F5> :WMToggle<cr>

"Doxygen
nmap <F2>s i/**<  */<ESC>hhi
imap <F2>s /**<  */<ESC>hhi
nmap <F2>3 i///
imap <F2>3 ///

"srcexpl
map <F8> :SrcExplToggle<CR><CR>

"智能补全
set completeopt=longest,menu
inoremap <expr> <CR>       pumvisible()?"<C-Y>":"<CR>"
inoremap <expr> <C-J>      pumvisible()?"<PageDown><C-N><C-P>":"<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"<PageUp><C-P><C-N>":"<C-K>"
inoremap <expr> <C-U>      pumvisible()?"<C-E>":"<C-U>"


"vimgdb
set previewheight=12		" set gdb window initial height

"MRU
nmap <leader>u :MRU<CR>

"cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    if filereadable("/opt/OCTEON-SDK-1.8.1/executive/cscope.out")
        cs add /opt/OCTEON-SDK-1.8.1/executive/cscope.out
    endif
    set csverb
endif

