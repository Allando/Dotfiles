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
}

main()
{	
	createFolders
	InstallAllTheThings
}

main
