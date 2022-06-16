if filereadable(expand('~/.vimrc.local'))
	so ~/.vimrc.local
else
	so ~/.vim/vimrc.global
endif
