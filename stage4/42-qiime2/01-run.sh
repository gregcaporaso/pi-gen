#!/bin/bash -e

on_chroot <<EOF
MINIFORGE_ROOT=/opt/miniforge3/
MINIFORGE_GROUP=miniforge3

wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh
bash Miniforge3-Linux-aarch64.sh -b -p /opt/miniforge3/
groupadd miniforge
chgrp -R miniforge /opt/miniforge3/
chmod 770 -R /opt/miniforge3/
adduser ${FIRST_USER_NAME} miniforge

/opt/miniforge3/bin/conda env create --yes -n raspberry-chime --file https://raw.githubusercontent.com/gregcaporaso/raspberry-chime-notes/refs/heads/main/rpi-image-gen/raspberry-chime/environment-files/environment.yml
rm Miniforge3-Linux-aarch64.sh


EOF
