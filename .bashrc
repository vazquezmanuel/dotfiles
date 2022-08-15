# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='lvim'
eval "$(starship init bash)"
exec fish
