# git
alias gm="git merge --no-ff"
alias gd="git diff"
alias gs="git status"
alias gf="git fetch"
alias gp="git pull"
alias gpr="git pull --rebase --no-ff"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias ga="git add ."
alias gaa="git add -A"
alias gpo="git push origin"
alias grh="git reset --hard"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gct="git checkout -t"
alias glp="git log --pretty=oneline"
alias glodg='git log --oneline --decorate --graph'
alias glodgs='git log --oneline --decorate --graph --stat'
alias recentremotes="git for-each-ref --sort=-committerdate refs/remotes | sed 's_commit[[:space:]]refs/remotes/__g'"
alias recentbranches="git for-each-ref --sort=-committerdate refs/heads | sed 's_commit[[:space:]]refs/heads/__g'"
alias standup='git log --since yesterday --author `git config user.email` --pretty=short --all --no-merges'
alias whoiswinning="git shortlog -s -n"
alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master'

alias gg=git_grep
git_grep () {
    git grep $1 $(git rev-list --all)
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
