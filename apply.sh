#!/bin/zsh

replace() {
        if [ -f ${2} ]; then
                mv ${2} ${2}.bak
        fi
        cp ${1} ${2}
}

# replace vimrc
replace .vimrc ~/.vimrc

# replace coc setting
mkdir -p ~/.vim
replace coc-config.vim ~/.vim/coc-config.vim
replace coc-settings.json ~/.vim/coc-settings.json

# replace coc setting for neovim if installed
if nvim -v &> /dev/null
then
        replace coc-settings.json ~/.config/nvim/coc-settings.json
fi

echo "done"
