#!/bin/bash

set -e

currentPath=$(pwd)
home="/home/$USER"

main()
{
    echo "Hello there!"
   
    choice=""

    read -p "Do you wish to create symbolic links instead of copying the files from the repository? [y/n] " yn

    case "$yn" in
        [Yy]* ) choice=sym;;
        [Nn]* ) choice=cpy;;
        * ) echo "Please answer yes or no.";;
    esac

    # calling all functions
    bashrc
    termite
    vimrc

    echo "Done"
}

bashrc()
{
    rm $home/.bashrc
    
    case $1 in
        [sym]* ) choice="sym"; echo "bashrc is sym";;
        [cpy]* ) choice="cpy"; echo "bashrc is cpy";;
    esac

    if [ $choice = "sym" ]; then
        ln -s $currentPath/Bashrc/bashrc $home/.bashrc
        echo "bashrc sym"
    elif [ $choice = "cpy" ]; then
        cp $currentPath/Bashrc/bashrc $home/.bashrc
        echo "bashrc cpy"
    fi   
}

termite()
{
    if [ -d "$home/.config/termite" ]; then
        rm -r $home/.config/termite/
        echo "Remove config"
    else
        mkdir -p $home/.config/termite
        echo "makin termite"
    fi

    case $1 in
        [sym]* ) choice="sym"; echo "choice is sym";; 
        [cpy]* ) choice="cpy"; echo "choice is cpy";; 
    esac

    if [ $choice = "sym" ]; then
        ln -s $currentPath/Termite/config $home/.config/termite/config
        echo "termite sym"
    elif [ $choice = "cpy" ]; then
        cp $currentPath/Termite/config $home/.config/termite/config
        echo "temite cpy"
    fi  
}

vimrc()
{
    if [ "$home/.vimrc" ]; then
        rm $home/.vimrc
        echo "remove vimrc"
    fi

    case $1 in
        [sym]* ) choice="sym"; echo "vimrc is sym";;
        [cpy]* ) choice="cpy"; echo "vimrc is cpy";;
    esac

    if [ $choice = "sym" ]; then
        ln -s $currentPath/Vimrc/vimrc $home/.vimrc
        echo "vimrc sym" 
    elif [ $choice = "cpy" ]; then
        cp $currentPath/Vimrc/vimrc $home/.vimrc
        echo "vimrc cpy"
    fi   
}

main
