# aliases
alias desk='cd ~/Desktop'
alias dev='cd ~/Development'
alias diff='colordiff'
alias dotfiles='e ~/.zshconfig'
alias e='subl'
alias hosts='e /etc/hosts'
alias ohmyzsh="e ~/.oh-my-zsh"
alias reload='~/.zshrc'
alias zshconfig="e ~/.zshrc"

# post to an endpoint via curl
# takes two args
# first: data in the form of "param1=value1&param2=value2"
# second: the url
alias cpd=curl_post_data
curl_post_data () {
    curl --data $1 $2
}

# ddos - run in background!
alias ddos=curl_site_indefinitely
curl_site_indefinitely () {
    while [ 1 == 1 ]; do curl $1; sleep 5; done
}

# change ownership of a directory to myself
# takes directory
alias mine=make_mine
make_mine () {
    sudo chown -R $(whoami) $1
}

# takes two args
# first is the command to make global
# second is the alias for the command
alias addcmd=make_cmd_global
make_cmd_global () {
    sudo ln -s $(which $1) /usr/local/bin/$2
}

# make it easy to search for a running process
alias psg=ps_grep
ps_grep () {
    ps aux | grep $1
}

# make it easy to kill a process
alias psk=ps_kill
ps_kill () {
    kill -15 $(ps aux | grep $1 | awk '{print $2;}')
}

# takes url
# find out when a server goes live
alias whenshesup=is_she_up
is_she_up () {
    while ! curl -Is $1 > /dev/null ; do sleep 1 ; done ; echo She\'s Up
}
