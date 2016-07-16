if [ -L /usr/bin/zsh ]; then
	echo "zsh already installed. Skipping..."
else
	sudo apt install -y zsh
	echo "Configuring zsh as default shell"
	chsh -s $(which zsh)
fi
