SHELL := /bin/bash

install:
	cp .tmux.conf /etc/tmux.conf
	mkdir --parents /etc/profile.d/
	cp .bash_aliases /etc/profile.d/bash_aliases.sh
	@if [ ! -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ] ; then \
		curl -L https://nixos.org/nix/install | sh -s -- --daemon ; \
		echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf ; \
	fi
	. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' && \
	nix develop "github:IslasGECI/pde" --command neofetch
	git config --global --add safe.directory '*'
