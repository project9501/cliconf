# ~./bashrc

# If not running interactively, don't do anything

case $- in
		*i*) ;;
		  *) return;;
esac

# Sync git repo
# git pull ~/.config/dotfiles >/dev/null 2>&1

# Some env variables
export QUOTING_STYLE='literal'
export EDITOR=vim
export RANGER_LOAD_DEFAULT_RC=false
export GPODDER_HOME=/home/${USER}/.config/gPodder
export GPODDER_DOWNLOAD_DIR=/home/pub/Music/Podcasts
export XAUTHORITY=$HOME/.Xauthority

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

[ -f ~/.bash_prompt ] && . ~/.bash_prompt || PS1='[\A \u@\h: \w]# '

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# bin path

if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# ruby path

if [ -d "$HOME/.gem/ruby/2.6.0/bin" ]; then
	PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
fi

# for vim-live-latex-preview

if [ -d "$HOME/.vim/bundle/vim-live-latex-preview/bin" ]; then
	PATH="$PATH:$HOME/.vim/bundle/vim-live-latex-preview/bin"
fi

if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# If a login shell, run some extra commands

# shopt -q login_shell && archey3
# grep -q -e "Arch" /etc/issue && archey3
# Bootsplash

if [ -n "$(command -v neofetch)" ]; then
	neofetch
fi

#if [ -n "$(command -v archey3)" ]; then
#	archey3
#elif [ -n "$(command -v screenfetch)" ]; then
#	screenfetch
#fi

# Finally, if there's a local bashrc, source it

[ -f ~/.bashrc.local ] && source ~/.bashrc.local
