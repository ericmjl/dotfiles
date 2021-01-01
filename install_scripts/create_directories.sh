source ./utils/directories_to_make.sh
for DIR in "${DIRECTORIES_TO_CREATE[@]}"; do
    mkdir -p $DIR
done
