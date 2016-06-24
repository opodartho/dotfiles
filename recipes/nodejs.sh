if [ -e /usr/local/bin/node ];then
  echo "nodejs already installed. skipping.."
else
  pushd /tmp
  wget https://nodejs.org/dist/v4.4.5/node-v4.4.5.tar.gz
  tar -xvzf node-v4.4.5.tar.gz
  cd node-v4.4.5
  ./configure
  make
  sudo make install
  popd
  mkdir "${HOME}/.npm-packages"
fi
