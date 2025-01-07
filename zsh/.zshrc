# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cal/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz promptinit
promptinit

# Created by `pipx` on 2024-12-12 19:41:21
export PATH="$PATH:/home/cal/.local/bin"

alias cd='z'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lock='hyprlock'
alias mnt-win='sudo ntfs-3g -o windows_names /dev/nvme0n1p3 /mnt/c'
alias shutdown='shutdown now'
alias logout='hyprctl dispatch exit'
alias eww-test='$HOME/eww/target/release/eww -c ~/.config/eww_test'
alias eww='$HOME/eww/target/release/eww'
alias fetch='hyfetch --distro arch_small --args="-c $HOME/.config/fastfetch/mini.jsonc"'

# autoload -Uz promptinit
# promptinit
# prompt adam1

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"
