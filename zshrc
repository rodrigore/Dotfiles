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
plugins=(git vi-mode zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Vi key binding
bindkey -v
KEYTIMEOUT=1

# Vim as a default editor
export EDITOR=vim

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin

## aliases

# Show-Hide hidden files in Finder
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

# Show-Hide Desktop element
alias hidedesktop="defaults write com.apple.finder CreateDesktop FALSE && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop TRUE && killall Finder"

# 256 color and special chars(work nice with powerline chars)
alias tmux="TERM=screen-256color tmux -u2"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# vimR
alias vimr="open -a vimr.app $*"

# Love 2d
alias love="/Applications/love.app/Contents/MacOS/love"

# ReRun last command with sudo
alias please='sudo $(fc -ln -1)'

# Homestead
alias vm='ssh vagrant@127.0.0.1 -p 2222'

# Theme shell
# BASE16_SCHEME="railscasts"
# BASE16_SCHEME="ocean"
# BASE16_SHELL="$HOME/dotfiles/base16-shell/base16-$BASE16_SCHEME.dark.sh"
# source $BASE16_SHELL
# [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
#
