source ./utils/homebrew_packages.sh

echo -e "\nInstalling packages from regular brew"
for PKG in "${BREW_PACKAGES[@]}"; do
    type $PKG || "$PKG not found" && return 1
done
echo "Homebrew and favorites successfully installed, moving on..."
