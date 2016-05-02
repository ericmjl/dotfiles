# Includes all the source files present.
for DOTFILE in `find $HOME/dotfiles`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done