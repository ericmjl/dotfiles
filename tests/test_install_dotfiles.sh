FILES_TO_TEST=(
    "$HOME/.zshrc"
    "$HOME/.path.sh"
    "$HOME/.shortcuts.sh"
    "$HOME/.condarc"
    "$HOME/.gitconfig"
    "$HOME/.ssh/config"
    "$HOME/.tmux.conf"
)

for file in "${FILES_TO_TEST[@]}"; do
    test -f $file
    if [ $? != 0 ]; then
        echo "$file does not exist";
    fi
done
echo "Hooray! All files found!"

DIRECTORIES_TO_TEST=(
    "$HOME/shell_aliases"
)
for directory in "${DIRECTORIES_TO_TEST[@]}"; do
    test -d $directory
    if [ $? != 0 ]; then
        echo "$directory does not exist";
    fi
done
echo "Hooray! All directories found!"

# test -f $HOME/.zshrc || echo "Does not exist" && return 1
# test -f $HOME/.path.sh || echo "Does not exist" && return 1
# test -f $HOME/.shortcuts.sh || echo "Does not exist" && return 1
# test -d $HOME/shell_aliases || echo "Does not exist" && return 1
# test -f $HOME/.condarc || echo "Does not exist" && return 1
# test -f $HOME/.gitconfig || echo "Does not exist" && return 1
# test -f $HOME/.ssh/config || echo "Does not exist" && return 1
# test -f $HOME/.tmux.conf || echo "Does not exist" && return 1
