#-----------------------------------------
# .bash_aliases
# project: personal
# description: personal bash alias file
# init date: 2022.12.14
# 
#-----------------------------------------

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
alias la='ls -al --color=auto'
    alias ll='ls -lh --color=auto'
    alias lt='du -sh * | sort -h'
    alias pkg='sudo apt-get'
    alias hs='history | grep'
    alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
    alias mkdir="mkdir -p"
    alias myip="curl http://ipecho.net/plain; echo"
    alias chmod='sudo chmod'
    alias chown='sudo chown'
    alias chgrp='sudo chgrp'
    # figure out last time FreeBSD updated
    #alias pupd='sqlite3 /var/db/pkg/local.sqlite "select datetime(time, \"unixepoch\") from packages order by time desc limit 1"'        # ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
elif [[ "$OSTYPE" == "openbsd"* ]]; then
    alias la='ls -al'
    alias ll='ls -lh'
    alias lt='du -sh * | sort -h'
    alias pkg='pkg_add'
    alias hs='history | grep'
    alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
    alias mkdir="mkdir -p"
    alias myip="curl http://ipecho.net/plain; echo"
    # figure out last time OpenBSD updated
    alias pupd='sqlite3 /var/db/pkg/local.sqlite "select datetime(time, \"unixepoch\") from packages order by time desc limit 1"'    # ...
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    alias la='ls -al --color=auto'
    alias ll='ls -lh --color=auto'
    alias lt='du -sh * | sort -h'
    alias pkg='sudo pkg'
    alias hs='history | grep'
    alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
    alias mkdir="mkdir -p"
    alias myip="curl http://ipecho.net/plain; echo"
    alias chmod='sudo chmod'
    alias chown='sudo chown'
    alias chgrp='sudo chgrp'
    # figure out last time FreeBSD updated
    alias pupd='sqlite3 /var/db/pkg/local.sqlite "select datetime(time, \"unixepoch\") from packages order by time desc limit 1"'
else
        # Unknown.
fi


