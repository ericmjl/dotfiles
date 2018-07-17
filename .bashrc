# Link to LuaJIT
# export PATH="$HOME/luajit/bin:$PATH"

# Link to Anaconda Python and other binaries folders
export PATH="$HOME/anaconda/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# added by Eric to shortcut to different directories
export github="$HOME/github"
export dotfiles="$HOME/dotfiles"
export anaconda="$HOME/anaconda"

# added by Eric to access Tex
export PATH="$PATH:/Library/Tex"

# added by Eric to access pypy
export PATH="$PATH:$HOME/pypy/bin"
alias pip_pypy="$HOME/pypy/bin/pip"
export PATH="$PATH:/usr/local/Cellar/pypy3/5.9.0/bin"
alias ppip="/usr/local/bin/pip_pypy3"
alias pipython="/usr/local/share/pypy3/ipython3"
alias jp="jupyter notebook"
alias jl="jupyter lab"
alias sa="source activate"
alias sd="source deactivate"


# added by Eric to access git and nano
export PATH="/usr/local/bin:$PATH"

# added by Eric to access CUDA
export PATH=/usr/local/cuda-8.0/bin:$PATH

# Enable conda-auto-env
source $HOME/dotfiles/conda_auto_env.sh

# Proxy addresses used for work. Checks to see if .http_proxies is present before sourcing it.
source nibrproxy

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
PS1="\[\033]0;\W\007\]";  # working directory base name
PS1+="\[${bold}\]\n";     # newline
PS1+="\[${cyan}\]\u";     # username
PS1+="\[${yellow}\] at "; # 'at'
PS1+="\[${green}\]\h";    # host
PS1+="\[${yellow}\] in "; # 'in'
PS1+="\[${red}\]\w";      # working directory full path
PS1+="\$(prompt_git \"\[${white}\] on \[${violet}\]\" \"\[${cyan}\]\")"; # Git repository details
PS1+="\n";                # newline
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

# Enable colors in the terminal when doing `ls`.
# See: http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# OS-specific things.
case "$OSTYPE" in
    solaris*) ;;
    darwin*)
        alias ls='ls -GFlah'
        # Expand save panel by default
        # See: https://gist.github.com/meleyal/5890865
        defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
        defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

        # Expand print panel by default
        defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
        defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

        ;;
    linux*)

        alias ls='ls -Flah --color'
        # Set LD_LIBRARY_PATH, CPATH and LIBRARY_PATH for CUDA on Linux.
        export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
        export CPATH=/usr/local/cuda/include:$CPATH
        export LIBRARY_PATH=/usr/local/cuda/lib64:$LIBRARY_PATH
        ;;
    bsd*)     echo ;;
    *)        echo ;;
esac

# Make `..` an alias for `cd ..`
alias ..='cd ..'

# Alias for nano to ensure that soft wrapping always works
# See: https://unix.stackexchange.com/a/364169
# Commented out on 1 June 2018 for testing on RHEL.
# alias nano='nano -\$wS'

# Alias for ls
# I am being so, so, lazy.
alias l='ls'

if test -d /usr/prog/modules/all; then
    module use /usr/prog/modules/all
    module load proxy/GLOBAL
fi
if test -d /cm/shared/modulefiles; then
    module use /cm/shared/modulefiles
    module load uge
fi
if test -d /cm/local/modulefiles; then
    module use /cm/local/modulefiles
fi

if test -d /usr/prog/isld/modules; then
    module use /usr/prog/isld/modules
fi

# Source .rcode for remote visual studio code editing.
if test -e .rcode; then
    source .rcode
fi


# . /home/maer3/anaconda/etc/profile.d/conda.sh
# conda activate

# More aliases
alias fixcam="sudo killall VDCAssistant"
alias saa="source activate autograd_cupy_dev"
alias sab="source activate bayesian-modelling-tutorial"
