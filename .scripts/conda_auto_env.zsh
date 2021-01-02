#!/bin/zsh

# Taken from https://janosh.dev/blog/conda-auto-env. All credit to the original author!

# Automatically activates conda environments when entering directories
# containing a conda environment file. The file must be named one of

#   - env(ironment).y(a)ml
#   - requirements.y(a)ml

# Deactivates env when exciting the directory. If the env doesn't exist yet,
# offer to create it from file.

# Installation: Copy chpwd() to .zshrc or save the whole script as a file and
# source it in .zshrc, e.g. by placing it in /usr/local/bin or by symlinking
# conda_auto_env there and then adding `source conda_auto_env`.
# chpwd is a zsh hook called whenever the working directory changes.
# (http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions). When
# using bash, use the environment variable `PROMPT_COMMAND` instead. This might
# have performance implications since it runs on every prompt (even empty ones),
# not just directory changes. Plus PROMPT_COMMAND makes it impossible to change
# to a different conda env while you're in a directory with an env file since
# bash will always auto-change back to that file's env.

chpwd() {
  # On Linux replace `find -E` with `f -regextype posix-extended`.
  FILE="$(find -E . -maxdepth 1 -regex '.*(env(ironment)?|requirements)\.ya?ml' -print -quit)"
  if [[ -e $FILE ]]; then
    ENV=$(sed -n 's/name: //p' $FILE)
    # Check if env is already active.
    if [[ $CONDA_DEFAULT_ENV != $ENV ]]; then
      conda activate $ENV
      # If env activation is unsuccessful, prompt user whether to create conda env from file.
      if [ $? -ne 0 ]; then
        while true; do
          # Read user reply into variable YorN.
          read "YorN?[conda_auto_env] Environment '$ENV' doesn't exist. Would you like to create it now? (y/n)"$'\n'
          # $'\n' for newline. https://unix.stackexchange.com/a/126316/315020
          if [ "$YorN" = "" ]; then YorN='y'; fi # interpret enter as y
          case $YorN in
              [Yy] ) echo Proceeding...
                conda env create -f $FILE
                conda activate $ENV;;
              [Nn] ) echo Exiting...; break;;
              * ) echo "Enter y for yes or n for no.";;
          esac
        done
      fi
      CONDA_ENV_ROOT="$(pwd)"
    fi
  # Deactivate env when exiting the env file's directory.
  elif [[ $PATH = */envs/* ]]\
    && [[ $(pwd) != $CONDA_ENV_ROOT ]]\
    && [[ $(pwd) != $CONDA_ENV_ROOT/* ]]
  then
    CONDA_ENV_ROOT=""
    conda deactivate
  fi
}

# Execute chpwd on shell init in case the shell launches in a conda env directory.
chpwd
