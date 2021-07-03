@echo off
set PLUGVIMPATH=%HOMEPATH%\vimfiles\autoload\plug.vim
echo %PLUGVIMPATH%
curl -fLo %PLUGVIMPATH% --ssl-no-revoke --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
copy .vimrc %HOMEPATH%\_vimrc
copy .ctags %HOMEPATH%
copy .gitconfig %HOMEPATH%
copy .clang-format %HOMEPATH%
copy .editorconfig %HOMEPATH%
vim "+PlugInstall --sync" +qa