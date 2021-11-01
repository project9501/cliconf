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

#n() {
#	[ -d $NOTEDIR ] || mkdir -p $NOTEDIR
#	$EDITOR $NOTEDIR/"$*"
#}

n() {
  which joplin || echo "Joplin is not installed."
  [[ -z $@ ]] && notename=$(date +'%F %T') || notename="$@"
  notename=$(echo $notename | tr " " "-")
  joplin use Notes
  joplin edit $notename
}

#nls() {
#	lsd -tr --blocks name,date $NOTEDIR/ | grep "$*"
#}

nls() {
  joplin use Notes
  joplin ls --long --reverse
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

msg() {
	echo "$*" >> $MOTD
}

## ssh-agent

giton() {
	eval "$(ssh-agent -s)" && ssh-add ~/.ssh/github_rsa
}
