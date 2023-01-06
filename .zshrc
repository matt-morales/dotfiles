# .zshrc

eval "$(/opt/homebrew/bin/brew shellenv)"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pure

fpath+=($HOME/dotfiles/.zsh/pure)

autoload -Uz promptinit
promptinit
prompt pure

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# change the path color
zstyle :prompt:pure:path color white

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

# aliases

alias ll='ls -alG'

[ -f ~/dotfiles/.fzf.zsh ] && source ~/dotfiles/.fzf.zsh

# fzf

# Exclude those directories even if not listed in .gitignore, or if .gitignore is missing
FD_OPTIONS="--hidden --follow -L -E .git -E node_modules"

# Change behavior of fzf dialogue
export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"

# Change find backend
# Use 'git ls-files' when inside GIT repo, or fd otherwise
export FZF_DEFAULT_COMMAND="git lsa -files --cached --others --exclude-standard | fd $FD_OPTIONS"

# Find commands for "Ctrl+T" and "Opt+C" shortcuts
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

alias -g Z='| fzf' # Z after command to have fzf read stdin

# flutter
export PATH="$PATH:/Users/matthewmorales/development/flutter/bin"

# dart
export PATH="$PATH":"$HOME/.pub-cache/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv global 3.10.6

# rbenv
eval "$(rbenv init - zsh)"

# Go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export GOBIN=$GOPATH/bin
