# Link to Anaconda Python
export PATH="$HOME/anaconda/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# added by Eric to shortcut to different directories
export github="$HOME/Documents/github"
export pin="$github/protein-interaction-network"
export protconv="$github/protein-convolutional-nets"
export graphfp="$github/graph-fingerprint"
export dotfiles="$HOME/dotfiles"

# added by Eric to access Tex
export PATH="$PATH:/Library/Tex"

# added by Eric to access pypy
export PATH="$PATH:$HOME/pypy/bin"
export PATH="$PATH:$HOME/pypy3/bin"

# Customizes the bash shell colours
bold='';
reset="\e[0m";
black="\e[1;30m";
blue="\e[1;34m";
cyan="\e[1;36m";
green="\e[1;32m";
orange="\e[1;33m";
purple="\e[1;35m";
red="\e[1;31m";
violet="\e[1;35m";
white="\e[1;37m";
yellow="\e[1;33m";

# Set the terminal title and prompt.
export PS1="$bold\[$red\][ \[$cyan\]\u \[$yellow\]at \[$green\]\h \[$yellow\]in \[$red\]\W \[$red\]]\[$green\] \$ \[$reset\]"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Place conda-auto-env under github directory
source $github/conda-auto-env/conda_auto_env.sh

# Aliases
alias ls='ls -GFla --color'
alias ..='cd ..'
