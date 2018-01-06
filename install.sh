#!/bin/bash

set -e

currentPath=$(pwd)
home="/home/$USER"

main()
{
    echo "Hello there!"
   
    choice=""

    read -p "Do you wish to create symbolic links instead of copying the files from the repository? [y/n]" yn

    case $yn in
        [Yy]* ) choice=sym; break;;
        [Nn]* ) choice=cpy; break;;
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
    if [$home/.bashrc]; then
        rm $home/.bashrc
    fi
    
    case $1 in
        [sym]* ) choice=sym; break;;
        [cpy]* ) choice=cpy; break;;
    esac

     if [$1 == sym]; then
        ln -s $currentPath/bashrc $home/.bashrc
    elif [$1 == cpy]; then
        cp $currentPath/Bashrc/bashrc $home/.bashrc
    fi   
}

termite()
{
    if [$home/.config/termite]; then
        rm $home/.config/termite/config
    else
        mkdir .config/termite
    fi

    case $1 in
        [sym]* ) choice=sym; break;;
        [cpy]* ) choice=cpy; break;;
    esac

     if [$1 == sym]; then
        ln -s $currentPath/Termite/config $home/.config/termite/config
    elif [$1 == cpy]; then
        cp $currentPath/Termite/config $home/.config/termite/config
    fi   
}

vimrc()
{
    if [$home/.vimrc]; then
        rm $home/.vimrc
    fi

    case $1 in
        [sym]* ) choice=sym; break;;
        [cpy]* ) choice=cpy; break;;
    esac

     if [$1 == sym]; then
        ln -s $currentPath/Vimrc/vimrc $home/.vimrc
    elif [$1 == cpy]; then
        cp $currentPath/Vimrc/vimrc $home/.vimrc
    fi   
}

main
