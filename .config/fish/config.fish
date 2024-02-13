if test -z (pgrep ssh-agent | string collect)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

if status is-interactive
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

# NPM
set PATH $HOME/node_modules/.bin $PATH

# CMake
set -Ux CTEST_PARALLEL_LEVEL 56
set -Ux CTEST_OUTPUT_ON_FAILURE 1

set LD_LIBRARY_PATH /usr/local/cuda-11.8/lib64 $LD_LIBRARY_PATH
set PATH /usr/local/cuda-11.8/bin $PATH
set PATH $HOME/.local/bin $PATH
set PATH $HOME/.cargo/bin $PATH

alias ls="ls --color"
alias mv="mv -i"
alias cp="cp -i"
alias tmux="tmux -2"
alias fim="env FBFONT=/usr/share/kbd/consolefonts/ter-216n.psf.gz fim"
alias proveall="prove -j56 --state=slow,save -lr t"
