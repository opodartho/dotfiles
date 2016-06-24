if [ ! -e /etc/apt/sources.list.d/neovim-ppa-ubuntu-unstable-xenial.list ]; then
	sudo apt install software-properties-common
	sudo add-apt-repository -y ppa:neovim-ppa/unstable
	sudo apt update
	sudo apt install -y neovim
	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
fi
