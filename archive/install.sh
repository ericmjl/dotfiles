# Check the platform
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)  echo "OSX" ;;
  linux*)   echo "LINUX" ;;
  bsd*)     echo "BSD" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac


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
    if [[ $? != 0 ]]; then # if exit code is not zero --> brew not installed.
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
    # chsh -s $SHELL_PATH

    # Install Oh-My-Zsh
    install_ohmyzsh

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

    # Install other tools
    sudo apt install bat ripgrep fd

    ;;  # Necessary after each case.
esac
