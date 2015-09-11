"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
" Let vundle manage vundle...required!
"Bundle 'gmarik/vundle'
"Bundle 'trailing-whitespace'
"Bundle 'tpope/vim-commentary'
"Bundle 'nanotech/jellybeans.vim'
"Bundle 'git@github.com:nathanaelkane/vim-indent-guides.git'

set nocompatible "to get all the vim-only options
set encoding=utf-8 "default encoding to utf-8
set fileencoding=utf-8  " The encoding written to file.
filetype plugin indent on "enable filetype detection
syntax enable "enable syntax highlighting

"better indentation for visual mode
vnoremap < <gv
vnoremap > >gv

" some basic settings
set number
set nowrap
"set colorcolumn=80 "add column default
highlight ColorColun ctermbg=233 "make color column red

" linebreak on 79 char
"set lbr
set tw=79

"show whitespace
"MUST be inserted before colorscheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"set colorscheme
colorscheme default
"mouse support
"set mouse=a

set incsearch " smart searching
set ignorecase " ignore case when searching
set smartcase "unless there's a capital letter there
set hlsearch " highlight search results
set incsearch "higlight search matches as i type
set scrolloff=3 " set three lines around cursor at all times
set wildmenu "better comand line completion
set wildmode=longest,list " wildmode for tab behavior
"set backupdir =~/.vim/backup

" make backspace work like it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set lazyredraw " performance config
set magic " for regular expressions

" show matching brackets
set showmatch
set mat=2

" set indents
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent				"Auto indent
set smartindent				"Smart indent
set smarttab
set cindent

" retrun to last edit position when opening files
autocmd BufReadPost *
  \if line("'\'") > 0 && line("'\'") <= line("$") |
  \  exe "normal! g`\"" |
  \endif
" remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Setup Pathogen to manage your plugins
" "mkdir -p ~/.vim/autoload ~/.vim/bundle
" "curl -so ~/.vim/autoload/pathogen.vim
" https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" "Now you can install any plugin into a .vim/bundle/plugin-name/ folder
execute pathogen#infect()
syntax on
filetype plugin indent on

"---------------------
"Bundle 'Syntastic'
"cd ~/.vim/bundle && \
"git clone https://github.com/scrooloose/syntastic.git
"---------------------

"----------------------
"Bundle 'NerdTree'
"cd ~/.vim/bundle
"git clone https://github.com/scrooloose/nerdtree.git
"----------------------
"NERDTree settings
"----------------------
" set width
let g:NERDTreeWinSize =30

"----------------------
"NERDTree Tabs
"cd ~/.vim/bundle
"git clone https://github.com/jistr/vim-nerdtree-tabs.git
"----------------------
" toggle with Ctrl+t
map <C-t> <plug>NERDTreeTabsToggle<CR>

"-------------------
"Bundle 'DelimitMate'
"cd ~/.vim/bundle
"git clone https://github.com/Raimondi/delimitMate.git
"----------------------

"-------------------
"Bundle 'Tagbar'
"cd ~/.vim/bundle
"git clone https://github.com/majutsushi/tagbar.git
"----------------------
" toggle with \+l
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

"-------------------
"Bundle 'supertab'
"cd ~/.vim/bundle
"git clone https://github.com/ervandew/supertab.git
"----------------------

"------------------
"set per dir vimrc
set exrc
set secure
"-----------------
