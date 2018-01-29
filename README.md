My Dotfiles

to restore the dotfiles: use gnu/stow

to get my pkglist: yaourt -Qetq > pkg.list
to restore it: yaourt -S --needed $(< pkg.list)
