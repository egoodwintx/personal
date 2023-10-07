#! /usr/bin/bash
# Usage: mount_nas.sh -u <USERNAME>
# 
while getopts ":u:h:" flag;
do
    case ${flag} in
        u)  
            username=${OPTARG}
            exec "mount -t cifs -o username=${username} //192.168.1.111/home /mnt/nas0"
            ;;
        h)  
            helpstr = "Usage: mount_nas.sh -u <USERNAME>"
            echo $helpstr
            ;;
        *)
            echo "Usage: mount_nas.sh -u <USERNAME>"
            exit 1
            ;;     
    esac
done