" Bootstrap vim-plug
" Modified from:
" https://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let al_plug=expand('~/.local/share/nvim/site/autoload/plug.vim')
let plug_installed=1
if !filereadable(al_plug)
	echo "Installing vim-plug"
	echo ""
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let plug_installed=0
endif

" Set leader key early
let mapleader=","

" Set host python early (macOS)
if has('unix')
	if has('mac')
		let g:python_host_prog=expand('~/.pyenv/versions/neovim2/bin/python')
		let g:python3_host_prog=expand('~/.pyenv/versions/neovim3/bin/python')
	endif
endif

" --- Plugin Manager Configuration ---
call plug#begin('~/.local/share/nvim/plugged')

" Dependencies
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " idanaraye/vim-vebugger
Plug 'tpope/vim-repeat' " tpope/surround.vim

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editor
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'triglav/vim-visual-increment'
Plug 'godlygeek/tabular', { 'do': ':source tabular.vim' }
Plug 'tpope/vim-sleuth'

" Buffer view helpers
Plug 'majutsushi/tagbar'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Linting
Plug 'w0rp/ale'

" Completion
Plug 'roxma/nvim-completion-manager'
	" Completion Packages
	Plug 'roxma/clang_complete'
	Plug 'Shougo/neco-vim'
	Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
	Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Debugging
Plug 'idanarye/vim-vebugger', { 'branch': 'develop' }

" Session Management
Plug 'tpope/vim-obsession'
Plug 'moll/vim-bbye'

" Misc Functionality
Plug 'nicholaides/words-to-avoid.vim'

" Filetypes
Plug 'cespare/vim-toml'
Plug 'harenome/vim-mipssyntax'

" Themes
"Plug 'jnurmine/Zenburn'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'

" Funzies
Plug 'koron/nyancat-vim'
"Plug 'mattn/invader-vim'

" Install Plugins if vim-plug wasn't installed
if !plug_installed
	:PlugInstall
endif

call plug#end()
" Automatically called:
"   filetype plugin indent on
"   syntax enable

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
set copyindent      " copy the previous indentation on autoindenting
set smartindent     " smart autoindenting in new line
set tabstop=4       " number of spaces to use for tabulation
set shiftwidth=4    " number of spaces to use for space indenting
set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop
"set expandtab

" Set makeprg
if has('unix')
	if has('mac')
		set makeprg=gmake
	endif
endif

" Search
set incsearch       " show search matches as you type
set hlsearch        " highlight search terms
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise

" UI
set relativenumber  " make line numbers relative to current
set number          " always show line numbers
set showmatch       " show matching parenthesis
set showcmd         " show keystrokes on current command
set title           " change terminal title
set cursorline      " highlights current line
set noshowmode       " Do not show --MODE--
set laststatus=2    " Show Airline
set shortmess+=c    " hide completions, e.g '-- XXX completion (YYY)', 'match 1 of 2', 'The only match'
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
set scrolloff=5      " minimum number of lines to keep below the cursor
set nowrap           " Don't visually wrap lines
set textwidth=100    " Indicate 100th column on buffer
set formatoptions-=t " ...but don't physically wrap text
set colorcolumn=+1   " Colour the 101st column

" --- Key Mappings ---

" Buffer traversal
nnoremap <silent><F13> :bnext<CR>
nnoremap <silent><F14> :bprevious<CR>
inoremap <silent><F13> <Esc>:bnext<CR>
inoremap <silent><F14> <Esc>:bprevious<CR>

" Completion
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <silent><expr><CR> pumvisible() ? "\<c-y>" : "\<CR>"

" Tagbar
nnoremap <silent><Leader>t :TagbarToggle<CR>

" FZF
nnoremap <silent><Leader>f :Files<CR>
nnoremap <silent><Leader>w :Window<CR>
nnoremap <silent><Leader>b :Buffers<CR>

" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" save as root
cnoremap :w!! w !sudo tee % > /dev/null

" Make <C-l> remove any search highlighting
nnoremap <silent> <C-l> :nohl<CR>

" --- Plugin Behaviour Config ---

" Airline / Tmuxline
"let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
"let g:airline_exclude_preview = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" ALE
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 800
let g:ale_sign_column_always = 1

" Fugitive
" https://github.com/tpope/vim-fugitive/issues/76
if exists(':Gdiff')
	command! Gdt tabedit %|Gdiff
endif

" Vebugger
if has('unix')
	if has('mac')
		let g:vebugger_path_python_lldb = '/usr/bin/python'
	endif
endif

" nvim-completion-manager
set completeopt=longest,menuone
" clang_complete
" Set appropriate paths on macOS
if has('unix')
	if has('mac')
		let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
	endif
endif

" vim-better-whitespace
hi link ExtraWhitespace Error
