# Install dotfiles
# This script should be run from the dotfiles repository root.

# Firstly, install the shell config file
rm $HOME/.zshrc
ln -svf `pwd`/.files/.zshrc $HOME
ln -svf `pwd`/.files/.path.sh $HOME
ln -svf `pwd`/.files/.shortcuts.sh $HOME
ln -svf `pwd`/shell_aliases $HOME

# Then, install the other dotfiles
ln -svf `pwd`/.files/.condarc $HOME
ln -svf `pwd`/.files/.gitconfig $HOME
mkdir -p $HOME/.ssh
ln -svf `pwd`/.files/.ssh/config $HOME/.ssh/config
ln -svf `pwd`/.files/.tmux.conf $HOME/.tmux.conf

# Finally, install shell aliases
ln -svf `pwd`/.shell_aliases $HOME
