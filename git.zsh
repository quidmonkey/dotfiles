# git
alias ftheman="rm -f .git/hooks/pre-commit"
alias gm="git merge"
alias gd="git diff"
alias gs="git status"
alias gf="git fetch"
alias gfp="git fetch -p"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gmo="git merge --no-ff @{u}"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias ga="git add ."
alias gaa="git add -A"
alias gpo="git push origin"
alias grh="git reset --hard"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gct="git checkout -t"
alias gbd="git branch -D"
alias gpod="git push origin --delete"
alias grgc="git reset --hard && git clean -fd"
alias gbdr="git push origin --delete"
alias gl="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias glp="git log --pretty=oneline"
alias glodg="git log --oneline --decorate --graph"
alias glodgs="git log --oneline --decorate --graph --stat"
alias listmybranches="git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n | grep \"Abraham Walters\""
alias raysontoyounow="git blame"
alias recentremotes="git for-each-ref --sort=-committerdate refs/remotes | sed 's_commit[[:space:]]refs/remotes/__g'"
alias recentbranches="git for-each-ref --sort=-committerdate refs/heads | sed 's_commit[[:space:]]refs/heads/__g'"
alias standup="git log --since yesterday --author `git config user.email` --pretty=short --all --no-merges"
alias whoiswinning="git shortlog -s -n"
alias yolo="git commit -am 'DEAL WITH IT' && git push -f origin master"

# tudes - leave the gun, take the cannoli
alias uncommit="reset --soft HEAD^"

alias bs=branch_status
branch_status () {
    git log -g --pretty=oneline $(git rev-parse --abbrev-ref HEAD)
}

alias grco=git_recheckout
git_recheckout() {
    git checkout dev
    git branch -D $1
    git checkout -t origin/$1
}

# log out all commits with file changes starting at current commit
alias tlog=tig_log
tig_log () {
    tig log $(git rev-parse HEAD)
}

# diff changes starting at current commit
alias tdiff=tig_diff
tig_diff () {
    tig show $(git rev-parse HEAD)
}

alias gsu=git_set_upstream
git_set_upstream () {
    git branch --set-upstream-to=origin/$1 $1
}

alias gg=git_grep
git_grep () {
    git grep $1 $(git rev-list --all)
}

alias glcba=git_line_count_by_author
git_line_count_by_author() {
    git log --author="$1" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "Added Lines: %s, Removed Lines: %s, Total Lines: %s\n", add, subs, loc }' -
}

alias gsba=git_search_by_author
git_search_by_author () {
   git log --author=$1
}

alias gitnext=git_next
git_next() {
    BRANCH=$1
    git checkout `git log --reverse --ancestry-path HEAD..${BRANCH:="master"} | head -n 1 | cut -d \  -f 2`
}

alias gitprev=git_prev
git_prev(){
  git checkout HEAD^
}

# To see when only a specific line was changed in a file. Still needs work to
# get the correct history when a line is moved
# First arg: line number
# Second arg: file path
alias linehist=lineHistory
function lineHistory {
    local commit='HEAD'
    commit=`git blame $commit -L $1,$1 $2 | grep -o '^[a-f0-9]\{7\}'`
    while [ $commit ]; do
        git log $commit --pretty=format:'%C(yellow)%h %Cred%cr %Cblue%an%Cgreen%d %Creset%s' -n1
        commit=`git blame $commit^ -L $1,$1 $2 | grep -o '^[a-f0-9]\{7\}'`
    done
}
