if status --is-login
  set PATH $PATH /usr/bin /sbin /usr/sbin

  # perl (e.g. pod2man)
  set PATH /usr/bin/core_perl $PATH

  set PATH $HOME/Projects/OS/cross/bin $PATH
  set PATH $HOME/Projects/git/contrib/workdir $PATH
  set PATH $HOME/bin $PATH

  set EDITOR vim
end

# Keychain
set -gx HOSTNAME (hostname)
if status --is-interactive;
  keychain --quiet --nogui ~/.ssh/id_rsa
  [ -e $HOME/.keychain/$HOSTNAME-fish ]; and . $HOME/.keychain/$HOSTNAME-fish
end

alias mv="mv -i"
alias cp="cp -i"
alias tmux="tmux -2"
