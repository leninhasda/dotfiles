git-copy:
	@rm -f git/.gitconfig.bk
	@cp git/.gitconfig git/.gitconfig.bk


setup-all: zsh-conf tmux-conf code-conf git-conf nvim-conf

zsh-conf:
	rm -f $(HOME)/.zshrc
	ln -s $(HOME)/dotfiles/zsh/.zshrc $(HOME)/.zshrc
	
	rm -f $(HOME)/.aliases
	ln -s $(HOME)/dotfiles/zsh/.aliases $(HOME)/.aliases
	
tmux-conf:
	rm -f $(HOME)/.tmux.conf
	ln -s $(HOME)/dotfiles/tmux/.tmux.conf $(HOME)/.tmux.conf

code-conf:
	rm -f $(HOME)/.config/Code/User/settings.json
	ln -s $(HOME)/dotfiles/code/settings.json $(HOME)/.config/Code/User/settings.json
	rm -f $(HOME)/.config/Code/User/keybindings.json
	ln -s $(HOME)/dotfiles/code/keybindings.json $(HOME)/.config/Code/User/keybindings.json

git-conf:
	rm -f $(HOME)/.gitconfig
	ln -s $(HOME)/dotfiles/git/.gitconfig $(HOME)/.gitconfig
	rm -f $(HOME)/.gitignore
	ln -s $(HOME)/dotfiles/git/.gitignore $(HOME)/.gitignore
	
nvim-conf:
	@echo "will write later"
