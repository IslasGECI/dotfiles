SHELL := /bin/bash

install:
	cp --force --recursive etc/. /etc
	git config --global --add safe.directory '*'
