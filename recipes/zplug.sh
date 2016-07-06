if [ -d $HOME/.zplug ]; then
	echo "zplug already installed. Skipping..."
else
	git clone https://github.com/zplug/zplug $HOME/.zplug --depth=1
	sudo apt-get install -y gawk
fi
