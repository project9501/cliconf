if filereadable(expand('~/.vimrc.local'))
	so ~/.vimrc.local
else
	so ~/.dotfiles/cliconf/vimrc.global
endif
