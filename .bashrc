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
export bold='';
export reset="\e[0m";
export black="\e[1;30m";
export blue="\e[1;34m";
export cyan="\e[1;36m";
export green="\e[1;32m";
export orange="\e[1;33m";
export purple="\e[1;35m";
export red="\e[1;31m";
export violet="\e[1;35m";
export white="\e[1;37m";
export yellow="\e[1;33m";

# Set the terminal title and prompt.
export PS1="\[$cyan\]\u \[$yellow\]at \[$green\]\h \[$yellow\]in \[$red\]\W \[$green\]\$ \[$reset\]"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Place conda-auto-env under github directory
source $github/conda-auto-env/conda_auto_env.sh

# Aliases
alias ls='ls -GFla'
alias ..='cd ..'