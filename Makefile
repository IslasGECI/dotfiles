install:
	cp .tmux.conf /etc/tmux.conf
	mkdir --parents /etc/profile.d/
	cp .bash_aliases /etc/profile.d/bash_aliases.sh
	curl -L https://nixos.org/nix/install | sh -s -- --daemon
	echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
	. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
	nix develop --command neofetch
