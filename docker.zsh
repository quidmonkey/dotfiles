alias doc=docker

alias docforge=forge_docker
# Bash function to alias forge command to run in Docker container:
forge_docker() {
    docker run -it --rm \
        -v $(pwd):/data \
        -v $HOME/.ssh:/root/.ssh \
        --name forge \
        quidmonkey/forge:latest "$@"
}

alias doctforge=forge_test_docker
forge_test_docker() {
    docker run -it --rm \
        -v $(pwd):/data \
        -v $HOME/.ssh:/root/.ssh \
        --name forge \
        quidmonkey/forge-test:latest "$@"
}
