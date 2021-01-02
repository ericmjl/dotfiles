. ./utils/homebrew_packages.sh

# Install homebrew packages that might not already be installed.
echo -e "\nInstalling packages from regular brew"
for pkg in "${BREW_PACKAGES[@]}"; do
    if ! brew list --formula | grep -q "^${pkg}\$";
    then
    echo "Installing $pkg"
    brew install "$pkg"
    fi
done
echo "Homebrew and favorites successfully installed, moving on..."
