
echo "stated symlinks..."
# symlink .zshrc
ln -f -s "$PWD/.zshrc" $HOME/.zshrc

# creating .config folder
mkdir -p $HOME/.config

# symlink i3status config
ln -f -s "$PWD/i3status/" $HOME/.config/

# symlink i3 config
ln -f -s "$PWD/i3/" $HOME/.config/

# symlink nvim config
ln -f -s "$PWD/nvim/" $HOME/.config/

# symlink kmonad config
ln -f -s "$PWD/kmonad/" $HOME/.config/

# symlink alacritty config
ln -f -s "$PWD/alacritty/" $HOME/.config/

# symlink ghostty config
ln -f -s "$PWD/ghostty/" $HOME/.config/

# symlink nvim config
ln -f -s "$PWD/.tmux.conf" $HOME/.tmux.conf

echo "finished symlinks"

