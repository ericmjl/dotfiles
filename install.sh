# Symlink bash_profile and bashrc to point to dotfiles
ln -svf "$HOME/dotfiles/.bash_profile" ~
ln -svf "$HOME/dotfiles/.bashrc" ~

# Symlink condarc
ln -svf "$HOME/dotfiles/.condarc" ~

# Symlink the sublime 3 preferences.
ln -svf "$HOME/dotfiles/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

# Symlink gitconfig
ln -svf "$HOME/dotfiles/.gitconfig" ~

# Symlink script for updating all git repositories
ln -svf "$HOME/dotfiles/scripts/pull_git_repos.sh" "$github"
