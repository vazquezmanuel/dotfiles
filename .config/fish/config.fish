# MY FISH CONFIG

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/.cargo/bin $fish_user_paths

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message

### SET MANPAGER
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### FUNCTIONS ###
function sr
	~/.scripts/sddmbg
	reboot
end
function ssn
	~/.scripts/sddmbg
	shutdown now
end

### ALIASES ###
# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# (Neo)vim
alias vim='lvim'

# Changing "ls" to "exa"
alias ls='exa -la --group-directories-first' # my preferred listing
alias la='exa -a --group-directories-first'  # all files and dirs
alias ll='exa -l --group-directories-first'  # long format
alias tree='exa -aT --group-directories-first' # tree listing

# Pacman
alias pacman='pacman --color auto'
alias update='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias cleanup='sudo pacman -Rns' # Remove orphaned packages

# Colorize grep output (good for log files)
alias grep='grep --color=auto'

# Better cat
alias cat='bat --style=plain'

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'

# Adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'
# Bare git repo alias for dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

### SETTING THE STARSHIP PROMPT ###
starship init fish | source
