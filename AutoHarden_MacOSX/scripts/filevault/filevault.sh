#!/bin/bash

# Destroys Filevault Keys on Standby
# REQUIRES SUDO and FILEVAULT to be enabled
sudo pmset -a destroyfvkeyonstandby 1
sudo pmset -a hibernatemode 25

sudo pmset -a powernap 0
sudo pmset -a standby 0
sudo pmset -a standbydelay 0
sudo pmset -a autopoweroff 0