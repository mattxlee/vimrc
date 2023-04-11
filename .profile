. "$HOME/.cargo/env"

alias l='ls -FG'
alias ll='ls -F -lh'
alias python2='/usr/bin/python'
alias tmux='TERM=xterm-256color tmux'

export EDITOR=vi
export SVN_EDITOR=vi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export ALL_PROXY=http://127.0.0.1:8080
export HTTP_PROXY=http://127.0.0.1:8080
export HTTPS_PROXY=http://127.0.0.1:8080

export LDFLAGS="-L/usr/local/opt/qt@5/lib"
export CPPFLAGS="-I/usr/local/opt/qt@5/include"

export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
