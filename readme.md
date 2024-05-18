# My personal config file

## Installation order

1. tmux and tmux plugins
2. zsh
3. neovim dependencies
4. neovim plugins

## include config

- neovim(in wsl)
  - wsl-open.sh for open file with external program
    - Installation: `curl -o /usr/bin/wsl-open https://raw.githubusercontent.com/integer2bit/dotfiles/main/wsl-open.sh`
    - intergrate with obsidian
- wezterm (windows)
- .wslconfig
- tmux
- aria2

## tmux

### dependencies

- xclip for tmux yank

### Install config

Run `tmux source .tmux.conf` and press \<prefix\>I Install tmux plugins in tmux sessions

- prefix set \<C-Space\>
- \<prefix\>r reload tmux config

## zsh dependencies

- [fzf](https://github.com/junegunn/fzf)

### Installation

1. copy .zshrc to $HOME
2. source .zshrc
3. excute `chsh -s $(which zsh)`

## neovim plugins dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- git
- curl or wget
- unzip
- gzip
- nodejs
- npm
- python3
- python-pip
- gcc
- make
- cmake
- texlive (for vimtex)
- tree-sitter-cli (for latex parser)
