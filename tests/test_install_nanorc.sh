test -d $HOME/.nano
test -d $HOME/.nanorc
test -f $HOME/.nano/python.nanorc
test -f $HOME/.nano/Dockerfile.nanorc
cat $HOME/.nanorc | grep "~/.nano/" | wc
echo "Hooray! nanorc files found!"
