install:
	cp .tmux.conf /etc/tmux.conf
	mkdir --parents /etc/profile.d/
	cp .bash_aliases /etc/profile.d/bash_aliases.sh
