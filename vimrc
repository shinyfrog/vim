" Matteo Rattotti vimrc file 

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let g:SuperTabCrMapping = 0

" Remove the nasty windows endline
map MM :%s/\r/\r/g

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

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

"Will allow you to use :w!! to write to a file using sudo 
cmap w!! %!sudo tee > /dev/null %

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
set splitbelow     " Split windows at bottom
set splitright     " Split the window on the right
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

" Fold settings
set foldmethod=indent " Make folding indent sensitive
set foldlevel=100 " Don't autofold anything (but I can still fold manually)

" Bells management
set noerrorbells   " 
set visualbell     " 
set vb t_vb=       " Set visualbell not orrible beep

" status bar setting
set laststatus=2   " Always show the status line 
set statusline=\ \%y\ %t%=\ %l-%c\ [%n]\ %p%\%\ \ 

" file type
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
set noswapfile
set nobackup
set nowritebackup

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

" Folding 
autocmd FileType css set foldmethod=manual
autocmd FileType css map \z zf/-----------------------<CR>

" NERD_tree config
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2

" Nerd_commenter config
let NERDShutUp=1

map <leader>h :call HexHighlight()<CR>

" Setting omnicompletion behaviour
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap <C-K>    <C-U>

" PYTHON
autocmd BufNewFile *.py call append(0, "#!/usr/bin/python")
" BASH
autocmd BufNewFile *.sh call append(0, "#!/bin/bash")

" Markdown
au! BufRead,BufNewFile *.mkd   setfiletype mkd
au! BufRead,BufNewFile *.mk   setfiletype mkd

" SCSS
au BufRead,BufNewFile *.scss set filetype=scss

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
map ,v :sp ~/.vimrc<CR><C-W>_
map <silent> ,V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


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


" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = { 'default' : '', }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


" Recommended key-mappings.
" <CR>: insert current completion.
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB>: move to next completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" auto select first completion entry
let g:neocomplcache_enable_auto_select = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
" imap <expr><CR> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<CR>"
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
