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

fpath+=~/.config/zsh/func
fpath+=~/programs/framework-system/completions/zsh

compinit
# End of lines added by compinstall

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
alias soft-reboot='systemctl soft-reboot'
alias logout='hyprctl dispatch exit'

alias eww='$HOME/programs/eww/target/release/eww'
alias eww-test='$HOME/programs/eww/target/release/eww -c ~/.config/eww_test'

alias fetch='hyfetch --distro arch_small --args="-c $HOME/.config/fastfetch/mini.jsonc"'
alias vpn='windscribe-cli'
alias vlc='env -u DISPLAY vlc' # run vlc in wayland

alias bzmenu='bzmenu --launcher walker -i xdg'

alias music-dl='wl-copy -c && wl-paste -w yt-dlp -m -a -'

alias uni-copy='kitten unicode-input | wl-copy -n'

alias colour-ls='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+"\n"}; done'

# not sure if this is a good idea on how to do this but it works for now
eval "$(eww shell-completions --shell zsh)"

autoload -Uz promptinit
promptinit

PROMPT='%n@%m %~ %F{white}%B%#%b%f '
RPROMPT='[%F{yellow}%?%f]'

# load starship if on tty1 (hyprland)
if [[ $XDG_VTNR -eq 1 ]]; then
# Transient prompt for starship: https://github.com/starship/starship/issues/888#issuecomment-2246272386
eval "$(starship init zsh)"
fi

# Load plugins

ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets)

# Define styles for zsh-syntax-highlighting
# default styles can be found at: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/highlighters/main/main-highlighter.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[command]='fg=183'
ZSH_HIGHLIGHT_STYLES[alias]='fg=213'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=177'
ZSH_HIGHLIGHT_STYLES[function]='fg=176'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=199'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=blue,underline'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=37'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=209'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=209'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=209'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh)"
