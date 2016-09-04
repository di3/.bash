# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi
alias ll='ls -la --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias lll='ls -la | less'
alias ..='cd ..'
alias ...='cd ../..'
alias cls='clear'

# history
alias hg='history | grep '

# sudo
alias apt-get='sudo apt-get'
alias sudo='sudo '

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

alias mt='mount | column -t'

alias ports='netstat -tulanp'

# output without comments
alias nocomment='grep -Ev '\''^(#|$)'\'''

# Shows the individual partition usages without the temporary memory values
alias partusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'

# Gives you what is using the most space. Both directories and files. Varies on current directory
alias most='du -hsx * | sort -rh | head -10'

alias psme='ps -ef | grep $USER --color=always '
alias ps2='ps -ef | grep -v $$ | grep -i '

alias ktcp='sudo ngrep -qK 1 $1 -d wlan0'
alias c='sudo lsof -n -P -i +c 15'

# git stuff
alias g="git"
alias gr="git rm -rf"
alias gs="git status"
alias ga="g add"
alias gc="git commit -m"
alias gp="git push origin master"
alias gl="git pull origin master"

# some other things
alias sha1='openssl sha1'
