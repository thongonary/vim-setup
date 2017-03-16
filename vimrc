" This must be first, because it changes other options as side effect
set nocompatible

set hidden

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab     " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch           " search as characters are entered

if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

syntax enable           " enable syntax processing

" 4 spaces for tab
set shiftwidth=4
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set number              " show line numbers

set showcmd             " show command in bottom bar

filetype plugin indent on

if has('autocmd')
    autocmd filetype python set expandtab
endif

set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/closes folds
nnoremap <space> za

set foldmethod=marker

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Simple color scheme for vimdiff
highlight DiffAdd    cterm=bold ctermfg=1 ctermbg=none gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=1 ctermbg=none gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=1 ctermbg=none gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=1 ctermbg=none gui=none guifg=bg guibg=Red

set backspace=indent,eol,start " backspace over everything in insert mode

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Show command on the last line of the screen
set showcmd

" Use ` as leader key
let mapleader="`"

" Toggle between displaying line number
nnoremap <Leader>n :set invnumber<CR>

" Run pathogen (manage the runtime path)
execute pathogen#infect()

" NERDTree needs this because vim8 encoding is incompatible
let g:NERDTreeDirArrows=0
set encoding=utf-8

" Open NERDTree on startup
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Recommend settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
