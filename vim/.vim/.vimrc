" Set leader key early
let mapleader=","

" --- Native Behaviour Config ---

" Colourscheme
syntax on
colorscheme default
hi LineNr ctermfg=15 guifg=White

set mouse=a
set backspace=indent,eol,start
set timeoutlen=1000  " Prevent lag when exiting inset mode
set ttimeoutlen=10
set shiftwidth=4    " A tab is 4 spaces wide
set textwidth=100   " Wordwrap at 100th column
set colorcolumn=+1  " Colour the 101st column
set nowrap          " don't wrap lines
set tabstop=4       " A tab is four spaces wide
set autoindent      " always set autoindenting on
set copyindent      " copy the previous indentation on autoindenting
set number          " always show line numbers
set relativenumber  " make line numbers relative to current
set shiftwidth=4    " number of spaces to use for autoindenting
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch       " show matching parenthesis
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type
set hidden          " hide buffers instead of deleting them
set title
set modeline
set scrolloff=5
set nolazyredraw
set updatetime=1000 " wait less time to write to swap
set showcmd         " show keystrokes on current command
set ttyfast         " send more characters for redrawing
"set list
set list lcs=tab:\␉\ 
"set list lcs=tab:\┊\ 
"set list lcs=tab:\➤\ 

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Various Key Maps
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
set pastetoggle=<F4>
" save as root
"cmap :w!! %!sudo tee > /dev/null %
cabbrev w!! %!sudo tee > /dev/null %
" remove any search highlighting
nnoremap <silent> <C-l> :nohl<CR>

