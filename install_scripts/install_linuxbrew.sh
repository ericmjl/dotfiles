# Install Homebrew
echo "Checking to see if Homebrew is installed."

which brew
if [[ $? != 0 ]]; then # if exit code is not zero --> brew not installed.
    echo "Homebrew is not installed; instaling now..."
    git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
    mkdir ~/.linuxbrew/bin
    ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
    eval $(~/.linuxbrew/bin/brew shellenv)
fi
echo "Homebrew installed. moving on..."
