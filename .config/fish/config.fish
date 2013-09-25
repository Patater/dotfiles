if status --is-login
  set PATH $PATH /usr/bin /sbin /usr/sbin
end

set EDITOR vim

# Keychain
set -gx HOSTNAME (hostname)
if status --is-interactive;
  keychain --quiet --nogui --clear ~/.ssh/id_rsa
  [ -e $HOME/.keychain/$HOSTNAME-fish ]; and . $HOME/.keychain/$HOSTNAME-fish
end
