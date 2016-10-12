# get github host url
get_github_host () {
    echo 'https://github.com/'
}

# get the owner and repo slug (i.e. owner/slug)
get_git_owner_repo () {
    git remote show origin -n | ruby -ne 'puts /^\s*Fetch.*:(.*).git/.match($_)[1] rescue nil'
}

# get the github base url of host + owner/repo slug
get_github_base_url () {
    local host=$(get_github_host)
    local owner_repo=$(get_git_owner_repo)
    echo $host$owner_repo
}

# get the current git branch
get_git_branch () {
    git rev-parse --abbrev-ref HEAD
}

# takes the target file to blame on github
# example: ghblame path/to/file
alias ghblame=github_blame
github_blame () {
    local base_url=$(get_github_base_url)
    local branch=$(get_git_branch)
    open $base_url/blame/$branch/$1
}

# opens a target commit from the current branch on github
# takes an optional arg for a target commit in the current branch
# otherwise targets the latest commit in the current branch
alias ghcommit=github_commit
github_commit () {
    local base_url=$(get_github_base_url)
    local commit=${1:-$(git rev-parse HEAD)}
    open $base_url/commit/$commit
}

# diff the current branch against dev on github
alias ghdiff=github_diff
github_diff () {
    local base_url=$(get_github_base_url)
    local branch=$(get_git_branch)
    open $base_url/compare/dev...$branch
}
