#!/bin/bash
## Resets the CLI shortcuts
## v1.0 Just removes links
## v2.0 will restore from backup if available

FILES=".Xdefaults \
	.config/compton.conf \
	.config/i3 \
	.config/polybar \
	.config/conky"

for file in $FILES; do
	if [ -L $HOME/$file ]; then
		printf "Found link %s, removing...\n" $file
		rm $HOME/$file
	elif [ -f $HOME/$file ]; then
		printf "Found file %s, ignoring...\n" $file
	elif [ -d $HOME/$file ]; then
		printf "Found directory %s, ignoring...\n" $file
	else
		printf "Could not find %s\n" $file
	fi
done

