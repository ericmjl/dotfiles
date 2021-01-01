test -f $HOME/.zshrc || echo "Does not exist" && exit 1
test -f $HOME/.path.sh || echo "Does not exist" && exit 1
test -f $HOME/.shortcuts.sh || echo "Does not exist" && exit 1
test -d $HOME/shell_aliases || echo "Does not exist" && exit 1
test -f $HOME/.condarc || echo "Does not exist" && exit 1
test -f $HOME/.gitconfig || echo "Does not exist" && exit 1
test -f $HOME/.ssh/config || echo "Does not exist" && exit 1
test -f $HOME/.tmux.conf || echo "Does not exist" && exit 1
