#!/bin/bash

# Color Variables:
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'
DARK_GREY='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'

#-------- Refresh software list as it may be an old distro ----------------------
if sed 's/# deb/deb/' -i /etc/apt/sources.list ; then
	printf "Done.\n"'"/etc/apt/sources.list"'" has been refreshed.\n"
else
	printf "Failed to refresh /etc/apt/sources.list"

#########################################################################################################

#---------- update repositories ---------------------------------------
apt-get update

#########################################################################################################

#---------------- Install R ------------------------------------------
apt-get install r-base && echo "Done.\n 

# Download Rstudio
wget https://download1.rstudio.org/rstudio-xenial-1.1.453-amd64.deb

# Install Rstudio
dpkg -i rstudio-xenial-1.1.453-amd64.deb

# Fix missed dependencies 
apt-get -f install

# Remove un-necessary packages
apt-get autoremove

# Install python3.6
#apt-get install python3.6

# Add pycharm PPA
#add-apt-repository ppa:mystic-mirage/pycharm

# Update repositories
#apt-get update

# Install Pycharm
#apt-get install pycharm-community

# Install atom (text-editor)

# Install Google-Chrome
