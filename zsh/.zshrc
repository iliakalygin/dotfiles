# Environment variables
export QT_QPA_PLATFORM=wayland-egl
export ELM_DISPLAY=wl
export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_DISABLE_RDD_SANDBOX=1 
export XDG_CURRENT_DESKTOP=GNOME
export XDG_SESSION_TYPE=wayland
export GDK_BACKEND=wayland
export XDG_BACKEND=wlroots
export WLR_NO_HARDWARE_CURSORS=1

# Themeing stuff
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=24
export GTK_THEME=Adwaita-dark
export QT_QPA_PLATFORMTHEME=qt5ct


# set nvim as deafult
export EDITOR="nvim"
export VISUAL="nvim"

export PATH=~/.local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

# set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# download zinit, if its not in there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source /load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
#zinit light Aloxaf/fzf-tab

# Load emacs keybinds
bindkey -e

# Load completions
autoload -U compinit && compinit

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase # erase duplicates
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # remove case sensitivit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Aliases
alias ls='ls --color'
alias ll='lsd -l'
alias vim='nvim'
alias fastfetch='clear && fastfetch'
alias lswindows='bash /home/void/git/dotfiles/scripts/listallwindows.sh'

# CP
alias cpsh='cd "$(bash /home/void/git/dotfiles/scripts/cpsh.sh)"'
alias rsol='g++ sol.cpp -o sol && ./sol'

# Git Aliases
alias gs='git status --short'
alias ga='git add'
alias gc='git commit'
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n'"
alias timeshift="sudo -E timeshift-gtk"

# Void
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
#alias reboot="pkill cryptomator-cli && loginctl reboot"
alias reboot="loginctl reboot"
#alias poweroff="pkill cryptomator-cli && loginctl poweroff"
alias poweroff="loginctl poweroff"

# cm aliases
alias myworkv="cryptomator-cli unlock /home/void/Dropbox/MyWorkV --mounter=org.cryptomator.frontend.fuse.mount.LinuxFuseMountProvider --mountPoint=/mnt/MyWorkV --password:stdin"

# Shell integrations
eval "$(fzf --zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2025-05-10 20:06:04
export PATH="$PATH:~/.local/bin"

export PATH=$PATH:/usr/local/go/bin

eval "$(starship init zsh)"

export GPG_TTY=$(tty)

# automatically start sway after login
#if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
#    exec dbus-run-session sway
#fi
