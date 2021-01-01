source ./utils/directories_to_make.sh
for DIR in "${DIRECTORIES_TO_CREATE[@]}"; do
    test -d $DIR || (echo "$DIR not found" && exit 1)
done
echo "Hooray! All directories found!"
