# osx only
! command -v sw_ver >/dev/null 2>&1 || exit 1

alias batman="node -e 'console.log(Array(16).join(\"wat\" - 1).toLowerCase() + \"Batman!\")' | xargs say -v alex"
alias chrome='open -a Google\ Chrome --args --disable-web-security'
alias lestweforget="yes 'dawn' | xargs say -v 'Bad News'"

# get wireless ip
alias wip=get_wifi_ip
function get_wifi_ip {
    /sbin/ifconfig en1 | grep 'inet ' | awk '{ print $2 }'
}
