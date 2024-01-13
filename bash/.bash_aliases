#-----------------------------------------
# .bash_aliases
# project: personal
# description: personal bash alias file
# init date: 2022.12.14
# 
#-----------------------------------------

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls --color=auto'
    alias la='ls --color=auto -al'
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
    alias python='python3'
    alias sshx='ssh -X'
    # figure out last time FreeBSD updated
    #alias pupd='sqlite3 /var/db/pkg/local.sqlite "select datetime(time, \"unixepoch\") from packages order by time desc limit 1"'        # ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "OSX detected."
elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo "Windows Cygwin detected."
    # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
    echo "Windows detected."
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
    echo "Windows detected."        # I'm not sure this can happen.
elif [[ "$OSTYPE" == "openbsd"* ]]; then
    echo "OpenBSD detected."
    alias la='ls -al'
    alias ll='ls -lh'
    alias lt='du -sh * | sort -h'
    alias pkg='pkg_add'
    alias hs='history | grep'
    alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
    alias mkdir="mkdir -p"
    alias myip="curl http://ipecho.net/plain; echo"
    alias python='python3'
    alias sshx='ssh -X'
    # figure out last time OpenBSD updated
    alias pupd='sqlite3 /var/db/pkg/local.sqlite "select datetime(time, \"unixepoch\") from packages order by time desc limit 1"'    # ...
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "FreeBSD detected."
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
    alias sshx='ssh -X'
    alias python='python3'
    # figure out last time FreeBSD updated
    alias pupd='sqlite3 /var/db/pkg/local.sqlite "select datetime(time, \"unixepoch\") from packages order by time desc limit 1"'
else
    echo "Unknown OS detected."    # Unknown.
fi
