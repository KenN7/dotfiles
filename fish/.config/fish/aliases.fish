#fish aliases

alias st="git status"
alias com="git commit"
alias pus="git push"
alias pul="git pull"
alias cmakevim="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
alias cp='cp -r'
alias vi='nvim'
alias vim="nvim"
alias vd='vimdiff'
alias logall='git log --pretty=oneline --abbrev-commit --graph'
alias restart_plasma='kquitapp5 plasmashell; and kstart5 plasmashell'
alias fix_kwin='kwin_x11 --replace'


## Useful aliases
# Replace ls with exa
if status --is-interactive; and type -q exa
    alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
    alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
    alias ll='exa -l --color=always --group-directories-first --icons'  # long format
    alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
    alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles
end

# Replace some more things with better alternatives
if status --is-interactive; and type -q bat
    alias fat='bat --style header --style snip --style changes --style header'
    alias cat='bat --style header --style snip --style changes --style header --paging never'
end
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/update'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages


# Get fastest mirrors 
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist" 
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist" 
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist" 
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist" 

# Help people new to Arch
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

