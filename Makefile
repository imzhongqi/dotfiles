EXCLUDE = ssh
PACKS = ls -F | grep "/" | grep -v '$(EXCLUDE)' | sed 's|/||g' | xargs -I %

.PHONY: all
all: init install

.PHONY: init
init:
	@bash ./init
	@git submodule update --init

.PHONY: install
install:
	@$(PACKS) stow %

.PHONY: uninstall
uninstall:
	@$(PACKS) stow -D %
