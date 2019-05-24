# If not running interactively, don't do anything
[[ $- != *i* ]] && return

trap "" DEBUG

export LANG=de_DE.UTF-8
export LANGUAGE=de_DE.UTF-8
#export LC_ALL=de_DE.UTF-8

# History settings
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd*:ll:la:l:lll:cls:hg:history";
export HISTSIZE=4096;
export HISTCONTROL="ignoreboth:erasedups"
shopt -s histreedit;

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# colored prompt, if the terminal has the capability
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*)
  ;;
esac

# dynamic screen titles
if [ "$TERM" = "screen" ]; then
    export PROMPT_COMMAND='true'
    set_screen_window() {
      #HPWD=`basename "$PWD"`
      HPWD=`pwd`
      if [ "$HPWD" = "$USER" ]; then HPWD='~'; fi
      if [ ${#HPWD} -ge 20 ]; then HPWD='..'${HPWD:${#HPWD}-18:${#HPWD}}; fi
      case "$BASH_COMMAND" in
        *\033]0*);;
        "true")
            printf '\ek%s\e\\' "$HPWD"
            ;;
        *)
            printf '\ek%s\e\\' "$HPWD: ${BASH_COMMAND:0:20}"
            ;;
      esac
    }
    trap set_screen_window DEBUG
fi

# EDITOR is vim
export EDITOR=vim;

# Color definitions
if [ -f ~/.bash_colors ]; then
  . ~/.bash_colors
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Function definitions.
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
