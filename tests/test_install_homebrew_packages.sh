source ./utils/homebrew_packages.sh

alias gnu-sed="sed"
alias mobile-shell="mosh"
alias ripgrep="rg"

echo -e "\nInstalling packages from regular brew"
for PKG in "${BREW_PACKAGES[@]}"; do
    type $PKG || (echo "$PKG not found" && return 1)
done
echo "Hooray! Homebrew favourite packages installed!"
