# Arc

PROMPT_SYMBOL='▲'
EXIT_VALUE_SYMBOL="%{$fg_bold[magenta]%}△%{$reset_color%}"

_print_title() {
  print -n '\e]0;'
  print -Pn $1
  print -n '\a'
}

# Show current command in title
_set_cmd_title() {
  _print_title "${2} @ %m"
}

# Prevent command showing on title after ending
_set_title() {
  _print_title '%~'
}

arc_prompt() {
  autoload -U add-zsh-hook

  add-zsh-hook preexec  _set_cmd_title
  add-zsh-hook precmd   _set_title

  PROMPT="%(?.$PROMPT_SYMBOL.$EXIT_VALUE_SYMBOL) %{$fg[blue]%}%3~%{$reset_color%} "
}

arc_prompt
