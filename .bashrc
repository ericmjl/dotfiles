export CLONE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# If zsh is installed but bash is still the default,
# then we go directly to zsh.
# Otherwise, loading of bash happens as per normal.
which zsh
if [[ $? == 0 ]]; then
    zsh
fi

# PATH variable.
echo "sourcing $CLONE_DIR/.path"
source $CLONE_DIR/.path

# Enable conda-auto-env
source $CLONE_DIR/conda_auto_env.sh

# Enable git-completion
source $HOME/.git-completion.bash

# Proxy addresses used for work. Checks to see if the "proxy" executable is present before sourcing it.
if [ $(which proxy) ]; then
    source proxy
else
    echo "proxy not found, not sourcing"
fi

source $CLONE_DIR/.bash_prompt

# Enable colors in the terminal when doing `ls`.
# See: http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# OS-specific things.
case "$OSTYPE" in
    solaris*) ;;
    darwin*)
        alias ls='ls -GFlah'
        # Expand save panel by default
        # See: https://gist.github.com/meleyal/5890865
        defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
        defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

        # Expand print panel by default
        defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
        defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

        ;;
    linux*)

        alias ls='ls -Flah --color'
        # Set LD_LIBRARY_PATH, CPATH and LIBRARY_PATH for CUDA on Linux.
        export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
        export CPATH=/usr/local/cuda/include:$CPATH
        export LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH
        ;;
    bsd*)     echo ;;
    *)        echo ;;
esac

# Alias for nano to ensure that soft wrapping always works
# See: https://unix.stackexchange.com/a/364169
# Commented out on 1 June 2018 for testing on RHEL.
# alias nano='nano -\$wS'

# Source .rcode for remote visual studio code editing.
if test -e .rcode; then
    source .rcode
fi

# Enable MKL with Theano
export MKL_THREADING_LAYER=GNU

# Enable aliases in shell.
source $CLONE_DIR/.bash_aliases

# Enable shortcuts
source $CLONE_DIR/.shortcuts

# Set CUDA path
case $HOSTNAME in
    ubuntu-gpu)
        echo "setting CUDA_PATH environment variable"
        export CUDA_PATH=/usr/local/cuda
esac

# Set Linuxbrew path
case "$OSTYPE" in
  linux*)
    export HOMEBREW_PREFIX="$HOME/.linuxbrew";
    export HOMEBREW_CELLAR="$HOME/.linuxbrew/Cellar";
    export HOMEBREW_REPOSITORY="$HOME/.linuxbrew/Homebrew";
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH";
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH";
  ;;
esac

# Temporarily added on 30 December 2018 as fallback
# Reference: https://gist.github.com/dongyuwei/3668fcc69f557dd32c46#gistcomment-2100016
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/opt/imagemagick@6/lib/


# Set editor to nano
export EDITOR=nano


# Finally, add custom local commands.
if test -f ~/.bashrc.custom; then
    echo "Sourcing custom bashrc for this machine."
    source ~/.bashrc.custom
fi
