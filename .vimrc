" Matteo Rattotti vimrc file 
" Modified by Matteo Rattotti on: Wed May 28 15:19:43 2008

" Plugin I'm using: 
" - supertab
" - Nerd_commenter
" - snippetsEmu
" - SearchComplete
" - project
" - autocomplpop
" - python.vim

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Remove the nasty windows endline
map MM :%s/\r/\r/g

" Set Modification date by me
map \d :<C-u> call SetDateComment()<CR>

" Syntax and colorscheme  
syntax on
colorscheme whamoocolor 

" Set map leader
let mapleader = ","
let g:mapleader = ","

" remapping ` to '
nnoremap ' `
nnoremap ` '

" mapping - to search
nmap - /

" toggling search highlight with ,n
nmap <silent> <leader>n :silent :nohlsearch<CR>
" showing trailing white space
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

map <leader>f :FufFile <C-r>='**/'<CR><CR>
"map <leader>ff :FufFile <C-r>=expand(fnamemodify('.',':p:p')).'**/'<CR><CR>
map <leader>p :execute 'NERDTreeToggle ' . getcwd()<CR>

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

"Will allow you to use :w!! to write to a file using sudo 
cmap w!! %!sudo tee > /dev/null %

let g:fuf_file_exclude     = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)|\.pyo|\.pyc|autom4te\.cache|blib|_build|\.bzr|\.cdv|cover_db|CVS|_darcs|\~\.dep|\~\.dot|\.git|\.hg|\~\.nib|\.pc|\~\.plst|RCS|SCCS|_sgbak|\.svn'
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 300
let g:fuf_mrucmd_maxItem = 400

""" behaviour settings
set ch=2           " Make command line two lines high
set mousehide      " Hide the mouse when typing text

set showcmd        " Show partial command in status bar
set nocompatible   " allow breaking vanilla vi compatibility
set showmatch      " Highlight the matches of the last search
set backspace=2    " allow backspacing over everything in insert mode
set autoindent     " always set autoindenting on
set textwidth=0    " Don't wrap words by default
set cursorline     " I Want to see where i'm!!
set wildmenu       " Set enhanced comand menu' completion
set history=1000   " Vim now will remember 1000 commands
set autochdir      " automatically switch working path to the edited file
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize


" No blink cursor
set guicursor=a:blinkon0

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Set magic on
set magic

" Search setting
set hlsearch       " Highlith search result
set incsearch      " Enable incremental searching by default
set ignorecase     " Ignore case-sensitive

" vim tab (for multiple file)
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

"set foldcolumn=2   "Space for simbols
set foldmethod=indent " Make folding indent sensitive
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
"set foldopen-=search " don't open folds when you search into them
"set foldopen-=undo " don't open folds when you undo stuff


" Bells management
set noerrorbells   " 
set visualbell     " 
set vb t_vb=       " Set visualbell not orrible beep

" status bar setting
set laststatus=2   " Always show the status line 
set statusline=%1*%y\ %t%=\ %l-%c\ [%n]\ %p%\%


filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
filetype indent on

" Set the TAB behaviour (python programming)
set softtabstop=4
set shiftwidth=4
set ruler
set expandtab
set number " Set line number 

" Backup file and swapfiles
set dir=~/.vimSwap
set nobackup
"set backupdir=~/.vim/backup
"set directory=~/.vim/tmp
"

" % matching also on if, else, ifelse, etc..
runtime macros/matchit.vim

" Completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Django SnipMate completion
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd FileType htmldjango set ft=htmldjango.html " For SnipMate

" NERD_tree config
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2

" Nerd_commenter config
let NERDShutUp=1

" Setting omnicompletion behaviour
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./

" Delete until backward slash
cno $q <C-\>eDeleteTillSlash()<cr>

cno $c e <C-\>eCurrentFileDir("e")<cr>

cno $tc <C-\>eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

" Some automatic header on newfile (Python and bash)
" PYTHON
autocmd BufNewFile *.py call append(0, "#!/usr/bin/python")
autocmd BufNewFile *.py call append(2, "'''")
autocmd BufNewFile *.py call append(3, "Doc for this file")
autocmd BufNewFile *.py call append(4, "'''")
autocmd BufNewFile *.py call append(5, "__version__ = \"0.1\"")
autocmd BufNewFile *.py call append(6, "__author__ = \"Matteo Rattotti\"")
autocmd BufNewFile *.py call append(7, "__contact__ = \"http://www.shinyfrog.net\"")
autocmd BufNewFile *.py call append(8, "__date__ = '" . strftime("%c") ."'")
autocmd BufNewFile *.py call append(9, "__timestamp__ = '" . localtime() ."'")
autocmd BufNewFile *.py call append(10, "")
autocmd BufNewFile *.py call append(11, "")
autocmd BufNewFile *.py call append(12, "")
autocmd BufNewFile *.py call append(13, "if __name__ == '__main__':")
autocmd BufNewFile *.py call append(14, "    pass")

" BASH
autocmd BufNewFile *.sh call append(0, "#!/bin/bash")

" Obj-j
autocmd BufNewFile *.j  set filetype=objj
autocmd BufReadPre *.j  set filetype=objj


autocmd FileType javascript set makeprg=cat\ %\ \\\|\ /opt/local/bin/js\ /Users/whamoo/.vim/plugin/mylintrun.js\ %
"autocmd BufNewFile *.js set errorformat=%f:%l:%c:%m


" Markdown
au! BufRead,BufNewFile *.mkd   setfiletype mkd
au! BufRead,BufNewFile *.mk   setfiletype mkd


" (GUI) Live line reordering 
nnoremap <silent> <C-A-Up> :move .-2<CR>
nnoremap <silent> <C-A-Down> :move .+1<CR>
vnoremap <silent> <C-A-Up> :move '<-2<CR>gv
vnoremap <silent> <C-A-Down> :move '>+1<CR>gv
inoremap <silent> <C-A-Up> <C-o>:move .-2<CR>
inoremap <silent> <C-A-Down> <C-o>:move .+1<CR>

" (GUI) Configuration
if has('gui_running')
    if exists('&macatsui')
        set nomacatsui
    endif

    set lines=40
    set anti
    set gfn=Monaco:h12
    colorscheme whamoocolor  
    hi User1 guifg=#009999 guibg=#00487D 

    " Removing toolbar
    set guioptions-=T
endif

" My Function "

" MakeMain()
" quick command to make a main function
command Mkmain call MakeMain()
function MakeMain()
	call append(0, "#include <iostream>")
	call append(1, "using namespace std;")
	call append(2, "")
	call append(3, "int main()")
	call append(4, "{")
	call append(5, "return 0;")
	call append(6, "}")
endfunction

" Function for setting my sign and date
function! SetDateComment()
    let line = line(".")
    call setline(line, "Modified by Matteo Rattotti on: " . strftime("%c"))
endfunction

" Show all white Space
command WSpace call ShowWhiteSpace()
function ShowWhiteSpace()
    highlight spaceEOL ctermbg=red guibg=red
    match spaceEOL /^\s*\ \s*\|\s\+$/
endfunction

" Show all white space at EOL
command WSpaceEOL call ShowWhiteSpaceEOL()
function ShowWhiteSpaceEOL()
    highlight spaceEOL ctermbg=red guibg=red
    match spaceEOL /\s\+$/
endfunction


""Can be: linux, mac, windows
fun! MySys()
  return "mac"
endfun
" End Function

fun CssComment(commentString)
    echo a:commentString
    let startingString = a:commentString
    let startingString = "/***** " .startingString. " "
    let commentLenght = strlen(startingString)
    let completeString = ""
    while commentLenght < 80
        let completeString = completeString."*"
        let commentLenght = strlen(startingString) + strlen(completeString)
    endwhile
    let completeString = completeString."/"
    return completeString    
endfun


",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)
map ,v :sp .vimrc<CR><C-W>_
map <silent> ,V :source .vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap  ,i :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
     \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
     \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
     \ . ">"<CR>

" then :highlight show all the current colors


" Function that define what the guitablabel should display
function GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)

  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor

  " Append the buffer name
  return label " . filename(bufnrlist[tabpagewinnr(v:lnum) - 1])
endfunction

set guitablabel=%{GuiTabLabel()}%t
