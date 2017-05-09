# pipe something
function pipe() {
	${1:-} | ${2:-}
}

# mkdir and cd into it 
function mkcd() {
	mkdir -pv -- "$1" && cd -P -- "$1"
}

# remove current directory
function rmcd() {
	local tmp=`pwd`
	cd ..
	rm -rf $tmp
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

# aextract
function aextract() {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xvjf $1;;
			*.tar.gz)		tar xvzf $1;;
      *.tar.xz)   tar xvJf $1;;
      *.tar.7z)   7za x -so $1 | tar xf - --numeric-owner;;
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

function alist() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar -jtvf $1;;
      *.tar.gz)   tar -ztvf $1;;
      *.gz)       tar -ztf $1;;
      *.tar)      tar -tf $1;;
      *.zip)      unzip -l $1;;
      *.7z)       7z l $1;;
      *) echo "don't know how to list '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi

}

function acreate() {
  if [ -d $2 ] ; then
    case $1 in
      *.tar.gz)   tar -zcvf $1 $2;;
      *.tar.7z)   tar cf - $2 | 7za a -si $1;;
      *.gz)       tar -zcvf $1 $2;;
      *.tar)      tar -cf $1 $2;;
      *.zip)      7z a -tzip $1 $2;;
      *.7z)       7z a -t7z $1 $2;;
      *.tar.7z)       7z a -t7z $1 $2;;
      *) echo "don't know how to create '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
  
}
