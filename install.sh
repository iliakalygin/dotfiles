sudo pacman -S kitty zsh wofi waybar nvim

git clone https://github.com/iliakalygin/dotfiles.git ~/git/dotfiles

ln -s ~/git/dotfiles/kitty ~/.config/kitty
ln -s ~/git/dotfiles/sway ~/.config/sway
ln -s ~/git/dotfiles/zsh ~/.config/zsh
ln -s ~/git/dotfiles/wofi ~/.config/wofi
ln -s ~/git/dotfiles/waybar ~/.config/waybar
ln -s ~/git/dotfiles/nvim ~/.config/nvim
