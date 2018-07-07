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
NC='\033[0m'
#-------- Refresh software list as it may be an old distro --------------------------------------------
if sed 's/# deb/deb/' -i /etc/apt/sources.list ; then
	printf "${LIGHT_GREEN}Done. "'"/etc/apt/sources.list"'" has been refreshed.\n${NC}"
else
	printf "${RED}Failed to refresh /etc/apt/sources.list.\n${NC}"
fi
#########################################################################################################

#---------- update repositories -------------------------------------------------------------------------
if apt-get update ; then
	printf "${LIGHT_GREEN}Done. apt-get update finished successfully\n${NC}"
else
	printf "${RED}FAILURE: apt-get update failed.\n${NC}"
fi
#########################################################################################################
#---------------- Download Google-Chrome ----------------------------------------------------------------
printf "${LIGHT_BLUE}Downloading google-chrome-stable_current_amd64.deb\n${NC}"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#---------------- Install Google-Chrome -----------------------------------------------------------------
if dpkg -i --force-all google-chrome-stable_current_amd64.deb ; then 
	printf "${LIGHT_GREEN}Google-Chrome has been installed successfully.\n${NC}"
else
	printf "${RED}FAILURE: Failed to install google-chrome-stable_current_amd64.deb\n${NC}"
fi
#########################################################################################################
#---------------- Install Python3.6 ---------------------------------------------------------------------
if apt-get -y install python3.6 ; then 
	printf "${LIGHT_GREEN}Done. python3.6 has been successfully installed.\n${NC}"
else
	printf "${RED}FAILURE: Failed to install python3.6\n${NC}"
fi
#########################################################################################################
#---------------- Update Repositories -------------------------------------------------------------------
if apt-get update ; then
        printf "${LIGHT_GREEN}Done. apt-get update finished successfully\n${NC}"
else
        printf "${RED}FAILURE: apt-get update failed.\n${NC}"
fi
#---------------- Install Pycharm -----------------------------------------------------------------------
if snap install pycharm-community --classic ; then 
	printf "${LIGHT_GREEN}Done. pycharm-community has been installed successfully.\n${NC}"
else
	printf "${RED}FAILURE: Failed to install pycharm-community.\n${NC}"
fi
#########################################################################################################
#---------------- Add Atom PPA --------------------------------------------------------------------------
if apt-get install pycharm-community ; then 
	printf "${LIGHT_GREEN}Atom PPA ha been added.\n${NC}"
else
	printf "${RED}FAILURE: Failed to add atom PPA.\n${NC}"
fi
#---------------- Update Repositories -------------------------------------------------------------------
if apt-get update ; then
        printf "${LIGHT_GREEN}Done. apt-get update finished successfully\n${NC}"
else
        printf "${RED}FAILURE: apt-get update failed.\n${NC}"
fi
#---------------- Install Atom-Text-Editor --------------------------------------------------------------
if apt-get -y install atom ; then
	printf "${LIGHT_GREEN}Done. Atom has been installed successfully.\n${NC}"
else
	printf "${RED}FAILURE: Failed to install atom.\n${NC}"
fi
#########################################################################################################
#---------------- Install R -----------------------------------------------------------------------------
if apt-get install r-base ; then
	printf "${LIGHT_GREEN}Done. R has been installed successfully.\n${NC}"
else 
	printf "${RED}FAILURE: apt-get install r-base failed.\n${NC}"
fi
#------------------ Download Rstudio ---------------------------------------------------------------------
if [ -e rstudio-xenial-1.1.453-amd64.deb ]
then
	rm rstudio-xenial-1.1.453-amd64.deb;
	printf "${LIGHT_BLUE}Old rstudio-xenial-1.1.453-amd64.deb has been deleted.\n${NC}"
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
	printf "${LIGHT_GREEN}Done. Rstudio has been installed successfully.\n${NC}"
fi

#------------------- Remove un-necessary packages --------------------------------------------------------
apt-get autoremove
###############################################################################################################


