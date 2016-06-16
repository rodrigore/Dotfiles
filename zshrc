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
export EDITOR=vim

## aliases
source $HOME/dotfiles/scripts/aliases.sh

# EXPORT
export PATH=/usr/local/php5/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin

export TERM=xterm-256color-italic

# ANDROID PATH
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
#export ANT_HOME=/Users/rodri/Android/apache-ant-1.9.6
#export PATH=${PATH}:/Users/rodri/Android/android-sdk-macosx/tools/:/users/rodri/Development/android-sdk-macosx/platforms:${ANT_HOME}/bin

