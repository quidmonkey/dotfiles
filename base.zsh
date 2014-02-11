# aliases
alias desk='cd ~/Desktop'
alias dev='cd ~/Development'
alias diff='colordiff'
alias e='~/subl'
alias hosts='e /etc/hosts'
alias impact="cd ~/Development/impact"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias reload='~/.zshrc'
alias starninja="cd ~/Development/impact/starninja"
alias subl='~/subl'
alias zshconfig="subl ~/.zshrc"

# ddos - run in background!
alias ddos=curl_site_indefinitely
curl_site_indefinitely () {
    while [ 1 == 1 ]; do curl $1; sleep 5; done
}

# make it easy to search for a running process
alias psg=ps_grep
ps_grep () {
    ps aux | grep $1
}

# make it easy to kill a process
alias psk=ps_kill
ps_kill () {
    kill -9 $(ps aux | grep $1 | awk '{print $2;}')
}

alias pyserve=python_server
python_server () {
    python -m SimpleHTTPServer $1
}

# get wireless ip
alias wip=get_wifi_ip
function get_wifi_ip {
    /sbin/ifconfig en1 | grep 'inet ' | awk '{ print $2 }'
}
