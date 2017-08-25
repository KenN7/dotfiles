. ~/.bash_aliases

set -x EDITOR vim
if status --is-interactive
  keychain --eval --quiet -Q id_rsa | source
end
