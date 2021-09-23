#!/usr/bin/fish

# settings specific to some platforms
if test -e $HOME/.config/fish/local.fish
    source $HOME/.config/fish/local.fish
end

set -x EDITOR vim
if status --is-interactive; and type -q keychain
  keychain --eval --quiet -Q id_rsa | source
end

if type -q thefuck
eval (thefuck --alias | tr '
' ';')
end

set PATH $HOME/.cargo/bin $HOME/dotfiles/scripts $HOME/.local/bin $HOME/.npm/bin $HOME/.local/share/gem/ruby/3.0.0/bin $PATH
set NODE_PATH $HOME/.npm/lib/node_modules $NODE_PATH
source $HOME/.config/fish/aliases.fish
