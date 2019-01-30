# dotfiles
vim, zsh, git, rbenv, node - only things i need

## Ruby
### rbenv
```bash
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
$ cd ~/.rbenv && src/configure && make -C src
```
### ruby-build
```bash
$ mkdir -p "$(rbenv root)"/plugins
$ git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```
### requisite libraries
```bash
sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
```
## Python
### pyenv
```bash
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
$ cd ~/.rbenv && src/configure && make -C src
```
## Node
### nodenv
```bash
$ git clone https://github.com/nodenv/nodenv.git ~/.nodenv
$ cd ~/.rbenv && src/configure && make -C src
```
### node-build
```bash
$ mkdir -p "$(nodenv root)"/plugins
$ git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build
```
## rust
```bash
$ curl https://sh.rustup.rs -sSf | sh
```
### exa
```bash
$ cargo install exa
```
## tmux
```bash
$ sudo apt install tmux -y
```
