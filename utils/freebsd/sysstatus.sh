#!/usr/bin/env sh

#------------------------------------------------
# systatus.sh
# A system status notification script
# shamelessly stolen from 
# https://forums.freebsd.org/threads/howto-be-notified-of-freebsd-upgrades-security-updates-and-package-updates-at-login.86660/
#
# date: 12.16.2022
#
#------------------------------------------------

# let's do an automatic update check (use http as long as it's supported, https also works)
#_ICON_THUMBSUP="\xf0\x9f\x91\x8d"
#_ICON_WARNING="\xe2\x9a\xa0\xef\xb8\x8f"
#_ICON_NOTICE="\xf0\x9f\x92\xac"
#_ICON_WAIT1="\xe2\x8f\xb3"
#_ICON_WAIT2="\xe2\x8c\x9b"
_ICON_THUMBSUP=":-)"
_ICON_WARNING="/!\\"
_ICON_NOTICE="/!\\"
_ICON_WAIT1="[.]"
_ICON_WAIT2="[:]"

echo ""
printf "  ${_ICON_WAIT1}  Checking for operating system updates, please wait... "
_CUR_MMN="$(freebsd-version|awk -F- '{print $1}')"
_CUR_VER="$(freebsd-version)"
_AVL_MMN="$(HTTP_TIMEOUT=3 fetch -qo - "http://www.freebsd.org" 2>/dev/null|tr -d '\n'|sed -E -e 's/<\/?(a|span)[^>]*>//g' -e 's/<\/?(br|li|p|div)>/\n/g'|grep "Production:"|tr ',' ' '|awk '{print $NF}')"
_AVL_VER="${_AVL_MMN}-$(HTTP_TIMEOUT=3 fetch -qo - "http://cgit.freebsd.org/src/plain/sys/conf/newvers.sh?h=releng/${_AVL_MMN}" 2>/dev/null|grep "^BRANCH="|cut -d'"' -f2)"
if [ -z "${_AVL_MMN}" ]; then
    printf "\r  ${_ICON_WARNING}  Automatic update check failed (error retrieving the latest production version from www.freebsd.org).\n"
elif [ -z "$(echo "${_AVL_VER}"|grep "RELEASE")" ]; then
    printf "\r  ${_ICON_WARNING}  Automatic update check failed (error retrieving the latest patchlevel version from cgit.freebsd.org).\n"
elif [ "_${_CUR_VER}" = "_${_AVL_VER}" ]; then
    printf "\r  ${_ICON_WAIT2}  Checking for available package updates, please wait... "
    _PKG_CNT="$(pkg upgrade -n|grep -E -o "^The following [0-9]+"|grep -E -o "[0-9]+"||echo "0")"
    if [ "${_PKG_CNT}" -gt 0 ]; then
        printf "\r  ${_ICON_NOTICE}  You have ${_PKG_CNT} outdated package(s). Consider using pkg(8) upgrade.\n"
    else
        printf "\r  ${_ICON_THUMBSUP}  Your system is up to date. Congratulations!           \n"
    fi
elif [ "_${_CUR_MMN}" = "_${_AVL_MMN}" ]; then
    printf "\r  ${_ICON_WARNING}  A security update is available: ${_AVL_VER}. Consider using freebsd-update(8).\n"
else
    printf "\r  ${_ICON_WARNING}  A new FreeBSD version is available: ${_AVL_VER}. Consider using freebsd-update(8).\n"
fi
unset _AVL_VER _AVL_MMN _CUR_VER _CUR_MMN _PKG_CNT _ICON_WAIT2 _ICON_WAIT1 _ICON_NOTICE _ICON_WARNING _ICON_THUMBSUP
echo ""