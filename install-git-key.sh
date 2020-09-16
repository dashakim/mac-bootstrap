#!/bin/bash

function git_set_key () {
    read -p "Enter github email: " email
    echo "Using email $email"
    if [ ! -f ~/.ssh/id_rsa ]; then
      ssh-keygen -t rsa -b 4096 -C "$email"
      ssh-add ~/.ssh/id_rsa
    fi
    pub=`cat ~/.ssh/id_rsa.pub`

    read -p "Enter github username: " githubuser
    echo "Using username $githubuser"
    read -s -p "Enter github password for user $githubuser: " githubpass
    echo
    read -p "Enter github OTP: " otp
    echo
    confirm
    curl -u "$githubuser:$githubpass" -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" --header "x-github-otp: $otp" https://api.github.com/user/keys

    githubemail="$githubuser@users.noreply.github.com"
    echo "Using $githubemail as email for git config"
    git config --global user.email "$email"
    read -p "Enter github name in for git config: " githubname
    git config --global user.name "$githubname"
}

function git_set_default_config () {
    cp ./.gitconfig ~/.gitconfig
    cp ./gitignore_global ~/gitignore_global
}

function git_set_aliases () {
    git config --global alias.zzz zzz
}

git_set_default_config
git_set_key
