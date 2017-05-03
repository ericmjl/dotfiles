# Check the platform
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  echo "OSX" ;;
  linux*)   echo "LINUX" ;;
  bsd*)     echo "BSD" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

# Make a "/bin" directory under HOME, for storing my own custom binaries.
if [ ! -d "$HOME/bin" ]; then
    mkdir $HOME/bin
fi

# Make the SSH directory under HOME.
if [ ! -d "$HOME/.ssh" ]; then
    mkdir $HOME/.ssh
fi


# Make the Documents directory under HOME.
if [ ! -d "$HOME/Documents" ]; then
    mkdir $HOME/Documents
fi

# Make the github directory under HOME.
if [ ! -d "$HOME/github" ]; then
    mkdir $HOME/github
fi

# If OS is Mac OS X, then do the following:
case "$OSTYPE" in
  darwin*)
    # # Symlink Sublime Text as a command line app
    # ln -svf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "$HOME/bin/sublime"
    # Symlink the sublime 3 preferences.
    # ln -svf "$HOME/dotfiles/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

    # Check to see if Homebrew is installed.
    echo "checking to see if Homebrew is installed."
    which -s brew
    if [[ $? != 0 ]]; then
      echo "Homebrew is not installed; instaling now..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew install imagemagick
      brew install wget
      brew install mosh
      brew install tmux
      echo "Homebrew successfully installed. moving on..."
    else
      echo "Homebrew installed. moving on..."
    fi

    # Check to see if Anaconda is installed.
    echo "checking to see if anaconda is installed."
    which -s conda
    if [[ $? != 0 ]]; then
        echo "anaconda not installed; installing now..."
        wget https://repo.continuum.io/archive/Anaconda3-4.3.1-MacOSX-x86_64.sh -O anaconda.sh
        bash anaconda.sh -b -p $HOME/anaconda
        rm anaconda.sh
        echo "anaconda successfully installed. moving on..."
    else
        echo "anaconda already installed. moving on..."
    fi

esac

# Symlink bash_profile and bashrc to point to dotfiles
echo "Symlinking .bash_profile and .bashrc"
ln -svf "$HOME/dotfiles/.bash_profile" ~
ln -svf "$HOME/dotfiles/.bashrc" ~

# Symlink condarc
echo "Symlinking .condarc"
ln -svf "$HOME/dotfiles/.condarc" ~

# Symlink gitconfig
ln -svf "$HOME/dotfiles/.gitconfig" ~

# Symlink script for updating all git repositories
ln -svf "$HOME/dotfiles/scripts/pull_git_repos.sh" "$github"

# Symlink ssh-copy-id
ln -svf "$HOME/dotfiles/ssh-copy-id.sh" "$HOME/bin/ssh-copy-id"

# Symlink SSH config
ln -svf "$HOME/dotfiles/.ssh/config" "$HOME/.ssh/config"
