sudo xbps-install -Suyv void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
sudo xbps-install -Suyv $(cat packages.txt)

flatpak install -y flathub $(cat flatpaks.txt)

curl -fsSL https://herdr.dev/install.sh | sh


ln -s ~/git/dotfiles/kitty ~/.config
ln -s ~/git/dotfiles/sway ~/.config
#ln -s ~/git/dotfiles/wofi ~/.config
#ln -s ~/git/dotfiles/waybar ~/.config
ln -s ~/git/dotfiles/nvim ~/.config
ln -s ~/git/dotfiles/zsh/.zshrc ~/.zshrc
#ln -s ~/git/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -s ~/git/dotfiles/git ~/.config
ln -s ~/git/dotfiles/fastfetch ~/.config
#ln -s ~/git/dotfiles/tmux ~/.config
ln -s ~/git/dotfiles/gtk-3.0 ~/.config
ln -s ~/git/dotfiles/gtk-4.0 ~/.config
ln -s ~/git/dotfiles/xresources/.Xresources ~/.Xresources
ln -s ~/git/dotfiles/herdr/ ~/.config
ln -s ~/git/dotfiles/yazi/ ~/.config
