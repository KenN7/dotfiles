. ~/.bash_aliases

set -x EDITOR vim
if status --is-interactive
  keychain --eval -Q id_rsa | source
end
