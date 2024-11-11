function install() {
    echo "Installation started: $1"
    sudo pacman -Sy --needed "$1"
    echo "Installation finished: $1"
}

