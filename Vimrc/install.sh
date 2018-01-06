#!/bin/bash

autoload='/home/theippo1000/.vim/autoload'
bundle='/home/theippo1000/.vim/bundle'
clone='git clone'

createFolders()
{
    mkdir -p $autoload && \
    mkdir -p $bundle
}

InstallAllTheThings()
{
    # Pathogen
    curl -LSso $autoload/pathogen.vim https://tpo.pe/pathogen.vim
	
    # NERDtree
    $clone https://github.com/scrooloose/nerdtree.git $bundle/nerdtree
    
    # Supertab
    $clone https://github.com/ervandew/supertab.git $bundle/supertab

    # Statusline
    $clone https://github.com/vim-airline/vim-airline $bundle/vim-airline

    # Neocomplete
    $clone https://github.com/Shougo/neocomplete.vim.git
    
    # Syntastic
    $clone https://github.com/vim-syntastic/syntastic.git
    
    # IndentLine
    $clone https://github.com/Yggdroot/indentLine.git

    # LaTeX
    $clone https://github.com/ying17zi/vim-live-latex-preview.git $bundle/vim-live-latex-preview
}

main()
{	
    createFolders
    InstallAllTheThings
}

main
