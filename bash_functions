## CL(S) for cd and ls in one action
## From the Arch wiki 

cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

## Note-taking

n() {
	[ -d $NOTEDIR ] || mkdir -p $NOTEDIR
	$EDITOR $NOTEDIR/"$*"
}

nls() {
	lsd -tr --blocks name,date $NOTEDIR/ | grep "$*"
}

nrm() {
	rm $NOTEDIR/"$*"
}

nf() {
	grep -C 5 "$*" $NOTEDIR/*
}

ncat() {
	cat $NOTEDIR/"$*"
}
