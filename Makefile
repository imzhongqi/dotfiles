EXCLUDE=ssh
PACKS=ls -F | grep "/" | grep -v '$(EXCLUDE)' | sed 's|/||g' | xargs -I %

all: init install

init:
	git submodule update --init

install:
	@$(PACKS) stow %

uninstall:
	@$(PACKS) stow -D %
