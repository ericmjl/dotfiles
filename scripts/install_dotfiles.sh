# Install dotfiles
# This script should be run from the dotfiles repository root.

# Firstly, install the shell config file
rm $HOME/.zshrc
ln -svf `pwd`/the-dotfiles/.zshrc $HOME
ln -svf `pwd`/the-dotfiles/.path.sh $HOME
ln -svf `pwd`/the-dotfiles/.shortcuts.sh $HOME
ln -svf `pwd`/shell_aliases $HOME

# Then, install the other dotfiles
ln -svf `pwd`/the-dotfiles/.condarc $HOME
ln -svf `pwd`/the-dotfiles/.gitconfig $HOME
mkdir -p $HOME/.ssh
ln -svf `pwd`/the-dotfiles/.ssh/config $HOME/.ssh/config
ln -svf `pwd`/the-dotfiles/.tmux.conf $HOME/.tmux.conf
