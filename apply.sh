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
replace coc-setting.vim ~/.vim/coc-setting.vim
replace coc-setting.json ~/.vim/coc-settings.json

echo "done"
