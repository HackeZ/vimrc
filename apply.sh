#!/bin/bash

replace() {
    if [[ -f ${2} ]]; then
        mv ${2} ${2}.bak
    fi
    if [[ -d ${1} ]]; then
    	cp -r ${1} ${2}
    else
    	cp ${1} ${2}
    fi
}

replace_vim() {
    # replace vimrc
    replace ./vim/.vimrc ~/.vimrc
    
    # replace coc setting
    mkdir -p ~/.vim
    replace ./vim/coc-config.vim ~/.vim/coc-config.vim
    replace ./vim/coc-settings.json ~/.vim/coc-settings.json
    
    # replace coc setting for neovim if installed
    if nvim -v &> /dev/null
    then
            replace ./vim/coc-settings.json ~/.config/nvim/coc-settings.json
    else
            echo 'no neovim found, please install it and run me again.'
    fi
}

replace_nvim() {
    # replace init.lua
    replace ./neovim ~/.config/nvim
}

if [[ -z $1 ]]; then
    echo 'no editor specificed:'
    echo 'usage: sh apple.sh ${EDITOR}'
    exit 1
fi

case $1 in
    vim)
	replace_vim
	;;

    *)
	replace_nvim
	;;
esac

if [[ $? == 0 ]]; then
    echo "done"
fi
