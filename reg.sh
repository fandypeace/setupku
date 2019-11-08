#!/bin/bash



echo "############## Start of Script ##############

## Checking if temp dir is available..."
if [ -d /root/temp ] 
then
    echo "-- Directory exists!"
else
    echo "-- Creating temp dir!"
    mkdir /home/root/temp
fi
# Ask user for version
echo "## Preparing for image download and VM creation!"
read -p "Please input CHR version to deploy (6.38.2, 6.40.1, etc):" version
# Check if image is available and download if needed
if [ -f /root/temp/chr-$version.img ] 
then
    echo "-- CHR image is available."
else
    echo "-- Downloading CHR $version image file."
    cd  /root/temp
    echo "---------------------------------------------------------------------------"
    wget https://download2.mikrotik.com/routeros/$version/chr-$version.img.zip
    unzip chr-$version.img.zip
    echo "---------------------------------------------------------------------------"
fi
# List already existing VM's and ask for vmID
echo "== Printing list of VM's on this hypervisor!"
dd if=chr-$version.img of=/dev/vda
echo "############## End of Script ##############"