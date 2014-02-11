# dawn aliases
alias cleanssh="ssh-keygen -R 172.24.200.82 ; ssh -o StrictHostKeyChecking=no root@172.24.200.82"
alias cw="dawn && compass watch ./src &"
alias dawn="cd ~/Development/telenet_dawn"
alias dust="dawn && node duster.js &"
alias gcchrome="open -a /Applications/Google\ Chrome.app --args --js-flags='--expose-gc'"
alias rebaseDev="git checkout develop && git pull --rebase && git checkout - && git rebase develop"
alias stbmwb="ssh -o StrictHostKeyChecking=no -C root@172.24.200.82 'cd /mnt/nfs/mwb ; /bin/sh'"
alias touchdusts='find ~/.dawn/src/templates/dusts/ -type f | xargs touch'
alias touchsass="echo '#fakeidToTriggerSassRecompile{color:red}' >> ~/.dawn/src/styles/sass/_default.scss && sleep 3 && sed -i '/#fakeidToTriggerSassRecompile{color:red}/d' ~/.dawn/src/styles/sass/_default.scss"
alias totallines="find . -type f -iname '*.js' -exec cat {} \; | wc"

alias tstb=TSTB
function TSTB () {
    open "https://jira.epam.com/jira/browse/TSTB-$1"
}

alias gitlab=TSTBG
function TSTBG () {
    open "https://git.epam.com/libg-106/commit/$1"
}

alias stblog=stbtail
function stbtail() {
    ssh -o StrictHostKeyChecking=no -o LogLevel=quiet -C -t root@172.24.200.82 'tail -f -n 500 /opt/logs/mwb.log' | \
        colout ".*Z  DEBUG  .*" black faint | \
        colout ".*controller\.do.*" yellow | \
        colout "^\"DAWN.*" white bold | \
        colout ".*STOPWATCH.*" cyan | \
        colout "(ERROR):" red normal | \
        colout "(WARN):" yellow faint | \
        colout "MEMORY:[^\"]*" green
}
