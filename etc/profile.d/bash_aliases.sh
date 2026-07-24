alias build-dev='cp Dockerfile Dockerfile.dev && curl https://raw.githubusercontent.com/IslasGECI/pde/develop/Dockerfile | tail --lines=+2 >> Dockerfile.dev && docker build --file ./Dockerfile.dev --tag islasgeci/${PWD##*/}:develop .'
alias lsp-nvim='docker run --interactive --rm --tty --volume ${PWD}:/workdir islasgeci/pde:latest'
alias open-r="docker run -itv $PWD:/workdir islasgeci/base R"
alias init_opencode='f(){ docker exec -it $1 bash; }; f'
alias run-dev='docker run --env BITBUCKET_USERNAME --env BITBUCKET_PASSWORD --interactive --name ${PWD##*/}_dev --rm --tty --volume ${PWD}:/workdir islasgeci/${PWD##*/}:develop bash'
alias v=nvim
alias vi=nvim
alias vim=nvim
init_tmux() {
 	tmux new -d -s "$1"
	tmux new-window -t "$1:1"
	tmux new-window -t "$1:2" -n "vim"
	tmux send-keys -t "$1:1" "docker compose run islasgeci" ENTER
	tmux send-keys -t "$1:vim" "lsp-nvim" ENTER
	tmux attach -t "$1"
}
