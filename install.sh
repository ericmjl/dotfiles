# Check the platform
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  echo "OSX" ;; 
  linux*)   echo "LINUX" ;;
  bsd*)     echo "BSD" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

# Make a "/bin" directory under HOME
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
if [ ! -d "$HOME/Documents/github" ]; then
    mkdir $HOME/Documents/github
fi

# If OS is Mac OS X, then symlink Sublime Text
case "$OSTYPE" in
  darwin*)
    # Symlink Sublime Text as a command line app
    ln -svf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "$HOME/bin/sublime" 
    # Symlink the sublime 3 preferences.
    ln -svf "$HOME/dotfiles/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
esac

# Symlink bash_profile and bashrc to point to dotfiles
ln -svf "$HOME/dotfiles/.bash_profile" ~
ln -svf "$HOME/dotfiles/.bashrc" ~

# Symlink condarc
ln -svf "$HOME/dotfiles/.condarc" ~

# Symlink gitconfig
ln -svf "$HOME/dotfiles/.gitconfig" ~

# Symlink script for updating all git repositories
ln -svf "$HOME/dotfiles/scripts/pull_git_repos.sh" "$github"

# Symlink ssh-copy-id
ln -svf "$HOME/dotfiles/ssh-copy-id.sh" "$HOME/bin/ssh-copy-id"

# Symlink SSH config
ln -svf "$HOME/dotfiles/.ssh/config" "$HOME/.ssh/config"

