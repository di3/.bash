
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

HOSTN=`hostname`
UPTIME=`uptime | grep -Eo 'up .+ user' | sed -e 's/:/ hours /' -e 's/ min//' -re 's/^up\s+/\x1b[0;36m\x1b[0;37m /' | sed -re 's/,\s+[0-9]+ user$/ minutes/' -e 's/,//g' -e 's/00 minutes//' | sed -re 's/0([1-9] minutes)/\1/' -e 's/(1 hour)s/\1/' -e 's/(1 minute)s/\1/' | sed -e 's/^[ \t]*//'`
MEMORY1=`cat /proc/meminfo | grep 'MemF'| awk '{print int($2/1000)}'`
MEMORY2=`cat /proc/meminfo | grep 'MemT'| awk '{print int($2/1000)}'`
LOAD=`cat /proc/loadavg | awk '{print $1" (1 minute) "$2" (5 minutes) "$3" (15 minutes)"}'`
IP1=`netstat -n -t | awk '{print $4}' | grep -o "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | grep -v "127.0.0.1" | sort -u`
WHOAMI=`whoami`
SSHTTY=`printenv SSH_TTY`
SSHCOUNT=`who | grep pts/ | wc -l`

#vim /etc/ssh/sshd_config
# █ Change:  PrintLastLog yes
# █ To:      PrintLastLog no
LL=`lastlog -u \`basename $HOME\` | grep \`basename $HOME\``
LL1=`echo $LL | awk '{ print $4 " " $5 " " $6 " " $9 " " $7 $8 }'`
LL2=`echo $LL | awk '{ print $3 }'`

DATE=`date`

echo -e "

 \033[0;37m________________________________________________________________________________
 \033[0;37m█
 \033[0;37m█  \033[1;31mToday......\033[0;37m \033[0m$DATE
 \033[0;37m█  \033[1;31mWhoami.....\033[0;37m \033[0m$WHOAMI
 \033[0;37m█  \033[1;31mLast Login.\033[0;37m \033[0m$LL1 from $LL2
 \033[0;37m█  \033[1;31mHostname...\033[0;37m \033[0m$HOSTN
 \033[0;37m█  \033[1;31mUptime.....\033[0;37m \033[0m$UPTIME
 \033[0;37m█  \033[1;31mMemory.....\033[0;37m \033[0m$MEMORY1 MB (Free) / $MEMORY2 MB (Total)
 \033[0;37m█  \033[1;31mLoad.......\033[0;37m \033[0m$LOAD
 \033[0;37m█  \033[1;31mIP Address.\033[0;37m \033[0m$IP1
 \033[0;37m█  \033[1;31mSSH tty....\033[0;37m \033[0m$SSHTTY ($SSHCOUNT)
 \033[0;37m█_______________________________________________________________________________

"
