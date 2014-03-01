# osx only
# ! command -v sw_ver > /dev/null 2>&1 || exit 1
# ! $(command -v sw_ver) || return
if [ ! $(command -v sw_ver) ]; then return; fi

alias batman="node -e 'console.log(Array(16).join(\"wat\" - 1).toLowerCase() + \"Batman!\")' | xargs say -v alex"
alias chrome='open -a Google\ Chrome --args --disable-web-security'
alias lestweforget="yes 'dawn' | xargs say -v 'Bad News'"
alias subl='~/subl'

# android
export PATH="$PATH:/Users/awalters/Development/Android/sdk/platform-tools"

# rvm
PATH=$PATH:$HOME/.rvm/bin 

# load rvm
source ~/.rvm/scripts/rvm

# add npm
export PATH="$PATH:/usr/local/share/npm/bin"

# get wireless ip
alias wip=get_wifi_ip
function get_wifi_ip {
    /sbin/ifconfig en1 | grep 'inet ' | awk '{ print $2 }'
}
