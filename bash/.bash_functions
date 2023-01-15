#-----------------------------------------
# .bash_functions
# project: personal
# description: personal bash functions file
# init date: 2022.12.14
# 
#-----------------------------------------

# create .tar.gz 
targz() { tar -zcvf $1.tar.gz $1; rm -r $1; }

# extra .tar.gz
untargz() { tar -zxvf $1; rm -r $1; }

# count number of files in a directory
numfiles() { 
    N="$(ls $1 | wc -l)"; 
    echo "$N files in $1";
}