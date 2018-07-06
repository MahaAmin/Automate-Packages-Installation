#!/bin/bash

# Refresh software list as it may be an old distro
sed 's/# deb/deb/' -i /etc/apt/sources.list

# update repositories
apt-get update

# Install R
apt-get install r-base

# Download Rstudio
wget https://download1.rstudio.org/rstudio-xenial-1.1.453-amd64.deb

# Install Rstudio
dpkg -i rstudio-xenial-1.1.453-amd64.deb

# Fix missed dependencies 
apt-get -f install

# Remove un-necessary packages
apt-get autoremove

# Install python3.6
# Install Pycharm
# Install atom (text-editor)
# Install Google-Chrome
