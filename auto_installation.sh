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

#-------- Refresh software list as it may be an old distro --------------------------------------------
if sed 's/# deb/deb/' -i /etc/apt/sources.list ; then
	printf "Done.\n"'"/etc/apt/sources.list"'" has been refreshed.\n"
else
	printf "Failed to refresh /etc/apt/sources.list"
fi
#########################################################################################################

#---------- update repositories -------------------------------------------------------------------------
if apt-get update ; then
	printf "Done. apt-get update finished successfully\n"
else
	printf "FAILURE: apt-get update failed.\n"
fi
#########################################################################################################
#---------------- Download Google-Chrome ----------------------------------------------------------------
printf "Downloading google-chrome-stable_current_amd64.deb\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#---------------- Install Google-Chrome -----------------------------------------------------------------
if dpkg -i --force-all google-chrome-stable_current_amd64.deb ; then 
	printf "Google-Chrome has been installed successfully.\n"
else
	printf "FAILURE: Failed to install google-chrome-stable_current_amd64.deb\n"
fi
#########################################################################################################
#---------------- Install Python3.6 ---------------------------------------------------------------------
if apt-get install python3.6 ; then 
	printf "Done. python3.6 has been successfully installed.\n"
else
	printf "FAILURE: Failed to install python3.6\n"
fi
#########################################################################################################
#---------------- Add Pycharm PPA -----------------------------------------------------------------------
if add-apt-repository ppa:mystic-mirage/pycharm ; then
	printf "Pycharm PPA has been added.\n"
else
	printf "FAILURE: Failed to add pycharm PPA.\n"
fi
#---------------- Update Repositories -------------------------------------------------------------------
if apt-get update ; then
        printf "Done. apt-get update finished successfully\n"
else
        printf "FAILURE: apt-get update failed.\n"
fi
#---------------- Install Pycharm -----------------------------------------------------------------------
if apt-get install pycharm-community ; then 
	printf "Done. pycharm-community has been installed successfully.\n"
else
	printf "FAILURE: Failed to install pycharm-community.\n"
fi
#########################################################################################################
#---------------- Add Atom PPA --------------------------------------------------------------------------
if apt-get install pycharm-community ; then 
	printf "Atom PPA ha been added.\n"
else
	printf "FAILURE: Failed to add atom PPA.\n"
fi
#---------------- Update Repositories -------------------------------------------------------------------
if apt-get update ; then
        printf "Done. apt-get update finished successfully\n"
else
        printf "FAILURE: apt-get update failed.\n"
fi
#---------------- Install Atom-Text-Editor --------------------------------------------------------------
if apt-get install atom ; then
	printf "Done. Atom has been installed successfully.\n"
else
	printf "FAILURE: Failed to install atom.\n"
fi
#########################################################################################################
#---------------- Install R -----------------------------------------------------------------------------
if apt-get install r-base ; then
	printf "Done. R has been installed successfully.\n"
else 
	printf "FAILURE: apt-get install r-base failed.\n"
fi
#------------------ Download Rstudio ---------------------------------------------------------------------
if [ -e rstudio-xenial-1.1.453-amd64.deb ]
then
	rm rstudio-xenial-1.1.453-amd64.deb;
	printf "Old rstudio-xenial-1.1.453-amd64.deb has been deleted.\n"
fi

wget https://download1.rstudio.org/rstudio-xenial-1.1.453-amd64.deb

# Check integrity of rstudio-package
CHECKSUM_REFRENCE="85b3e76c9fad4613bc9cf0de1f34b183"
CHECKSUM_OUTPUT="$(md5sum rstudio-xenial-1.1.453-amd64.deb)"

if [ "$CHECKSUM_OUTPUT" != "$CHECKSUM_REFRENCE" ] 
then
	wget -c https://download1.rstudio.org/rstudio-xenial-1.1.453-amd64.deb
fi

#---------------------- Install Rstudio -----------------------------------------------------------------
if [ "$CHECKSUM_OUTPUT" == "$CHECKSUM_REFRENCE" ]
then
	dpkg -i --force-all rstudio-xenial-1.1.453-amd64.deb
fi
#------------------- Fix missed dependencies -----------------------------------------------------------
if apt-get -f install ; then 
	printf "Done. Rstudio has been installed successfully.\n"
fi

#------------------- Remove un-necessary packages --------------------------------------------------------
apt-get autoremove
###############################################################################################################


