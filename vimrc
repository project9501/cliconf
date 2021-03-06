" set nocompatible
" filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" vundle packages
Bundle 'ying17zi/vim-live-latex-preview'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'vim-syntastic/syntastic'
" Bundle 'ervandew/supertab'		" It's annoying
" Bundle 'wikitopian/hardmode'		" let's not punish ourselves just yet
Bundle 'kien/ctrlp.vim'
Bundle 'vimwiki/vimwiki'
Bundle 'jceb/vim-orgmode'

" call vundle#end()

" vim options
syntax enable						" previously on
colorscheme elflord
filetype plugin indent on
set number 							" activate absolute numbers
set relativenumber 					" activate relative numbers
set ignorecase 						" ignore case in searches
set ruler 							" always show info along bottom
set autoindent 						" auto-indent
set tabstop=4 						" tab spacing is 4
set softtabstop=0					" for smart tabs
set shiftwidth=4 					" indent/outdent by 4
set shiftround 						" always indent/outdent to nearest tabstop
set noexpandtab						" for smart tabs
set copyindent						" for smart tabs
set preserveindent					" for smart tabs
set colorcolumn=80					" wrap bar at 80 chars
highlight ColorColumn ctermbg=0		" Make the color column black
