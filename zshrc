# pure theme
autoload -U promptinit && promptinit
prompt pure

# syntax highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# cli colors
export CLICOLOR=1

# Vi key binding
bindkey -v
KEYTIMEOUT=1

# Vim as a default editor
export EDITOR=nvim
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

## aliases
source $HOME/dotfiles/scripts/aliases.sh

# EXPORT
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:~/dotfiles

# composer
export PATH=~/.composer/vendor/bin:$PATH

export TERM=xterm-256color-italic

alias ssh='TERM=xterm-256color ssh'
alias vssh='TERM=xterm-256color vssh'

# ANDROID PATH
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
#export ANT_HOME=/Users/rodri/Android/apache-ant-1.9.6
#export PATH=${PATH}:/Users/rodri/Android/android-sdk-macosx/tools/:/users/rodri/Development/android-sdk-macosx/platforms:${ANT_HOME}/bin

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH=$HOME/flutter/bin:$PATH

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
