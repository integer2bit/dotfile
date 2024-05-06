# My personal config file

## Installation order

1. [tmux and tmux plugins](#1)
2. zsh
3. neovim dependencies
4. neovim plugins

## include

- neovim(in wsl)
- wezterm (windows)
- .wslconfig
- tmux conf
- aria2 conf
- obsidian templates

## tmux

### Install config

Run `tmux source .tmux.conf` and press \<prefix\>I Install tmux plugins in tmux sessions

- prefix set \<C-Space\>
- \<prefix\>r reload tmux config

## zsh

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
- nodejs(for lsp)
- npm
- python3
- python-pip
- gcc
- make
- cmake

### neovim browser function in wsl

Add chrome.exe to Windows $PATH
