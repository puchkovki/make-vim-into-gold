# Oh-my-zsh and others

- Install packages. In case of an error try `sudo apt update -y; sudo apt upgrade -y `.
```
sudo apt install zsh python3 git curl tmux pip3
```
- Install [Oh-my-zsh](https://ohmyz.sh/).
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
- Add plugin [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md). It suggests commands as you type based on history and completions.
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
- Add plugin [alias-tips](https://github.com/djui/alias-tips). It helps remembering those shell aliases and Git aliases you once defined.
```
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM1:-$ZSH/custom}/plugins/alias-tips
```
- Add plugin [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md). This package provides syntax highlighting for the shell zsh.
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
- Replace your `.zshrc` file with uploaded one: draw your attention and write correct directory with `oh-my-zsh` installed (line 5, 75); on the line 119 write correct path to the directory with `zsh` installed (you may find it with `which zsh` command).
- Update `misc.zsh`.
```
mkdir $ZSH_CUSTOM/lib 
cp $ZSH/lib/misc.zsh $ZSH_CUSTOM/lib
vi $ZSH_CUSTOM/lib/misc.zsh
```
Comment from 3-rd to 16-th lines or replace file with the uploaded one.
- Install [Vundle](https://github.com/VundleVim/Vundle.vim).
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
- Replace `.vimrc` with the uploaded one.
- Install `vim` plugins.

[//]: # (Launch `vim` and run `:PluginInstall`)
```
vim +PluginInstall +qall
```
- Install [TPM](https://github.com/tmux-plugins/tpm).
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
- Replace your `.tmux.conf` file with uploaded `tmux.conf`. 
- - If you are arleady in `tmux`
```
tmux source ~/.tmux.conf
```
- - `Ctrl+b` command will be replaced by `prefix` button. Tap `prefix` + `I` to install package.

**Usefull buttons**: to make horisontal tab: `prefix` + `|`, vertical tab — `prefix`+`-`, swap between tabs — `prefix` + arrows; new window — `prefix` + `c`, swap between windows — `prefix` + `n` (next one), `prefix` + `p` (previous one).

After all tranformations reboot your device.

# Firacode and ligatures in VS Code

Also really comfortable to use `Fira Code` as Font weight and add ligatures as [here](https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions).

In Linux Ubuntu:
- Install `Fira Code`
```
sudo apt install fonts-firacode
```
- Add new font weight and ligatures to the VS Code. Press `Shift+Ctrl+P` and input `settings.json`. Replace the row with `font weight` by
```
"editor.fontFamily": "Fira Code",
"editor.fontLigatures": true,
```
- Reload your VS Code.
