# Enviroment Config

This is a project created to save configuration of my developed enviroment. I've included tools like:

- Nvim: Text editor
- Karabiner: Control screens
- StarShip: Edit terminal interface
- Tmux: Navigate terminal interfaces

I also included some system config files, where enviromental variables are declared to make this all configuration work.

## How is it work?

To include this config in your system first is necessary to install the tools, and after move all config files to the folder ~/.config.

### Install tools

#### NeoVim Mac install

webpage: https://github.com/neovim/neovim/blob/master/INSTALL.md

```
brew install neovim
```

### Karabiner Mac install

webpage: https://karabiner-elements.pqrs.org/

```
brew install --cask karabiner-elements
```

### StarShip Mac Install

webpage: https://github.com/starship/starship
```
brew install starship
```

### Tmux Mac Install

webpage: https://github.com/tmux/tmux/wiki

```
brew install tmux
```

### Set Up Enviroment

To set up enviroment, it is necessary to clone this repository in the folder .config of the system.

```
git clone https://github.com/jvilchesf/dotfiles.git ~/.config
```

It is also necessary to be aware of the .zshrc and .zshenv config.

- .zshrc: Contains variable settings to run nvim, WezTerm, StarShip, syntax Highlight, autosuggestion, etc... 
- .zsshenv: Contains enviromental variables for tmux to recognize Nord theme settings.
