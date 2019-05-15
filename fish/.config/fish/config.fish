. ~/.bash_aliases

set -x EDITOR vim
if status --is-interactive
  keychain --eval --quiet -Q id_rsa | source
end

eval (thefuck --alias | tr '
' ';')

set PATH /home/ken/dotfiles/scripts /home/ken/.local/bin $PATH
source /home/ken/.config/fish/aliases.fish
