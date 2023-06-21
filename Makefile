DOTFILES = .config/nvim

.PHONY: link
link:
	ln -s ~/dotfiles/$(DOTFILES) ~/$(DOTFILES)
