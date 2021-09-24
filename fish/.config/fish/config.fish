#!/usr/bin/fish

# settings specific to some platforms
if test -e $HOME/.config/fish/local.fish
    source $HOME/.config/fish/local.fish
end

set -x EDITOR nvim
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

## Starship prompt
if status --is-interactive
   # source ("/usr/bin/starship" init fish --print-full-init | psub)
end

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

function backup --argument filename
    cp $filename $filename.bak
end


