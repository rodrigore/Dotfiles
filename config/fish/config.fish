eval (/opt/homebrew/bin/brew shellenv)
starship init fish | source # https://starship.rs/
zoxide init fish | source # 'ajeetdsouza/zoxide'

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings

set -Ux EDITOR nvim
set -Ux VISUAL nvim

# intelephense
#export INTELEPHENSE_LICENSE_KEY=$(cat /Users/gauzman/intelephense/license.txt)

# fnm
/opt/homebrew/bin/fnm --log-level quiet env --use-on-cd | source

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# wezterm path
set -x PATH $PATH /Applications/WezTerm.app/Contents/MacOS
export PATH

# bin folders
fish_add_path $HOME/dotfiles/bin

# homebrew
set -x PATH /opt/homebrew/bin $PATH

# theme
source ~/.local/share/nvim/lazy/nightfox.nvim/extra/duskfox/duskfox.fish

# atuin
if status --is-interactive
    atuin init fish | source
end

# google cloud sdk
source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"

# laravel herd
fish_add_path -U $HOME/Library/Application\ Support/Herd/bin/

# set openai(chatgpt) env variable
#set -Ux  "OPENAI_API_KEY" ""

# poetry
fish_add_path ~/Library/Application\ Support/pypoetry/venv/bin/
