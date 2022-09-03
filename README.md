# Install under Linux/macOS

```bash
curl -s -L https://raw.githubusercontent.com/mattxlee/vimrc/main/install.sh | bash
```

# Install under Windows

1. Install plugin manager (under powershell)

```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

2. Clone repo to local dir

```
git clone https://github.com/mattxlee/vimrc
```

3. Copy vim config script

```
copy vimrc\.vimrc _vimrc
```

4. Launch vim and download plugins

```
vim +PlugInstall
```
