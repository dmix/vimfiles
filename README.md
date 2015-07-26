# vim

### Directory Structure:

`./vimrc` contains vim-specific settings and loads config files
`./plugins.vim` a list of plugins manged by [vim-plug](https://github.com/junegunn/vim-plug)
`./config/` settings for various 3rd-party plugins, colorschemes, and keybindings

### Installation

My system configuration files are typically managed using [Homemaker](https://github.com/FooSoft/homemaker) and synced using git. I store my [dotfiles](https://github.com/dmix/dotfiles) at /usr/loca/dotfiles and Homemaker handles symlinking everything to `$HOME`.

Vim is more involved so I keep it in a self-contained repo and simple install script to set it up:

```
   git clone http://github.com/dmix/vimfiles.git /usr/local/dotfiles/vimfiles`
   cd /usr/local/dotfiles/vimfiles
   ./install
```

And whenever you need to update:

```
  ./update
```

## Screenshots

**colorscheme: jellybean.vim**

[![jellybean theme](https://github.com/luan/vimfiles/raw/master/screenshots/hybrid.png)](https://github.com/luan/vimfiles/raw/master/screenshots/hybrid.png)
