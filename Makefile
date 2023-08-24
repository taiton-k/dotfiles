DOTFILES = .config/nvim .config/alacritty .config/picom .config/rofi .xmonad/xmonad.hs



.PHONY : all
all : $(addprefix ~/, $(DOTFILES))

define LINK
$(1) :
	ln -s $(2) $(1)
endef

$(foreach e, $(DOTFILES), $(eval $(call LINK, $(addprefix ~/, $(e)), $(addprefix ~/dotfiles/, $(e)))))
