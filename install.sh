# Symlink bash_profile and bashrc to point to dotfiles
ln -svf "$HOME/dotfiles/.bash_profile" ~
ln -svf "$HOME/dotfiles/.bashrc" ~
ln -svf "$HOME/dotfiles/.condarc" ~
ln -svf "$HOME/dotfiles/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

git config --global user.name Eric J. Ma
git config --global user.email ericmajinglong@gmail.com