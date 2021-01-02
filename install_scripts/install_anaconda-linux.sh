wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/anaconda.sh
chmod +x $HOME/anaconda.sh
$HOME/anaconda.sh -b -p $HOME/anaconda
rm $HOME/anaconda.sh
export PATH=$HOME/anaconda/bin:$PATH

# Install basic data science stack into default environment
conda install --yes pandas scipy numpy matplotlib seaborn jupyter ipykernel nodejs

jupyter notebook --generate-config
# We are done at this point, move on.
