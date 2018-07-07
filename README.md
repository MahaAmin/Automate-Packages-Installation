# Auto-Packages-Installation

auto_installation.sh is a bash script that automates installation of packages that are commonly needed after each new ubuntu re-installation.
It is a simple script that you can use as it is, or edit it according to your favourite packages.

# Included Packages:
 - Google-Chrome (Stable Version).
 - Python3.6 (It is installed by default in recent ubuntu distros, but I like to make sure it is installed).
 - Pycharm IDE (Community Version).
 - R.
 - Rstudio.
 - Atom (Text-Editor).


# How To Use It:

Download the .zip file and extract it.
Open the terminal and change directory to the extracted directory : 
```sh
$ cd <path-to-directory>
```

Run the script with **sudo** :

```sh
$ sudo ./auto_installation.sh
```

### Notes:
 - Make sure you have strong and stable network access, as the script performs several downloads and updates.
 - Old versions of ubuntu may encounter problems due to un-supported ubuntu package management.

### Testing:
The script has been tested on :
- Ubuntu 18.04 LTS.
### Contributions and Issues :
Thanks for your interest to contribute!
Here are some issues that need your help:

  - Create checklist menu to choose which packages the user wants to be installed.
  - Test the script on more distros, report bugs.
  - Extend its functionality to support rpm packages.


