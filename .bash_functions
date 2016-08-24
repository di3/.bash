# pipe something
function pipe() {
	${1:-} | ${2:-}
}

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }

#  Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr() {
	OPTIND=1
	local mycase=""
	local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
	while getopts :it opt
	do
		case "$opt" in
			i) mycase="-i " ;;
		   *) echo "$usage"; return ;;
		esac
	done
	shift $(( $OPTIND - 1 ))
	if [ "$#" -lt 1 ]; then
		echo "$usage"
		return;
	fi
	find . -type f -name "${2:-*}" -print0 | \
xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more
}

# swap two files
function swap() {
	local TMPFILE=tmp.$$

	[ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
	[ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
	[ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

	mv "$1" $TMPFILE
	mv "$2" "$1"
	mv $TMPFILE "$2"
}

# extract
function extract() {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xvjf $1;;
			*.tar.gz)		tar xvzf $1;;
			*.bz2)			bunzip2 $1;;
			*.gz)				gunzip $1;;
			*.tar)			tar xvf $1;;
			*.tbz2)			tar xvjf $1;;
			*.tgz)			tar xvzf $1;;
			*.zip)			unzip $1;;
			*.Z)				uncompress $1;;
			*.7z)				7zr x $1;;
			*) echo "don't know how to extract '$1'" ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }
