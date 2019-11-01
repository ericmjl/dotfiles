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
  if [! -d "$HOME/.nanorc" ]; then
    ln -s $HOME/.nano/nanorc $HOME/.nanorc
  fi
  echo "nanorcs have been installed. Continuing..."
}


# Install exa
# Intended for Linux use only
export EXA_VERSION=0.9.0
function install_exa {
  cd $HOME/bin
  wget https://github.com/ogham/exa/releases/download/v$EXA_VERSION/exa-linux-x86_64-$EXA_VERSION.zip
  unzip exa-linux-x86_64-$EXA_VERSION.zip
  mv exa-linux-x86_64 exa
  chmod a+x exa
  rm exa-linux-*
}

# This function installs oh-my-zsh,
# then replaces the oh-my-zsh-installed .zshrc
# with one that I have customized.
function install_ohmyzsh {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    rm $HOME/.zshrc
    ln -s .zshrc $HOME/.zshrc
}
