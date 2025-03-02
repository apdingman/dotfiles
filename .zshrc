# Aliases
alias v="nvim"
alias sn="cd ~/Google\ Drive/My\ Drive/notes"
alias yek="cd ~/yek"
alias dn="~/daily_note.sh"
alias ob="cd ~/Library/Mobile\ Documents/iCloud\~md\~obsidian"
alias notes="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/nvim-notes && nvim ."
alias todo="v ~/Library/Mobile\ Documents/com~apple~CloudDocs/nvim-notes/weeklys && nvim"
alias src="cd ~/src"
set -o vi

# Go Setup
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
export PS1='%~ x '
HISTSIZE=1000
SAVEHIST=2000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY      # Append commands to history file immediately
setopt SHARE_HISTORY       # Share history across all open sessions
setopt HIST_IGNORE_DUPS    # Ignore duplicate commands in history
setopt HIST_IGNORE_SPACE   # Ignore commands that start with a space
alias st="wezterm cli set-tab-title"

. "$HOME/.local/bin/env"
