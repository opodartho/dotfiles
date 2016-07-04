if [ -d $HOME/.local/lib/python3.5/site-packages/powerline ]; then
	echo "powerline already installed. Skipping..."
else
	pip3 install git+git://github.com/powerline/powerline

	# install powerline fonts
	pushd /tmp
	wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
	wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

	sudo mv PowerlineSymbols.otf /usr/share/fonts/
	sudo fc-cache -vf /usr/share/fonts/
	sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
	popd
fi
