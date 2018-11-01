DOTROOT    := $(realpath $(dir ($(lastword $(MAKEFILE_LIST)))))
EXC        := .git .DS_Store .gitignore
CANDIDATES := $(wildcard .??*)
DOTFILES   := $(filter-out $(EXC), $(CANDIDATES))

all: start link install restart

start:
	@echo "mt_coff"

.PHONY: link
link:
	@echo "start linking..."
	@$(foreach var, $(DOTFILES), ln -sfnv $(abspath $(var)) $(HOME)/$(var);)
	@ln -sfnv $(abspath nvim) $(HOME)/.config/nvim
	@echo "finish!"

.PHONY: install
install:
	@DOTROOT=$(DOTROOT) bash $(DOTROOT)/bin/install.sh

restart:
	exec $$SHELL
