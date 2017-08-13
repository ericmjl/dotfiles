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
    if [[ $? != 0 ]]; then  # check if exit code is not zero --> brew not installed.
      echo "Homebrew is not installed; instaling now..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew install imagemagick
      brew install wget
      brew install mosh
      brew install tmux
      echo "Homebrew and favorites successfully installed, moving on..."
    else
      echo "Homebrew installed. moving on..."
    fi

    # Check to see if Anaconda is installed.
    echo "checking to see if anaconda is installed."
    which -s conda
    if [[ $? != 0 ]]; then
        echo "anaconda not installed; installing now..."
        wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O anaconda.sh
        bash anaconda.sh -b -p $HOME/anaconda
        rm anaconda.sh
        export PATH=$HOME/anaconda:$PATH
        # Install basic data science stack into default environment
        conda install pandas scipy numpy matplotlib seaborn jupyter ipykernel
        # Enable environment kernels,
        pip install environment_kernels
        jupyter notebook --generate-config
        echo ""
        echo "#  Enabling Jupyter environment kernels plugin" >> $HOME/.jupyter/jupyter_notebook_config.py
        echo "c.NotebookApp.kernel_spec_manager_class = 'environment_kernels.EnvironmentKernelSpecManager'" >> $HOME/.jupyter/jupyter_notebook_config.py

        # We are done at this point, move on.
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

# Symlink .nanorc
ln -svf "$HOME/dotfiles/.nanorc" "$HOME/.nanorc"
