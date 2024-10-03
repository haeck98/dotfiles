
echo "stated symlinks..."
# symlink .zshrc
ln -f -s "$PWD/.zshrc" $HOME/.zshrc

# creating .config folder
mkdir -p $HOME/.config

# symlink nvim config
ln -f -s "$PWD/nvim/" $HOME/.config/

# symlink nvim config
ln -f -s "$PWD/alacritty/" $HOME/.config/

echo "finished symlinks"

