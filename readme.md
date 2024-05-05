# My personal config file

## include

- neovim(in wsl)
  - dependencies: [wsl-open](https://gitlab.com/4U6U57/wsl-open) (for markdown preview)
- wezterm (windows)
- .wslconfig
- tmux conf
- aria2 conf
- obsidian templates

### wsl-open Installation

`curl -o /usr/bin/wsl-open https://raw.githubusercontent.com/4U6U57/wsl-open/master/wsl-open.sh && chmod +x /usr/bin/wsl-open`

## neovim dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- git
- curl or wget
- unzip
- GNU tar
- gzip
- nodejs(for lsp)
- python3

## tmux

- prefix set \<C-Space\>
- \<prefix\>r reload tmux config
- \<prefix\>I Install tmux plugins

## zsh

### Installation

1. copy .zshrc to $HOME
2. source .zshrc
3. excute `chsh -s $(which zsh)`

### Command line tools

- fzf
- tldr
