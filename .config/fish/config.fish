if status --is-login
  set PATH $PATH /usr/bin /sbin /usr/sbin
end

set EDITOR vim

# Keychain
set -gx HOSTNAME (hostname)
if status --is-interactive;
  keychain --quiet --nogui ~/.ssh/id_rsa
  [ -e $HOME/.keychain/$HOSTNAME-fish ]; and . $HOME/.keychain/$HOSTNAME-fish
end

alias mv="mv -i"
alias tmux="tmux -2"
