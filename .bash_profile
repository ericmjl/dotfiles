# added by Anaconda3 2.5.0 installer
export PATH="$HOME/anaconda/bin:$PATH"

# added by Eric to shortcut to different directories
export github="$HOME/Documents/github"
export pin="$github/protein-interaction-network"
export protconv="$github/protein-convolutional-nets"
export graphfp="$github/graph-fingerprint"

# added by Eric to access Tex
export PATH="$PATH:/Library/Tex"

# added by Eric to access pypy
export PATH="$PATH:$HOME/pypy/bin/"
export PATH="$PATH:$HOME/pypy3/bin/"

# Place conda-auto-env under github directory
source $github/conda-auto-env/conda_auto_env.sh

# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ "
export PS1="\[\033[36m\]\u \[\033[33;1m\]:: \[\033[33;1m\]\W \033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFla'

