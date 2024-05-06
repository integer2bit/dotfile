# make zsh default shell
# chsh -s $(which zsh)
### ZSH env
export ZSH=$HOME/.zsh
export VISUAL=nvim
export EDITOR=nvim

###  Path
if [ "$(id -u)" -eq 0 ]; then
  PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
else
  PATH="/usr/local/bin:/usr/bin:/bin"
fi
export PATH

### Create zsh directory
dir_list=(.zsh .zsh/plugins .zsh/themes)

for dir in "${dir_list[@]}"; do
    if [ ! -d "$HOME/$dir" ]; then
        mkdir -p "$HOME/$dir"
        echo "$dir has been created."
    fi
done
### zsh directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
alias d='dirs -v'
for index ({1..10}) alias "$index"="cd +${index}"; unset index
### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

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
themes=".zsh/themes/spaceship-prompt"

if [ ! -d "$HOME/$themes" ]; then
    git clone --depth 1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/$themes"
    echo "Spaceship-prompt has been cloned into $themes."
fi
source $ZSH/themes/spaceship-prompt/spaceship.zsh-theme
### --- Spaceship themes Config ------------------------------------
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
# to include after line break
SPACESHIP_USER_SHOW=always
SPACESHIP_TIME_SHOW=true
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
### plugins
#zsh-completion
completion=".zsh/plugins/zsh-completion"
if [ ! -d "$HOME/$completion" ]; then
    git clone --depth 1 https://github.com/zsh-users/zsh-completions.git  "$HOME/$completion"
    echo "zsh-completion has been cloned into $completion."
fi
fpath=($HOME/$completion/src $fpath)
#zsh-autosuggestions
zsh_autosuggestions=".zsh/plugins/zsh-autosuggestions"
if [ ! -d "$HOME/$zsh_autosuggestions" ]; then
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git  "$HOME/$zsh_autosuggestions"
    echo "zsh-autosuggestions has been cloned into $zsh_autosuggestions."
fi
source $HOME/$zsh_autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
#vi-mode
vimode=".zsh/plugins/vi-mode"

if [ ! -d "$HOME/$vimode" ]; then
    git clone --depth 1 https://github.com/jeffreytse/zsh-vi-mode.git  "$HOME/$vimode"
    echo "zsh-vi-mode has been cloned into $vimode."
fi
source $HOME/$vimode/zsh-vi-mode.plugin.zsh
# vi-mode config
export KEYTIMEOUT=1
cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}
cursor_mode

### custome alias 
cdw() { local d=`wslpath "$1"`; cd "$d"; }
alias vi='nvim'
alias cdob='cd /mnt/d/Documents/obsidian'
alias cmd='/mnt/c/Windows/SysWOW64/WindowsPowerShell/v1.0/powershell.exe'

#zsh-syntax-highlighting
zsh_syntax_highlighting=".zsh/plugins/zsh-syntax-highlighting"
if [ ! -d "$HOME/$zsh_syntax_highlighting" ]; then
    git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git  "$HOME/$zsh_syntax_highlighting"
    echo "zsh-syntax-highlighting has been cloned into $zsh_syntax_highlighting."
fi
source $HOME/$zsh_syntax_highlighting/zsh-syntax-highlighting.zsh
