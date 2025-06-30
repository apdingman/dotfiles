# Aliases
alias v='nvim'
alias sn='cd ~/Google\ Drive/My\ Drive/notes'
alias yek='cd ~/yek'
alias dn='~/daily_note.sh'
alias notes='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/nvim-notes/'
alias dot='cd ~/src/dotfiles && nvim .'
alias src='cd ~/src' 
set -o vi

# Go Setup
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
HISTSIZE=1000
SAVEHIST=2000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY      # Append commands to history file immediately
setopt SHARE_HISTORY       # Share history across all open sessions
setopt HIST_IGNORE_DUPS    # Ignore duplicate commands in history
setopt HIST_IGNORE_SPACE   # Ignore commands that start with a space
alias st='wezterm cli set-tab-title'

#. '$HOME/.local/bin/env'
#
#
short_path() {
  local IFS='/'
  local parts=(${(s:/:)PWD})
  local count=${#parts[@]}

  if (( count > 2 )); then
    echo "…/${parts[-2]}/${parts[-1]}"
  else
    echo "$PWD"
  fi
}

git_prompt_info() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    # Check for uncommitted changes (tracked files)
    if ! git diff --quiet 2>/dev/null; then
      echo "%F{red}✗%f"  # Red "✗" for modified files
    # Check for staged but uncommitted changes
    elif ! git diff --cached --quiet 2>/dev/null; then
      echo "%F{yellow}⚡%f"  # Yellow "⚡" for staged files
    # Check for untracked files
    elif [[ -n $(git ls-files --others --exclude-standard) ]]; then
      echo "%F{magenta}?%f"  # Magenta "?" for untracked files
    else
      echo "%F{green}✔%f"  # Green "✔" if everything is clean
    fi
  fi
}

setopt PROMPT_SUBST  # Ensure prompt substitution is enabled

PROMPT='%F{blue}$(short_path)%f %# '
RPROMPT='$(git_prompt_info)'
