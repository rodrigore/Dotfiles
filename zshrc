# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="avit"
#"robbyrussell" "soliah" "tjkirch" "kafeitu" "intheloop" "dpoggi" "fino" "gentoo" "cloud" "Soliah" "smt"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git vi-mode zsh-syntax-highlighting tmux)

source $ZSH/oh-my-zsh.sh

# Vi key binding
bindkey -v
KEYTIMEOUT=1

# Vim as a default editor
export EDITOR=vim

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin

## aliases
source $HOME/.aliases.sh

# Theme shell
# BASE16_SCHEME="railscasts"
# BASE16_SCHEME="ocean"
# BASE16_SHELL="$HOME/dotfiles/base16-shell/base16-$BASE16_SCHEME.dark.sh"
# source $BASE16_SHELL
# [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
#
