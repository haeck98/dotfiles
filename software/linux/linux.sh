if [[ ! -z $(command -v pacman) ]] ; then
	echo "Installing for Arch Linux"

	bash "$(dirname $0)/arch.sh"
else
	echo "Can't determine package manager to use..."
fi
