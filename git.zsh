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
alias whoiswinning="git shortlog -s -n"
alias glp="git log --pretty=oneline"
alias gg=git_grep
git_grep () {
    git grep $1 $(git rev-list --all)
}
alias standup='git log --since yesterday --author `git config user.email` --pretty=short --all --no-merges'
