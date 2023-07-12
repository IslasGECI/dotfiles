SHELL := /bin/bash

install:
	cp --force --recursive etc/. /etc
	@if [ ! -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ] ; then \
		curl -L https://nixos.org/nix/install | sh -s -- --daemon ; \
		echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf ; \
	fi
	. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' && \
	nix develop "github:IslasGECI/pde" --command nvim --version
	git config --global --add safe.directory '*'
