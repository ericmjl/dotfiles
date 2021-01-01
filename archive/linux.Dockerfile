FROM ubuntu:latest

RUN apt update && \
    apt upgrade -y
RUN apt-get install curl -y
RUN apt-get install sudo -y
RUN apt-get install git -y
RUN apt-get install build-essential -y
RUN apt-get install file -y
RUN adduser --disabled-password --gecos "" docker
RUN usermod -aG sudo docker
USER docker

RUN mkdir $HOME/dotfiles
WORKDIR $HOME/dotfiles
RUN mkdir $HOME/scripts
COPY --chown=docker:docker install.linux.sh install.linux.sh
COPY --chown=docker:docker scripts/create_directories.sh scripts/create_directories.sh
COPY --chown=docker:docker scripts/install_anaconda.sh scripts/install_anaconda.sh
COPY --chown=docker:docker scripts/install_homebrew_packages.sh scripts/install_homebrew_packages.sh
COPY --chown=docker:docker scripts/install_linuxbrew.sh scripts/install_linuxbrew.sh
COPY --chown=docker:docker scripts/install_nanorc.sh scripts/install_nanorc.sh

RUN bash install.linux.sh
