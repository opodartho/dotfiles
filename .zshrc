source ~/.zsh/antigen/antigen.zsh
# Load the oh-myzsh's library
antigen use oh-my-zsh

# Bundle from the default repo
antigen bundle git
antigen bundle heroku
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the them.
antigen bundle frmendes/geometry
# Tell antigen that it's done
antigen apply

source ~/.zshrc.local
