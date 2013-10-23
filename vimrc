"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Matteo Rattotti vimrc file                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  All plugin are installed with pathogen                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            GENERAL SETTINGS                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible   " allow breaking vanilla vi compatibility

set ch=2           " Make command line two lines high
set mousehide      " Hide the mouse when typing text

set showcmd        " show typed command in status bar
set showmode       " show mode in status bar (insert/replace/...)
set showmatch      " show matching bracket (briefly jump)
set number         " Set line number
set backspace=2    " allow backspacing over everything in insert mode
set autoindent     " always set autoindenting on
set textwidth=0    " Don't wrap words by default
set wildmenu       " Set enhanced comand menu' completion
set history=1000   " Vim now will remember 1000 commands
set autochdir      " automatically switch working path to the edited file
set scrolloff=2    " Always show at least 2 rows belowe/about the cursor
set magic          " Magic on
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize

" Cursor
set guicursor=a:blinkon0 " no blink cursor
set cursorline           " highlights the current line

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" None of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" Search setting
set hlsearch       " Highlith search result
set incsearch      " Enable incremental searching by default
set ignorecase     " Ignore case-sensitive
set smartcase      " but become case sensitive if you type uppercase characters

" Fold settings
set foldmethod=indent " Make folding indent sensitive
set nofoldenable      " Don't autofold anything (but I can still fold manually)

" Split settings
set splitbelow     " Split windows at bottom
set splitright     " Split the window on the right

" Bells management
set noerrorbells   "
set visualbell     "
set vb t_vb=       " remove the orrible error beep

" status line setting
set laststatus=2   " Always show the status line
set ruler          " show cursor position in status bar
set statusline=\ \%y\ %t%=\ %l-%c\ [%n]\ %p%\%\ \ 

" Set the TAB behaviour (python programming)
set softtabstop=4
set shiftwidth=4
set expandtab

" Backup file and swapfiles
set noswapfile
set nobackup
set nowritebackup

" Setting omnicompletion behaviour
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone

" Enable detection, plugins and indenting in one step
filetype plugin indent on

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            COLOR THEME AND GUI                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax and colorscheme
syntax on
colorscheme solarized
set background=dark
set t_Co=256

let g:solarized_termtrans=1

if exists('g:colors_name') && g:colors_name == 'solarized'
    " Highlighted text is unreadable in Terminal.app because it
    " does not support setting of the cursor foreground color.
    if !has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
        if &background == 'dark'
            hi Visual term=reverse cterm=reverse ctermfg=10 ctermbg=7
        endif
    endif
endif

" (GUI) Configuration
if has('gui_running')
    if exists('&macatsui')
        set nomacatsui
    endif

    set lines=40
    set anti
    set gfn=Monaco:h13

    " Removing toolbar
    set guioptions-=T

    " Removing right scrollbar
    set guioptions-=r
    set guioptions-=R

    " Removing left scrollbar
    set guioptions-=l
    set guioptions-=L
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            CUSTOM MAPPINGS                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set map leader
let mapleader = ","
let g:mapleader = ","

" remapping ` to '
nnoremap ' `
nnoremap ` '

" mapping - to search
nmap - /

" remove search highlight with ,n
nmap <silent> <leader>n :silent :nohlsearch<CR>

" showing trailing white space
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" NERDTree hotkey
map <leader>p :execute 'NERDTreeToggle ' . getcwd()<CR>

"Will allow you to use :w!! to write to a file using sudo
cmap w!! %!sudo tee > /dev/null %

",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)
map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Remove the nasty windows endline
map MM :%s/\r/\r/g

" Live line reordering Ctrl + alt + (up|down) will move a line up/down
nnoremap <silent> <C-A-Up> :move .-2<CR>
nnoremap <silent> <C-A-Down> :move .+1<CR>
vnoremap <silent> <C-A-Up> :move '<-2<CR>gv
vnoremap <silent> <C-A-Down> :move '>+1<CR>gv
inoremap <silent> <C-A-Up> <C-o>:move .-2<CR>
inoremap <silent> <C-A-Down> <C-o>:move .+1<CR>

" Bash like movement in command line
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
"
" then :highlight show all the current colors
nmap  ,i :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
     \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
     \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
     \ . ">"<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             AUTO COMMANDS                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


" Folding
autocmd FileType css set foldmethod=manual
autocmd FileType css map \z zf/-----------------------<CR>

" PYTHON
autocmd BufNewFile *.py call append(0, "#!/usr/bin/python")
" BASH
autocmd BufNewFile *.sh call append(0, "#!/bin/bash")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               FUNCTIONS                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show all white Space
command WSpace call ShowWhiteSpace()
function ShowWhiteSpace()
    highlight spaceEOL ctermbg=red guibg=red
    match spaceEOL /^\s*\ \s*\|\s\+$/
endfunction

"
" Show all white space at EOL
command WSpaceEOL call ShowWhiteSpaceEOL()
function ShowWhiteSpaceEOL()
    highlight spaceEOL ctermbg=red guibg=red
    match spaceEOL /\s\+$/
endfunction


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

"
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  NERDtree                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERD_tree config
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2

" Nerd_commenter config
let NERDShutUp=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  SuperTab                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:SuperTabCrMapping = 0
let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType *
  \ if &omnifunc != '' |
  \   call SuperTabChain(&omnifunc, "<c-p>") |
  \ endif

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  MATCHIT                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" % matching also on if, else, ifelse, etc..
runtime macros/matchit.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 ULTISNIPS                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsSnippetDirectories=["UltiSnips", "bundle/ultisnips-snippets"]

autocmd FileType html set ft=htmldjango


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  AIRLINE                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#whitespace#enabled = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   CTRLP                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mapping recent file to ,f
map <leader>f :CtrlP<CR>
map <leader>r ::CtrlPMRU<CR>

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

