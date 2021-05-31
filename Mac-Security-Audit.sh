#!/bin/bash

# Checks whether System Integrity Protection is Enabled
csrutil status | grep -w "Enabled"

# Check Whether Automatic Updates are Enabled (1 = yes)
defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates

# Check Remote Apple Events (should be off)
systemsetup -getremoteappleevents | grep -w "Off"

# Check File Integrity of Essential Files
shasum -a 256 /etc/hosts