# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# The following lines were added by compinstall
zstyle :compinstall filename '/home/cal/.zshrc'

autoload -Uz compinit

fpath+=~/.config/zsh/func
compinit
# End of lines added by compinstall

autoload -Uz promptinit
promptinit

# pip zsh completion start
#compdef -P pip[0-9.]#
__pip() {
  compadd $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$((CURRENT-1)) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null )
}
if [[ $zsh_eval_context[-1] == loadautofunc ]]; then
  # autoload from fpath, call function directly
  __pip "$@"
else
  # eval/source/. command, register function for later
  compdef __pip -P 'pip[0-9.]#'
fi
# pip zsh completion end

# help function
autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
autoload -Uz run-help-git run-help-ip run-help-openssl run-help-p4 run-help-sudo run-help-svk run-help-svn
alias help=run-help

# reload completions on pacman update
TRAPUSR1() { 
  rehash 
}

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

alias cd='z'
alias ls='ls --color=auto --hyperlink=auto --group-directories-first --format=horizontal'
alias grep='grep --color=auto'
alias run='hyprctl dispatch exec'
alias lock='hyprlock'
alias mnt-win='sudo ntfs-3g -o windows_names /dev/nvme0n1p3 /mnt/c'
alias shutdown='shutdown now'
alias logout='hyprctl dispatch exit'

alias eww-test='$HOME/programs/eww/target/release/eww -c ~/.config/eww_test'
alias eww='$HOME/programs/eww/target/release/eww'

alias fetch='hyfetch --distro arch_small --args="-c $HOME/.config/fastfetch/mini.jsonc"'
alias vpn='windscribe-cli'
alias vlc='env -u DISPLAY vlc' # run vlc in wayland

alias bzmenu='bzmenu --launcher walker -i xdg'

alias music-dl='wl-copy -c && wl-paste -w yt-dlp -m -a -'

alias uni-copy='kitten unicode-input | wl-copy -n'

# not sure if this is a good idea on how to do this but it works for now
eval "$(eww shell-completions --shell zsh)"

autoload -Uz promptinit
promptinit

PROMPT='%n@%m %~ %F{white}%B%#%b%f '
RPROMPT='[%F{yellow}%?%f]'

# load starship if on tty1 (hyprland) or tty2 (sddm)
if [[ $XDG_VTNR -le 2 ]]; then
# Transient prompt for starship: https://github.com/starship/starship/issues/888#issuecomment-2246272386
eval "$(starship init zsh)"
fi

eval "$(zoxide init zsh)"
