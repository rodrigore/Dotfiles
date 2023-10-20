eval (/opt/homebrew/bin/brew shellenv)
starship init fish | source # https://starship.rs/
zoxide init fish | source # 'ajeetdsouza/zoxide'

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux EDITOR nvim
set -Ux VISUAL nvim

# intelephense
export INTELEPHENSE_LICENSE_KEY=$(cat /Users/gauzman/intelephense/license.txt)

# fnm
/opt/homebrew/bin/fnm --log-level quiet env --use-on-cd | source

# wezterm path
set -x PATH $PATH /Applications/WezTerm.app/Contents/MacOS
export PATH

# ~/.tmux/plugins
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
