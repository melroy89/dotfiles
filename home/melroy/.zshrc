# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Do not save commands starting with a space to history
setopt HIST_IGNORE_SPACE

# Ignore a duplicate of the previous command
setopt HIST_IGNORE_DUPS

# Save commands to history as you run them
setopt INC_APPEND_HISTORY

# Enable autocd
setopt AUTO_CD

# Recognize comments on the command line
setopt INTERACTIVE_COMMENTS

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Color aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Aliases
alias lzd='lazydocker'
alias lg='lazygit'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias code='codium'
alias nvi='nvim'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias minicom='minicom -con'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="/opt/mxe/usr/bin:$HOME/.config/composer/vendor/bin:$HOME/gems/bin:~/bin:~/.npm-global/bin:/usr/local/go/bin:$HOME/go/bin:$PATH"

# Update minicom with colors
export MINICOM="-m -c on"

# Extend path for Symfony & Cargo
export PATH="$HOME/.symfony5/bin:$HOME/.cargo/env":$PATH

# pnpm
export PNPM_HOME="/home/melroy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Deno
. "/home/melroy/.deno/env"
. "$HOME/.cargo/env"
# Deno end

# Starship Prompt
eval "$(starship init zsh)"