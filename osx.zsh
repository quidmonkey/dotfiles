# osx only
if [[  $(uname) != "Darwin" ]]; then return; fi

alias batman="node -e 'console.log(Array(16).join(\"wat\" - 1).toLowerCase() + \"Batman!\")' | xargs say -v alex"
alias chrome='open -a Google\ Chrome --args --disable-web-security'
alias f='open -a Finder ./'                 # Opens current directory in MacOS Finder
alias lestweforget="yes 'dawn' | xargs say -v 'Bad News'"
alias simu='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
alias trf='trash'
trash () {                                  # Moves a file to the MacOS trash
    command mv "$@" ~/.Trash ;
}

# alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# android
# export PATH="$PATH:/Users/Abe.Walters/Development/adt-bundle-mac-x86_64-20140321/sdk"
# export ANDROID_HOME="/Users/Abe.Walters/Development/adt-bundle-mac-x86_64-20140321/sdk"

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init -)"
export PYENV_ROOT=$(brew --prefix)/var/pyenv
# #To enable auto-activation add to your profile:
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


# get wireless ip
alias wip=get_wifi_ip
function get_wifi_ip {
    /sbin/ifconfig en1 | grep 'inet ' | awk '{ print $2 }'
}

# show and hide hidden files in Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# renew ip
alias renewip='sudo ipconfig set en0 BOOTP; sudo ipconfig set en0 DHCP'

# because life is so much better with it
# eval "$(thefuck --alias)"
# alias jesus=fuck

# go
# export PATH=$PATH:/usr/local/opt/go/libexec/bin
# export GOPATH=/usr/local/opt/go/libexec
