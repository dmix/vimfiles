# vim

### Directory Structure:

`./vimrc` contains vim-specific settings and loads config files
`./plugins.vim` a list of plugins manged by [vim-plug](https://github.com/junegunn/vim-plug)
`./config/*` settings for various 3rd-party plugins, colorscheme, and keybindings

### Installing (homemaker)

Config files on my machine are managed using [Homemaker](https://github.com/FooSoft/homemaker) see `homemaker.toml` in my [dotfiles](https://github.com/dmix/dotfiles) repo. I set homemaker to clone the vimfiles repo and run the [install](https://github.com/dmix/vimfiles/blob/master/install) script (which installs go related packages and installs vim plugins).

Note regarding the install script: I could technically do everything in the install script using homemaker but I like to keep my vim repo self-contained, which makes it more portable (for example: setting up vim on servers where I don't need my desktop dotfiles).

### Installing (standalone)

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

[![jellybean theme](https://raw.githubusercontent.com/dmix/vimfiles/master/screenshots/jellybean-theme.png)](https://raw.githubusercontent.com/dmix/vimfiles/master/screenshots/jellybean-theme-large.png)
