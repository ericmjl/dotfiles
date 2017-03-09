# For Rous only
if [[ "$HOSTNAME" == rous ]]; then
    module load beast/1.8.0
    module load clustalo
    module load muscle
    module load RAxML
fi

# Link to LuaJIT
export PATH="$HOME/luajit/bin:$PATH"

# Add /opt/local/(bin, sbin) for MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Link to Anaconda Python and other binaries folders
export PATH="$HOME/anaconda/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# added by Eric to shortcut to different directories
export github="$HOME/github"
export pin="$github/protein-interaction-network"
export protconv="$github/protein-convolutional-nets"
export graphfp="$github/graph-fingerprint"
export dotfiles="$HOME/dotfiles"
export anaconda="$HOME/anaconda"

# added by Eric to access Tex
export PATH="$PATH:/Library/Tex"

# added by Eric to access pypy
export PATH="$PATH:$HOME/pypy/bin"
export PATH="$PATH:$HOME/pypy3/bin"

# added by Eric to access CUDA
export PATH=/usr/local/cuda-8.0/bin$PATH





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

# Customize prompt to add git status where applicable.
prompt_git() {
    local s='';
    local branchName='';

    # Check if the current directory is in a Git repository.
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null;

            # Check for uncommitted changes in the index.
            if ! $(git diff --quiet --ignore-submodules --cached); then
                s+='+';
            fi;

            # Check for unstaged changes.
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s+='!';
            fi;

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+='?';
            fi;

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+='$';
            fi;

        fi;

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";

        [ -n "${s}" ] && s=" [${s}]";

        echo -e "${1}${branchName}${2}${s}";
    else
        return;
    fi;
}

# Set the terminal title and prompt.
# export PS1="$bold\[$red\][ \[$cyan\]\u \[$yellow\]at \[$green\]\h \[$yellow\]in \[$red\]\W \[$red\]]\[$green\] \$ \[$reset\]"
PS1="\[\033]0;\W\007\]"; # working directory base name
PS1+="\[${bold}\]\n"; # newline
PS1+="\[${cyan}\]\u"; # username
PS1+="\[${yellow}\] at ";
PS1+="\[${green}\]\h"; # host
PS1+="\[${yellow}\] in ";
PS1+="\[${red}\]\w"; # working directory full path
PS1+="\$(prompt_git \"\[${white}\] on \[${violet}\]\" \"\[${blue}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Place conda-auto-env under github directory
# source $github/software/conda-auto-env/conda_auto_env.sh

# OS-specific things.
case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*)
    alias ls='ls -GFlah'
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
    ;;
  linux*)   alias ls='ls -Flah --color' ;;
  bsd*)     echo "BSD" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

alias ..='cd ..'

