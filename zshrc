# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="awesomepanda"

plugins=(git sublime bundler)

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

eval "$(rbenv init -)"
