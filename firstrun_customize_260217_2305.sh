#!/bin/bash

# REMEMBER, UNLIKE WINDOWS, FILENAMES ARE CASE-SENSITIVE ON GNU/LINUX AND OTHER UNIX-LIKE SYSTEMS

# RUN THE FOLLOWING COMMAND BUT REPLACE "cole" WITH YOUR USERNAME
# usermod -aG sudo cole
# USE "cd" TO (C)HANGE (D)IRECTORY BACK TO YOUR DESKTOP, OR WHEREVER YOU SAVE THIS SCRIPT FILE.
# cd /home/*/Desk*/
# RUN THE FOLLOWING COMMAND TO MAKE IT EXECUTABLE
# chmod +x ./cole*.sh


# MOVES THE ORIGINAL APT SOURCE REPOSITORY LIST TO AN UNUNUSED FILENAME
mv /etc/apt/sources.list /etc/apt/sources_original.list

# REMAKES AN EMPTY APT SOURCES FILE
touch /etc/apt/sources.list

# ADDS SOURCES TO THE FILE
echo deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware >> /etc/apt/sources.list
echo deb http://deb.debian.org/debian-security trixie-security main contrib non-free non-free-firmware >> /etc/apt/sources.list
echo deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware >> /etc/apt/sources.list

# UPDATES APT'S AWARENESS OF AVAILABLE PACKAGES AND NEW VERSIONS
# ( "yes" command with the "pipe" "|" symbol sends and endless stream of "y's" to the following command, to say yes to every otherwise interactive prompt. )
yes | apt update

# UPGRADES ANY INSTALLED BUT OLD PACKAGES TO LATEST VERSIONS
yes | apt upgrade

# FINDS ANY PACKAGES INSTALLED WITH UNMENT DEPENDENCIES AND INSTALLS NEEDED DEPENDENCIES
yes | apt --fix-broken install

# 
yes | apt install tmux

# PACKAGES NEEDED FOR VIRTUALBOX, NOT INSTALLED AUTOMATICALLY IDFK WHY
yes | apt install linux-headers-amd64 build-essential dkms

# DOWNLOADS THE DPKG (DEBIAN PACKAGE) INSTALLER FOR VIRTUALBOX FROM VIRTUALBOX.ORG
wget https://download.virtualbox.org/virtualbox/7.2.6/virtualbox-7.2_7.2.6-172322~Debian~trixie_amd64.deb

# INSTALL VIRTUALBOX
dpkg -i ./?irtual?ox*.deb

# OOPS, MORE UNMET DEPENDENCIES! FIX EM.
yes | apt --fix-broken install

# IDK IF THIS NEEDS TO RUN BUT I SAW IT IN A V.BOX ERROR MESSAGE SO PFFT
/sbin/vboxconfig

# DISABLES SOMETHING CALLED KVM (IMMEDIATELY), IT HOGS VT-x WHICH IS NEEDED FOR VIRTUALBOX. SWITCH "intel" FOR "amd" IF NEEDED
rmmod kvm-intel

# DISABLES SOMETHING CALLED KVM (PERMANANTLY), IT HOGS VT-x WHICH IS NEEDED FOR VIRTUALBOX. SWITCH "intel" FOR "amd" IF NEEDED
echo blacklist kvm_intel >> /etc/modprobe.d/no-kvm.conf 
echo blacklist kvm >> /etc/modprobe.d/no-kvm.conf 

# KRITA - DRAWING AND ANIMATION
yes | apt install krita

# AUDACITY - AUDIO RECORDING
yes | apt install audacity

# FFMPEG
# BIG BOY PANTS COMMAND LINE VIDEO PROCESSOR NEEDED BY EVERYTHING, EVEN YOU, YOU JUST DON'T KNOW IT YET.
# FFMPEG CLI IS CLUNKY TO TYPE COMMANDS FOR BUT ITS SHEER OPTIMIZED, STRAIGHTFORWARD FUNCTION MAKES IT THE FASTEST TOOL WHEN YOU KNOW WHEN AND HOW TO USE IT.
yes | apt install ffmpeg



# WINDOWS APP COMPATIBILITY. WILL SAVE YOUR ASS ON OCCASION
yes | apt install wine


# VERACRYPT - DATA ENCRYPTION

# DOWNLOAD DPKG 
wget https://launchpad.net/veracrypt/trunk/1.26.24/+download/veracrypt-1.26.24-Debian-13-amd64.deb
# INSTALL
dpkg -i ?era?rypt*.deb
# OOPS I GUESS WE FIXING YOUR MESS AGAIN BECAUSE F--K YOU
yes | apt --fix-broken install

# FLATPAK IS A DIFFERENT PACKAGE MANAGER THAN APT. WELCOME TO HELL.
yes | apt install flatpak
# ADD REPOSITORY
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# KDENLIVE - VIDEO EDITOR
yes | flatpak install org.kde.kdenlive
# F--KIN UH OOPS
yes | flatpak install org.kde.kdenlive/x86_64/stable -y

yes | flatpak -y install blender
yes | flatpak -y install com.obsproject.Studio 

# K--L ME
yes | apt update

yes | apt install curl git

curl -fsSL https://pyenv.run | bash


# YO DAWG I HEARD YOU LIKED LINUX SO I PUT A LINUX INSIDE OF YOUR LINUX
wget https://mirrors.ocf.berkeley.edu/debian-cd/13.3.0/amd64/iso-dvd/debian-13.3.0-amd64-DVD-1.iso


