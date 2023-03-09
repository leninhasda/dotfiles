git-copy:
	@rm git/.gitconfig.bk >> /dev/null
	@cp git/.gitconfig git/.gitconfig.bk


setup-all: zsh-conf tmux-conf code-conf git-conf nvim-conf

zsh-conf:
	rm $(HOME)/.zshrc
	ln -s $(HOME)/dotfiles/zsh/.zshrc $(HOME)/.zshrc
	
	rm $(HOME)/.aliases
	ln -s $(HOME)/dotfiles/zsh/.aliases $(HOME)/.aliases
	
tmux-conf:
	rm $(HOME)/.tmux.conf
	ln -s $(HOME)/dotfiles/tmux/.tmux.conf $(HOME)/.tmux.conf

code-conf:
	rm $(HOME)/.config/Code/User/settings.json
	ln -s $(HOME)/dotfiles/code/settings.json $(HOME)/.config/Code/User/settings.json

	rm $(HOME)/.config/Code/User/keybindings.json
	ln -s $(HOME)/dotfiles/code/keybindings.json $(HOME)/.config/Code/User/keybindings.json

git-conf:
	rm $(HOME)/.gitconfig
	ln -s $(HOME)/dotfiles/git/.gitconfig $(HOME)/.gitconfig

	rm $(HOME)/.gitignore
	ln -s $(HOME)/dotfiles/git/.gitignore $(HOME)/.gitignore
	
nvim-conf:
	@echo "will write later"