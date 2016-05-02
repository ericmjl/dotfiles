# Symlink bash_profile and bashrc to point to dotfiles
ln -svf "$HOME/dotfiles/.bash_profile" ~
ln -svf "$HOME/dotfiles/.bashrc" ~
ln -svf "$HOME/dotfiles/.condarc" ~