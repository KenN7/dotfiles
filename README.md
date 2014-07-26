My Dotfiles

to restore the dotfiles: use gnu/stow

to get my pkglist: yaourt -Qeq > pkg.list
to restore it: yaourt -S --needed $(< pkg.list)
