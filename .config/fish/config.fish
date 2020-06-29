if status --is-login
  set PATH $PATH /usr/bin /sbin /usr/sbin

  # perl (e.g. pod2man)
  set PATH /usr/bin/core_perl $PATH

  set PATH $HOME/Projects/OS/cross/bin $PATH
  set PATH $HOME/Projects/git/contrib/workdir $PATH
  set PATH $HOME/bin $PATH

  set VISUAL vim
  set EDITOR vim
  set BROWSER firefox
end

set PATH $HOME/.local/bin $PATH

alias mv="mv -i"
alias cp="cp -i"
alias tmux="tmux -2"
alias fim="env FBFONT=/usr/share/kbd/consolefonts/ter-216n.psf.gz fim"
