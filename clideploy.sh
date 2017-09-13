#!/bin/bash
## Copies existing dotfiles to backup directory and puts symlinks
## to these files in their place
## Also creates a $BIN directory if none exists and moves envsync.sh
## there.
## v1.0 2017-09-07
## v2.0 2017-09-09

DEBUG=false

### ENV

SOURCEDIR=~/.dotfiles/cliconf
BKDIR=~/.dotfiles/backup/cliconf.orig
#FILES=$(ls $SOURCEDIR | grep -v "\.sh")
#FILES=('Xdefaults' 'archey3.cfg' 'bash_aliases' 'bash_logout'\
#		'bash_profile' 'bashrc' 'profile' 'tmux.conf' 'vimrc'\
#		'dircolorsrc')
# Cycling through the dir automatically was a neat idea when we didn't have
# subdirs to contend with, but things got complicated...

FILES="archey3.cfg \
	bash_aliases \
	bash_logout \
	bash_profile \
	bashrc \
	profile \
	tmux.conf \
	vimrc \
	dircolorsrc"
PWD=$(dirname $(readlink -f $0))

# Debug

$DEBUG && echo $FILES
$DEBUG && echo $PWD
$DEBUG && echo $SOURCEDIR

# Environment sanity

if [ $PWD != $SOURCEDIR ]; then
	printf "This script should only be run from within %s.\n" $SOURCEDIR
	exit 0
fi

# Make the backup dir if it doesn't exist

[ -d $BKDIR ] || mkdir -p $BKDIR

# Page through FILES list
# If symlink, ignore
# If exists, back up
# Link to master dotfile

for file in $FILES; do
	if [ -L ~/.$file ]; then
		continue;
	elif [ -f ~/.$file ]; then
		echo "Moving .$file to $BKDIR..."
		mv ~/.$file $BKDIR/$file.bak.$(date +"%s")
	fi
	echo "Creating symlink to $file in home directory..."
	ln -s $SOURCEDIR/$file ~/.$file
done

# Link other files and dirs
# Same checks, these just don't necessarily go in
# ~/.config

if [ ! -L ~/.vim ]; then
	if [ -d ~/.vim ]; then
		echo "Moving ~/.vim to $BKDIR..."
		mv -n ~/.vim $BKDIR/
	fi
	echo "Creating symlink to .vim in home directory..."
	ln -s $SOURCEDIR/vim ~/.vim
fi

if [ ! -L ~/.config/ranger ]; then
	if [ -d ~/.config/ranger ]; then
		echo "Moving ~/.config/ranger to $BKDIR..."
		mv -n ~/.config/ranger $BKDIR/
	fi
	echo "Creating symlink to ranger/ in .config directory..."
	ln -s $SOURCEDIR/ranger ~/.config/ranger
fi

# Make bin dir if it doesn't exist

[ -d ~/bin ] || mkdir -p ~/bin

