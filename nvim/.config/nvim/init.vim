" Set leader key early
let mapleader=","

" --- Plugin Manager Configuration ---
call plug#begin('~/.local/share/nvim/plugged')

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editor
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate' " auto-complete for delimiters
"Plug 'jiangmiao/auto-pairs' " Very annoying
"Plug 'scrooloose/syntastic'
Plug 'neomake/neomake'
Plug 'triglav/vim-visual-increment'
Plug 'moll/vim-bbye'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/echodoc.vim'
Plug 'nicholaides/words-to-avoid.vim'
Plug 'godlygeek/tabular'
"Plug 'critiqjo/lldb.nvim', { 'do': ':UpdateRemotePlugins' }

" Completion Packages
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neco-vim'

" Filetypes
Plug 'mips.vim'

" Themes
"Plug 'duythinht/inori'
"Plug 'MaxSt/FlatColor'
"Plug 'jnurmine/Zenburn'
"Plug 'xero/blaquemagick.vim'
"Plug 'w0ng/vim-hybrid'
"Plug 'sk1418/last256'
"Plug 'nanotech/jellybeans.vim'
"Plug 'tpope/vim-vividchalk'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
"Plug 'altercation/vim-colors-solarized'

" Funzies
Plug 'koron/nyancat-vim'
"Plug 'mattn/invader-vim'

call plug#end()

" --- Native Behaviour Config ---

" System
set updatetime=1000 " wait less time to write to swap
set nolazyredraw
set modeline        " Check for Modeline on files
set hidden          " hide buffers instead of deleting them
set timeoutlen=1000  " Prevent lag when exiting inset mode
set ttimeoutlen=10

" Mouse
"set ttyfast         " send more characters for redrawing
set mouse=a

" Indentation
set autoindent      " always set autoindenting on
"set copyindent      " copy the previous indentation on autoindenting
"set smartindent     " smart autoindenting in new line
set tabstop=4       " number of spaces to use for tabulation
set shiftwidth=4    " number of spaces to use for space indenting
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
"set expandtab

" Search
set incsearch       " show search matches as you type
set hlsearch        " highlight search terms
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise

" UI
set relativenumber  " make line numbers relative to current
set number          " always show line numbers
set showmatch       " show matching parenthesis
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Change cursor shape between insert and normal mode in Iterm2
set showcmd         " show keystrokes on current command
set title           " change terminal title
"set cursorline      " highlights current line
set noshowmode       " Do not show --MODE--
set laststatus=2    " Show Airline
"set list
set list lcs=tab:\▸\ 
"set list lcs=tab:\┊\ 
"set list lcs=tab:\➤\ 

" Colourscheme
syntax on
set bg=dark
set termguicolors
"let base16colorspace=256  " Access colors present in 256 colorspace
let g:gruvbox_italic=1
colorscheme gruvbox

" Editor
set backspace=indent,eol,start
set scrolloff=5     " minimum number of lines to keep below the cursor
set nowrap          " don't wrap lines
set textwidth=100   " Wordwrap at 100th column
set colorcolumn=+1  " Colour the 101st column

" Key Maps
nnoremap <silent><F13> :bnext<CR>
nnoremap <silent><F14> :bprevious<CR>
inoremap <silent><F13> <Esc>:bnext<CR>
inoremap <silent><F14> <Esc>:bprevious<CR>

"set pastetoggle=<F4>
" save as root
"cmap :w!! %!sudo tee > /dev/null %
cabbrev w!! %!sudo tee > /dev/null %
" <C-l> redraws the screen (neovim workaround)
" and removes any search highlighting.
"nnoremap <silent> <C-l> :mode<CR>:nohl<CR>
nnoremap <silent> <C-l> :nohl<CR>

" --- Plugin Behaviour Config ---
" VimFiler
" Like Textmate icons.
"let g:vimfiler_tree_leaf_icon = ' '
"let g:vimfiler_tree_opened_icon = '▾'
"let g:vimfiler_tree_closed_icon = '▹'
"let g:vimfiler_file_icon = '-'
"let g:vimfiler_marked_file_icon = '*'
"let g:vimfiler_readonly_file_icon = '🔒'
"let g:vimfiler_as_default_explorer = 1

" Airline / Tmuxline
"let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
"let g:airline_exclude_preview = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Syntastic
"let g:syntastic_mode_map = { "mode": "passive" }
"let g:syntastic_full_redraws=1
"nnoremap <Leader>cc :SyntasticToggleMode<CR>

" Neomake
"let g:neomake_javascript_eslint_maker = {
"	\ 'args': ['--rule "no-unused-vars: 0"']
"	\ }
"let g:neomake_java_enabled_makers = []
if has('unix')
	if has('mac')
		set makeprg=gmake
	endif
endif
autocmd! BufWritePost * Neomake

" delimitMate
let delimitMate_expand_cr = 1

" FZF
nnoremap <silent><Leader>f :Files<CR>
nnoremap <silent><Leader>w :Window<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = { '_': 'buffer' }
set completeopt-=preview
" Completion bindings
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"

" vim-better-whitespace
hi link ExtraWhitespace vimError

" echodoc
"let g:echodoc_enable_at_startup = 1

" deoplete-clang
" Set appropriate paths on macOS
if has('unix')
	if has('mac')
		let g:deoplete#sources#clang#libclang_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
		let g:deoplete#sources#clang#clang_header='/usr/include'
	endif
endif
