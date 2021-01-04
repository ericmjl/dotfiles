# Setting the PATH environment variable exactly as I want it
echo "Original PATH"
echo $PATH
echo "Linking to home folder binaries."
export PATH="$HOME/bin:$PATH"

echo "Adding /usr/local/bin to PATH"
export PATH="$PATH:/usr/local/bin"

# Linux-specific things.
case "$OSTYPE" in
  linux*)
    # Linuxbrew stuff must take 2nd fiddle to conda,
    # so we add this first, then add conda paths.
    echo "Adding linuxbrew to PATH"
    export PATH=$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
esac

# Enable conda
echo "Adding conda to PATH"
source $HOME/anaconda/etc/profile.d/conda.sh
conda activate

# Finally, echo the state of the PATH environment variable.
echo "State of PATH environment variable:"
echo $PATH
