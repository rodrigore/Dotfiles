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

# neovim
alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

#
alias nyancat='telnet nyancat.dakko.us'

