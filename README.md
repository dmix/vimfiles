# vim

### Directory Structure:

* `vimrc` contains vim-specific settings, it also handles loading the config files mentioned below
* `plugins.vim` a list of plugins manged by [vim-plug](https://github.com/junegunn/vim-plug)
* `config/*` settings for various 3rd-party plugins, colorscheme, and keybindings

### Install script

1. Pulls the latest vimfiles repo and fetches git submodules
2. Installs various Go dependencies (for ex: go-fmt) needed by [vim-go](https://github.com/fatih/vim-go)
2. Runs `:PlugInstall` to installs the plugins listed in [plugins.vim](https://github.com/dmix/vimfiles/blob/master/plugins.vim)
3. Finally, it compiles [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

### Installing (via homemaker)

I use [Homemaker](https://github.com/FooSoft/homemaker) for dotfiles management. Homemaker is similar to [homesick](https://github.com/search?utf8=%E2%9C%93&q=homesick&type=Repositories&ref=searchresults) but much simpler and cleaner (and written in Go). See [homemaker.toml](https://github.com/dmix/dotfiles/blob/master/homemaker.toml) in my [dotfiles repo](https://github.com/dmix/dotfiles/).

An example homemaker task for install vimfiles:

``` toml
    [tasks.vim]
        cmds = [
            ["rm", "-rf", "${HM_SRC}/vimfiles"],
            ["git", "clone", "git@github.com:dmix/vimfiles.git", "${HM_SRC}/vimfiles"],
            ["bash", "${HM_SRC}/vimfiles/install.sh"],
        ]
        links = [
            [".vimrc", "vimfiles/vimrc"],
            [".vim", "vimfiles"],
        ]
```

When `homemaker` is run it clones the vimfiles repo then runs the [install](https://github.com/dmix/vimfiles/blob/master/install) script.

*Note*: Homemaker could also do everything in the vimfiles install script but I like to keep my vim repo self-contained, which makes it more portable (for example: setting up vim on servers where I don't need my desktop dotfiles).

### Installing (via standalone script)

``` sh
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
