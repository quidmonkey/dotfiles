# aliases
alias cd..='cd ../'                         # Go back 1 directory level
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias clients="cd ~/Development/clients"
alias desk='cd ~/Desktop'
alias dev='cd ~/Development'
alias diff='colordiff'
alias dotfiles='e ~/.zshconfig'
alias e='atom'
alias hosts='e /etc/hosts'
alias ohmyzsh="e ~/.oh-my-zsh"
alias reload='source ~/.zshrc'
alias research='cd ~/Development/research'
alias shrug='echo -n "¯\_(ツ)_/¯" | pbcopy'
alias shrugl='echo -n "¯\_(ツ)¯\_" | pbcopy'
alias shrugr='echo -n "_/¯(ツ)_/¯" | pbcopy'
alias zshconfig="e ~/.zshrc"

# change ownership of a directory to myself
# takes directory
alias mine=make_mine
make_mine () {
    sudo chown -R $(whoami) $1
}

# takes two args
# first is the (path to the) command to make global
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
