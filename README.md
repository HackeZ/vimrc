# .vimrc

> recommended latest [neovim](https://github.com/neovim/neovim/)

Since neovim v0.5.0+ was released, native Lua support has become particularly attractive. So I have completely switched to the Neovim plugin library written by Lua, which is __completely unsupported in Vim__ .

If you still want to use the configuration of Vim or Neovim with no Lua supported, please use command: `sh apply.sh vim` instead.

## Install

### Prerequired

#### Neovim (v0.5.0+)

- [kristijanhusak/vim-packager](https://github.com/kristijanhusak/vim-packager#installation)
- Lua Runtime

#### Vim / Neovim (Lua not supported)

- [junegunn/vim-plug](https://github.com/junegunn/vim-plug#installation)
- [nodejs](https://nodejs.org/en/)

### Usage

#### Neovim (v0.5.0+)

```sh
$ sh apply.sh && nvim -E -c PackerInstall -c q
$ nvim -E -c PackerCompile -c q
```


#### Vim / Neovim (Lua not supported)

```sh
$ sh apply.sh vim && vim -E -c PlugInstall -c q
$ vim -E -c CocInstall coc-lists coc-snippets coc-translator -c q # optional
```

