sudo pacman -S kitty zsh wofi waybar nvim

mv ~/.config/sway ~/.config/sway.bak

 
mkdir -p ~/.config/kitty
mkdir -p ~/.config/sway
mkdir -p ~/.config/zsh
mkdir -p ~/.config/wofi
mkdir -p ~/.config/waybar
mkdir -p ~/.config/nvim

ln -s ~/git/dotfiles/kitty ~/.config/kitty
ln -s ~/git/dotfiles/sway ~/.config/sway
ln -s ~/git/dotfiles/zsh ~/.config/zsh
ln -s ~/git/dotfiles/wofi ~/.config/wofi
ln -s ~/git/dotfiles/waybar ~/.config/waybar
ln -s ~/git/dotfiles/nvim ~/.config/nvim
