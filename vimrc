" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set cmdheight=1
set noswapfile

" set fold
set foldmethod=indent
set foldlevelstart=99
map ff za

" disable vi compatibility (emulation of old bugs)
set nocompatible
set backspace=indent,eol,start

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 4 spaces
set shiftwidth=2     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
set textwidth=1200

" turn syntax highlighting on
set t_Co=256
syntax on
colorscheme molokai
set hlsearch
hi Normal guibg=NONE ctermbg=NONE
set cursorline

" turn line numbers on
set number
set statusline=%1*%F%m%r%h%w%=\ %2*\ %Y\ %3*%{\"\".(\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"\"}\ %4*[%l,%v]\ %5*%p%%\ \|\ %6*%LL
set statusline=%1*%F%m%r%h%w%=\ %4*[%l,%v]\ %5*%p%%\ \|\ %6*%L
hi User1 cterm=none ctermbg=black ctermfg=green
set laststatus=2

" highlight matching braces
set showmatch
hi Visual cterm=none ctermbg=darkgray ctermfg=cyan

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" ignore case only if encounter a UpperCase
set ignorecase
set smartcase

set tags=./tags;tags
set autochdir
let mapleader = ";"
map <Space> <c-f>

map <c-j> :BufMRUPrev<CR>
map <c-k> :BufMRUNext<CR>
map J <c-w>j
map K <c-w>k
map q <c-w>
map b :Git blame<CR>

let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 40
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
map <F1> :NERDTreeToggle<CR>

call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'universal-ctags/ctags'
Plug 'mildred/vim-bufmru'
Plug 'preservim/nerdtree'
" Plug 'tpope/fugitive-vim'
" Plug 'Yggdroot/indentLine'
" Plug 'zivyangll/git-blame.vim'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'rhysd/vim-clang-format'
" Plug 'vim-scripts/global-6.6.8'
call plug#end()

let g:Lf_GtagsAutoGenerate = 0
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/home/admin/gtags/share/gtags/gtags.conf'
" noremap <c-d> :<C-U><C-R>=printf("Leaderf gtags -d %s ", expand("<cword>"))<CR><CR>
" noremap <c-r> :Leaderf gtags <CR>

let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.root']
let g:Lf_DefaultExternalTool='rg'


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

let g:Lf_WindowPosition = 'bottom'
let g:Lf_WindowHeight = 0.7
" let g:Lf_PopupHeight = 0.7
" let g:Lf_PopupWidth = 0.8
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_PreviewInPopup = 1
map <c-p> :LeaderfFile<CR>
map <c-o> :LeaderfBuffer<CR>
map <c-u> :Leaderf rg 
map <c-n> :Leaderf --recall<CR>
map <c-m> <c-]>
map <c-y> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
map <F2> :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR><CR>
" map <c-n> :reserve for tmux
" map <c-i> /<c-r>=printf("%s", expand("<cword>"))<CR><CR>
map <c-i> *
map <F3> N
map <F4> n
nnoremap <c-a> :<C-u>call gitblame#echo()<CR>

" auto open and save session
" alias vim='vim -S .session.vim.swp '
let g:Argc = (argc() != 0)
let g:Argv = argv(0)
let g:CurrDir = getcwd() . '/'
fu! EditFile()
    if g:Argc
        execute 'cd ' . g:CurrDir
        execute 'edit ' . g:Argv
    endif
endfunction
autocmd VimEnter * call EditFile()

set sessionoptions=buffers
let g:SessionFile = g:CurrDir . '/' . '.session.vim.swp'
fu! SaveSess()
    if !g:Argc
        execute 'mksession! ' . g:SessionFile
    endif
endfunction
autocmd VimLeave * call SaveSess()

