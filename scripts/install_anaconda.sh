# Check to see if Anaconda is installed.
echo "checking to see if anaconda is installed."
which -s conda
if [[ $? != 0 ]]; then
    echo "anaconda not installed; installing now..."
    wget https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O anaconda.sh
    bash anaconda.sh -b -p $HOME/anaconda
    rm anaconda.sh
    export PATH=$HOME/anaconda/bin:$PATH

    # Install basic data science stack into default environment
    conda install --yes pandas scipy numpy matplotlib seaborn jupyter ipykernel nodejs

    jupyter notebook --generate-config
    # We are done at this point, move on.
    echo "anaconda successfully installed. moving on..."

else
    echo "anaconda already installed. moving on..."
fi
