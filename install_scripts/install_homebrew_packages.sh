. ./utils/homebrew_packages.sh

type brew
if [ $? != 0 ]; then
    export OLDPATH=$PATH
    export ORIGINALLY_NO_BREW="true"
    echo "Setting path to include Linuxbrew temporarily."
    export PATH=$HOME/.linuxbrew/bin:$PATH
fi
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

# Set path back to original brew.
if [ $ORIGINALLY_NO_BREW == "true" ]; then
    export PATH=$PATH
fi
