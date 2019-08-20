. ~/.bash_aliases

set -x EDITOR vim
if status --is-interactive; and type -q keychain
  keychain --eval --quiet -Q id_rsa | source
end

if type -q thefuck
eval (thefuck --alias | tr '
' ';')
end

set PATH /home/ken/dotfiles/scripts /home/ken/.local/bin $PATH
source /home/ken/.config/fish/aliases.fish
