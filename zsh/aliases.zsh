if which tmuxinator> /dev/null; then alias mux='tmuxinator'; fi
if which docker-compose> /dev/null; then alias dcompose='docker-compose'; fi
if which exercism> /dev/null; then alias excm='exercism'; fi
if which elixir> /dev/null; then alias e='elixir'; fi

if which exa > /dev/null; then
  alias ll='exa -la --git --color-scale'
  alias l='exa -l --git --color-scale'
  alias lt='exa -lT --git --color-scale'
  alias ls='exa'
fi
