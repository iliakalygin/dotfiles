# Environment variables
export QT_QPA_PLATFORM=wayland-egl
export ELM_DISPLAY=wl
export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_DISABLE_RDD_SANDBOX=1
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export GDK_BACKEND=wayland
export XDG_BACKEND=wlroots
export WLR_NO_HARDWARE_CURSORS=1
export VDPAU_DRIVER=va_gl
export LIBVA_DRIVER_NAME=radeonsi

# Themeing stuff
export XCURSOR_THEME=Bibata-Modern-Classic
export XCURSOR_SIZE=24
#export GTK_THEME=Adwaita-dark
unset GTK_THEME
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=Adwaita-dark

# set nvim as default
export EDITOR="nvim"
export VISUAL="nvim"

export PATH="$HOME/.local/bin:$PATH"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
# zsh-syntax-highlighting must be last
plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# Load emacs keybinds
bindkey -e

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
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Aliases
alias ls='ls --color'
alias ll='lsd -l'
alias vim='nvim'
alias fastfetch='clear && fastfetch'
alias lswindows='bash /home/void/git/dotfiles/scripts/listallwindows.sh'

# Git Aliases
alias gs='git status --short'
alias ga='git add'
alias gc='git commit'
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(auto)  %D%n%s%n'"
alias timeshift="sudo -E GTK_THEME=adw-gtk3-dark timeshift-gtk"

# Void
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias reboot="pkill cryptomator-cli && loginctl reboot"
alias poweroff="pkill cryptomator-cli && loginctl poweroff"

# cm aliases
alias myworkv="cryptomator-cli unlock /home/void/Nextcloud/MyWorkV --mounter=org.cryptomator.frontend.fuse.mount.LinuxFuseMountProvider --mountPoint=/mnt/MyWorkV --password:stdin"

# Shell integrations
eval "$(fzf --zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#eval "$(starship init zsh)"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/go/bin"

export GPG_TTY=$(tty)

# automatically start sway after login
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec dbus-run-session sway
fi

if [[ $- == *i* ]]; then
    fastfetch
fi

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=(~/.grok/completions/zsh $fpath)
autoload -Uz compinit && compinit -C
# <<< grok installer <<<
