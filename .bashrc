# PATH variable.
echo "sourcing $HOME/dotfiles/.path"
source $HOME/dotfiles/.path

# Enable conda-auto-env
source $HOME/dotfiles/conda_auto_env.sh

# Enable git-completion
source $HOME/.git-completion.bash

# Proxy addresses used for work. Checks to see if the "proxy" executable is present before sourcing it.
if [ $(which proxy) ]; then
    source proxy
else
    echo "proxy not found, not sourcing"
fi

source $HOME/dotfiles/.bash_prompt

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

if test -d /usr/prog/modules/all; then
    module use /usr/prog/modules/all
    module load proxy/GLOBAL
    echo "PATH is now $PATH"
fi
if test -d /cm/shared/modulefiles; then
    module use /cm/shared/modulefiles
    module load uge
    echo "PATH is now $PATH"
fi
if test -d /cm/local/modulefiles; then
    module use /cm/local/modulefiles
    echo "PATH is now $PATH"
fi

if test -d /usr/prog/isld/modules; then
    module use /usr/prog/isld/modules
    echo "PATH is now $PATH"
fi

# Source .rcode for remote visual studio code editing.
if test -e .rcode; then
    source .rcode
fi

# Enable MKL with Theano
export MKL_THREADING_LAYER=GNU

# Enable aliases in shell.
source $HOME/dotfiles/.bash_aliases

# Enable shortcuts
source $HOME/dotfiles/.shortcuts

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
