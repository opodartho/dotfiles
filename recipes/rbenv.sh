# rbenv
# $1: ruby version

if [ -d ~/.rbenv ]; then
  echo 'rbenv already installed, skipping.'
else
  sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev
  git clone git://github.com/rbenv/rbenv.git ~/.rbenv
  source ~/.zshrc
  mkdir -p ~/.rbenv/plugins
  cd ~/.rbenv/plugins
  git clone git://github.com/rbenv/ruby-build.git
  echo "Compiling Ruby. Grab some hot chocolate, this will take a while..."
  rbenv install 2.3.1
  rbenv global 2.3.1
  gem install bundler
  rbenv rehash
fi
