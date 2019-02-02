#README
## TODO
* Add neovim config steps: add following in `~/.config/nvim/init.vim`

```vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
 
* add base16 config steps: clone following in `~/.config/base16-shell`

```bash
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

* add following start text on iTerm2
```
tmux attach || tmux new -s blank
```
