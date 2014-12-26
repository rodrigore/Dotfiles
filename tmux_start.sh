#!/bin/sh
# taken from http://www.huyng.com/posts/productivity-boost-with-tmux-iterm2-workspaces/

export PATH=$PATH:/usr/local/bin

# abort if we're already inside a TMUX session
[ "$TMUX" == "" ] || exit 0

# startup a "default" session if none currently exists
tmux has-session -t default || tmux new-session -s default -d

# present menu for user to choose which workspace to open
PS3="Please choose your session: "
options=($(tmux list-sessions -F "#S") "NEW SESSION" "Vagrant" "Vida_Sana" "ZSH")
echo "Available sessions"
echo "------------------"
echo " "
select opt in "${options[@]}"
do
    case $opt in
        "NEW SESSION")
            read -p "Enter new session name: " SESSION_NAME
            tmux new -s "$SESSION_NAME"
            break;;
        "ens")
            tmux new -s "Vagrant"
            cd ~/ens-vagrant/
            tmux new-window -n "Vim" "vim"
            tmux new-window -n "Vagrant"
            tmux new-window -n "Git"
            tmux split-window -h
            break;;
        "Vida_Sana")
            tmux new -s "Vida_Sana"
            tmux new-window -n "Weechat" "weechat"
            tmux new-window -n "Vagrant" "cd ~/VagrantTest/ && vagrant up && vagrant ssh"
            tmux split-window -h -c ~/VagrantTest/vida_sana/ vim
            break;;
        "ZSH")
            zsh --login
            break;;
        *)
            tmux attach-session -t $opt
            break;;
    esac
done


