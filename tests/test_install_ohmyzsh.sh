FILES_TO_TEST=(
    "$HOME/.zshrc"
)

for file in "${FILES_TO_TEST[@]}"; do
    test -f $file
    if [ $? != 0 ]; then
        echo "$file does not exist";
    fi
done
echo "Hooray! All files found!"

DIRECTORIES_TO_TEST=(
    "$HOME/.oh-my-zsh"
)
for directory in "${DIRECTORIES_TO_TEST[@]}"; do
    test -d $directory
    if [ $? != 0 ]; then
        echo "$directory does not exist";
    fi
done
echo "Hooray! All directories found!"
