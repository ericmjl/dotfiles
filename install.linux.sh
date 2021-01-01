# Linux installation script.

# Step 1: Create directories
chmod +x ./scripts/create_directories.sh
./scripts/create_directories.sh
chmod -x ./scripts/create_directories.sh

# Step 2: Install Homebrew
chmod +x ./scripts/install_linuxbrew.sh
./scripts/install_linuxbrew.sh
chmod -x ./scripts/install_linuxbrew.sh

# Step 3: Install additional packages using Homebrew
chmod +x ./scripts/install_homebrew_packages.sh
./scripts/install_homebrew_packages.sh
chmod -x ./scripts/install_homebrew_packages.sh

# Step 4: Install Anaconda
chmod +x ./scripts/install_anaconda.sh
./scripts/install_anaconda.sh
chmod -x ./scripts/install_anaconda.sh

# Step 5: Install Anthony Scopatz's nanorc files
chmod +x ./scripts/install_nanorc.sh
./scripts/install_nanorc.sh
chmod -x ./scripts/install_nanorc.sh

# Step 6: Install oh-my-zsh
chmod +x ./scripts/install_ohmyzsh.sh
./scripts/install_ohmyzsh.sh
chmod -x ./scripts/install_ohmyzsh.sh

# Step 7: Install Heroku
chmod +x ./scripts/install_heroku-linux.sh
./scripts/install_heroku-linux.sh
chmod -x ./scripts/install_heroku-linux.sh

# Step 8: Now install zshrc from this repo
chmod +x ./scripts/install_dotfiles.sh
./scripts/install_dotfiles.sh
chmod -x ./scripts/install_dotfiles.sh
