# bashrc
## [.bashrc](https://github.com/di3/bashrc/blob/master/.bashrc)

## [.bash_aliases](https://github.com/di3/bashrc/blob/master/.bash_aliases)

make sure you load the file in your .bashrc
```sh
if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi
```

## [.bash_functions](https://github.com/di3/bashrc/blob/master/.bash_functions)

make sure you load the file in your .bashrc
```sh
if [ -f ~/.bash_functions ]; then
   . ~/.bash_functions
fi
```

## [.bash_profile](https://github.com/di3/bashrc/blob/master/.bash_profile)
```sh
vim /etc/ssh/sshd_config
# Change:  PrintLastLog yes
# To:      PrintLastLog no
```
