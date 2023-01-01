#-----------------------------------------
# .bash_aliases
# project: personal
# description: personal bash alias file
# init date: 2022.12.14
# 
#-----------------------------------------

alias la='ls -al --color=auto'
alias ll='ls -lh --color=auto'
alias lt='du -sh * | sort -h'
alias pkg='sudo pkg'
alias hs='history | grep'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir="mkdir -pv"
alias myip="curl http://ipecho.net/plain; echo"
alias chmod='sudo chmod'
alias chown='sudo chown'
alias chgrp='sudo chgrp'
# figure out last time FreeBSD updated
alias pupd='sqlite3 /var/db/pkg/local.sqlite "select datetime(time, \"unixepoch\") from packages order by time desc limit 1"'

