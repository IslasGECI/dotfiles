alias build-dev='echo "FROM islasgeci/pde:latest" > ./Dockerfile.dev && tail --lines=+2 ./Dockerfile >> ./Dockerfile.dev && docker build --file ./Dockerfile.dev --tag islasgeci/${PWD##*/}:develop .'
alias develop='nix develop "github:IslasGECI/pde"'
alias lsp-nvim='docker run --interactive --rm --tty --volume ${PWD}:/workdir islasgeci/pde:latest'
alias run-dev='docker run --env BITBUCKET_USERNAME --env BITBUCKET_PASSWORD --interactive --name ${PWD##*/}_dev --rm --tty --volume ${PWD}:/workdir islasgeci/${PWD##*/}:develop bash'
alias v=nvim
alias vi=nvim
alias vim=nvim
