# pure theme
# autoload -U promptinit && promptinit
# prompt pure

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# italic
tic $HOME/dotfiles/xterm-256color-italic.terminfo

# syntax highlight
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# homebrew (m1)
# export PATH=~/opt/homebrew/bin:$PATH

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

#anaconda
export PATH="$PATH":"/anaconda3/bin"

# avr
export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"

# php 7.2
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


# ruby
# export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH=`gem environment gemdir`/bin:$PATH

export PATH="/usr/local/opt/openjdk/bin:$PATH"

export PATH="/opt/homebrew/bin:$PATH"

intelephenseLicence=$(cat /Users/gauzman/intelephense/license.txt)
export INTELEPHENSE_LICENSE_KEY="$intelephenseLicence"

# pm2
#sudo env PATH=$PATH:/opt/homebrew/Cellar/node@16/16.13.2/bin /opt/homebrew/lib/node_modules/pm2/bin/pm2 startup launchd -u gauzman --hp /Users/gauzman

# nvm
eval "$(fnm env --use-on-cd)"
# source $(brew --prefix nvm)/nvm.sh

setup-tracts() {
    fnm use system
    fnm uninstall 18
    fnm install 18
    fnm use 18
    rm -rf node_modules
    yarn cache clean
    yarn install
}

# export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
# export PUPPETEER_EXECUTABLE_PATH=`which chromium`
 export PUPPETEER_EXECUTABLE_PATH="/Applications/Firefox.app/Contents/MacOS/firefox"

#wezterm
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH

# lazygit
export XDG_CONFIG_HOME="$HOME/.config"
