# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# make zsh default shell
# chsh -s $(which zsh)
### ZSH env
export VISUAL=nvim
export EDITOR=nvim
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

###  Path
if [ "$(id -u)" -eq 0 ]; then
  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  if uname -r | grep -qi WSL; then
      export PATH=$PATH:/mnt/c/Windows/SysWOW64/WindowsPowerShell/v1.0:/mnt/c/windows
fi
else
  PATH="/usr/local/bin:/usr/bin:/bin"
fi
export PATH

### zsh directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
alias d='dirs -v'
for index ({1..10}) alias "$index"="cd +${index}"; unset index
### ---- history config -------------------------------------
setopt appendhistory
setopt sharehistory

export HISTFILE="${XDG_DATA_HOME:-${HOME}/.local/share}/.zsh_history"

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# Now any command that starts with a space won't be recorded in the history.
setopt hist_ignore_space

# If you run a command multiple times, only the most recent execution will be kept in history.
setopt hist_ignore_all_dups

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS


# ---- FZF -----
FZF=".fzf"
if [ ! -d "$HOME/$FZF" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/$FZF
    $HOME/$FZF/install
    echo "fzf has been installed"
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

### themes
zinit ice depth=1; 
zinit light romkatv/powerlevel10k
### plugins

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light jeffreytse/zsh-vi-mode


# Completion styling
fpath=(~/.local/share/zinit/completions/src $fpath)
autoload -Uz compinit && compinit
bindkey '^o' autosuggest-accept

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

### custome alias 
cdw() { local d=`wslpath "$1"`; cd "$d"; }
alias vi='nvim'
alias ls='ls --color'
alias la='ls -a'
alias cl='clear'
alias cdob='cd /mnt/d/Documents/obsidian'
alias cmd='/mnt/c/Windows/SysWOW64/WindowsPowerShell/v1.0/powershell.exe'
alias wslo='wsl-open'
alias exp='explorer.exe'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
