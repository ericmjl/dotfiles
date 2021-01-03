FROM ubuntu:latest

RUN apt update && \
    apt upgrade -y
RUN apt-get install curl -y
RUN apt-get install sudo -y
RUN apt-get install git -y
RUN apt-get install build-essential -y
RUN apt-get install file -y
RUN apt-get install zsh -y
RUN apt-get install wget -y

# RUN adduser --disabled-password --gecos "" docker
# RUN usermod -aG sudo docker
# USER docker

RUN mkdir $HOME/dotfiles
WORKDIR $HOME/dotfiles
RUN mkdir $HOME/scripts
COPY install.linux.sh install.linux.sh
COPY .files .files
COPY .shell_aliases .shell_aliases
COPY utils utils
# RUN bash install.linux.sh
COPY install_scripts/create_directories.sh ./install_scripts/create_directories.sh
RUN zsh ./install_scripts/create_directories.sh

COPY install_scripts/install_linuxbrew.sh ./install_scripts/install_linuxbrew.sh
RUN zsh ./install_scripts/install_linuxbrew.sh

COPY install_scripts/install_dotfiles.sh ./install_scripts/install_dotfiles.sh
RUN zsh ./install_scripts/install_dotfiles.sh

COPY install_scripts/install_anaconda-linux.sh ./install_scripts/install_anaconda-linux.sh
RUN zsh ./install_scripts/install_anaconda-linux.sh

ENV PATH=$HOME/.linuxbrew/:$PATH
RUN ls -la $HOME
COPY install_scripts/install_homebrew_packages.sh ./install_scripts/install_homebrew_packages.sh
RUN bash ./install_scripts/install_homebrew_packages.sh

ENTRYPOINT ["/usr/bin/zsh"]
