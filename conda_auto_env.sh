#!/bin/bash

# conda-auto-env automatically activates a conda environment when
# entering a folder with an environment.yml file.
#
# If the environment doesn't exist, conda-auto-env creates it and
# activates it for you.
#
# To install add this line to your .bashrc or .bash-profile:
#
#       source /path/to/conda_auto_env.sh
#

function conda_auto_env() {
  if [ -e "environment.yml" ]; then
    # echo "environment.yml file found"
    # Get environment name associated with 'name' variable in file
    ENV=`grep 'name:' environment.yml | tail -n1 | awk '{ print $2}'`

    # Check if you are already in the environment
    if [[ $PATH != *$ENV* ]]; then
      # Check if the environment exists
      conda activate $ENV
      if [ $? -eq 0 ]; then
        :
      else
        # Create the environment and activate
        echo "Conda env '$ENV' doesn't exist."

        while true; do
            select choice in CREATE IGNORE
            do
                echo "$REPLY : $choice"
                break
            done

            case $choice in
                "CREATE" )
                    echo "Creating new conda environment from 'environment.yml' file found in folder..";
                    sleep 2;
                    conda env create -q;
                    conda activate $ENV;
                    break ;;
                "IGNORE" )
                    echo "Ceasing creation of new conda environment";
                    break ;;
                * )
                    echo "Please Choose Option 1, or 2" ;;
            esac
        done
      fi
    fi
  fi
}

export PROMPT_COMMAND=conda_auto_env
