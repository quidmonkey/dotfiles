# ubuntu only
if [ ! $(command -v lsb_release) ]; then return; fi

# add android adb platform tools
export PATH=$PATH:~/Development/adt-bundle-linux-x86_64-20131030/sdk/platform-tools

# patch in osx say command
alias say='echo "$1" | espeak -s 120 2>/dev/null'

# open a directory with the nautilus (file) browser
alias open=nautilus_browser
nautilus_browser () {
    nautilus --browser $1
}

# get wireless ip
alias wip=get_wifi_ip
function get_wifi_ip {
    ifconfig wlan0 | grep 'inet ' | awk '{ print $2 }' | sed s/addr://g
}
