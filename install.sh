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
  # We store custom configurations that aren't version controlled in this
  # directory. Examples include work configs that I don't want up on GitHub.
  mkdir $HOME/.ssh/config.d
fi


# Make the Documents directory under HOME.
if [ ! -d "$HOME/Documents" ]; then
  mkdir $HOME/Documents
fi

# Make the github directory under HOME.
if [ ! -d "$HOME/github" ]; then
  mkdir $HOME/github
fi


BREW_PACKAGES=(
  "bash"                # might as well get an updated terminal shell
  "git"                 # version control https://git-scm.com/
  "bash-completion"     # bash completion for git and other things https://github.com/scop/bash-completion
  "gcc"                 # gnu compiler collection https://gcc.gnu.org/
  "tmux"                # window management https://tmux.github.io/
  "wget"                # curl alternative https://www.gnu.org/software/wget/
  "imagemagick"         # image processing library
  "mobile-shell"        # mobile shell
  "nano"                # get an enhanced nano
  "gnu-sed"             # get "standard" sed that is used on Linux.
  "tree"                # get the standard "tree" command on Linux.
  "gnu-sed"             # get standard sed from Linux.
  "exa"                 # an enhanced, modern ls
  "exiftool"            # just in case
  "heroku-cli"          # for heroku apps
  "libreoffice"         # for worship-manager
  "freetype"            # for worship-manager
  "libmagic"            # for worship-manager
  "imagemagick"         # for worship-manager
  "heroku/brew/heroku"  # for heroku
  "micro"               # micro text editor
)


# Installs anaconda according to my customizations
function install_anaconda {
  bash anaconda.sh -b -p $HOME/anaconda
  rm anaconda.sh
  export PATH=$HOME/anaconda/bin:$PATH

  # Install basic data science stack into default environment
  conda install --yes pandas scipy numpy matplotlib seaborn jupyter ipykernel nodejs

  jupyter notebook --generate-config
  # We are done at this point, move on.
  echo "anaconda successfully installed. moving on..."
}

# Install nanorc
function install_nanorc {
  echo "Checking to see if nanorcs have been installed..."
  if [ ! -d "$HOME/.nano" ]; then
    echo "nanorcs have not been installed. Installing..."
    git clone git@github.com:ericmjl/nanorc.git $HOME/.nano
  fi
  if [! -d "$HOME/.nanorc"]; then
    echo "Copying nanorc to the correct location..."
    cp $HOME/.nano/nanorc $HOME/.nanorc
  fi
  echo "nanorcs have been installed. Continuing..."
}

# Install exa
# Intended for Linux use only
export EXA_VERSION=0.8.0
function install_exa {
  cd $HOME/bin
  wget https://github.com/ogham/exa/releases/download/v$EXA_VERSION/exa-linux-x86_64-$EXA_VERSION.zip
  unzip exa-linux-x86_64-$EXA_VERSION.zip
  mv exa-linux-x86_64 exa
  chmod a+x exa
  rm exa-linux-*
}


# If OS is Mac OS X, then do the following:
case "$OSTYPE" in
  darwin*)
    # Symlink nano preferences
    install_nanorc

    # Install xcode-select
    xcode-select --install
    echo "Waiting for xcode-select to install."
    echo "Press any key to continue when xcode-select is installed."
    read -n 1 -s

    # Check to see if Homebrew is installed.
    echo "checking to see if Homebrew is installed."
    which -s brew
    if [[ $? != 0 ]]; then # check if exit code is not zero --> brew not installed.
      echo "Homebrew is not installed; instaling now..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
      echo "Homebrew installed. moving on..."
    fi

    # Install homebrew packages that might not already be installed.
    echo -e "\nInstalling packages from regular brew"
    for pkg in "${BREW_PACKAGES[@]}"; do
      if ! brew list -1 | grep -q "^${pkg}\$";
      then
        echo "Installing $pkg"
        brew install "$pkg"
      fi
    done
    echo "Homebrew and favorites successfully installed, moving on..."

    # Check to see if Anaconda is installed.
    echo "checking to see if anaconda is installed."
    which -s conda
    if [[ $? != 0 ]]; then
      echo "anaconda not installed; installing now..."
      wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O anaconda.sh
      install_anaconda
    else
      echo "anaconda already installed. moving on..."
    fi

    # Change shell to Homebrew-installed bash shell
    SHELL_PATH=/usr/local/bin/bash
    if cat /etc/shells | grep $SHELL_PATH; then
      echo $SHELL_PATH already in shells
    else
      echo "Adding $SHELL_PATH to shells, password required..."
      echo $SHELL_PATH | sudo tee -a /etc/shells
      echo "Added $SHELL_PATH to shells"
    fi
    chsh -s $SHELL_PATH

    ;;  # necessary after each case

  linux*)
    # Install nanorc
    install_nanorc

    # Install exa
    install_exa

    # Install conda
    echo "Checking to see if anaconda has been installed..."
    which conda
    if [[ $? != 0 ]]; then
      echo "anaconda not installed; installing now..."
      wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O anaconda.sh
      install_anaconda
    else
      echo "anaconda already installed. moving on..."
    fi

    ;;  # Necessary after each case.
esac

# Install git-completion
echo "Installing git-completion for Bash."
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash

# Symlink bash_profile and bashrc to point to dotfiles
echo "Symlinking .bash_profile and .bashrc"
ln -svf "$HOME/dotfiles/.bash_profile" ~
ln -svf "$HOME/dotfiles/.bashrc" ~

# Symlink condarc
echo "Symlinking .condarc"
ln -svf "$HOME/dotfiles/.condarc" ~

# Symlink gitconfig
echo "Symlinking .gitconfig"
ln -svf "$HOME/dotfiles/.gitconfig" ~

# Symlink script for updating all git repositories
echo "Symlinking script to pull all git repositories"
ln -svf "$HOME/dotfiles/scripts/pull_git_repos.sh" "$github"

# Symlink ssh-copy-id
ln -svf "$HOME/dotfiles/ssh-copy-id.sh" "$HOME/bin/ssh-copy-id"

# Symlink SSH config
ln -svf "$HOME/dotfiles/.ssh/config" "$HOME/.ssh/config"

# Symlink tmux config
ln -svf "$HOME/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
