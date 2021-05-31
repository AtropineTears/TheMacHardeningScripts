#!/bin/bash

#---Updates---#
# Updates System
softwareupdate -l
# Turns on Automatic System Updates
defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -int 1

#---Remote Apple Events---#
# Disables Remote Apple Events
systemsetup -setremoteappleevents off

#---MetaData---#
# Prohibits MAC OS X from creating temporary files on remote volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

#---Captive Portal---#
# Disables Captive Portal
defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false


#---File Vault---#
# Destroys Filevault Keys From Memory on Hibernation
pmset -a destroyfvkeyonstandby 1
pmset -a hibernatemode 25

pmset -a powernap 0
pmset -a standby 0
pmset -a standbydelay 0
pmset -a autopoweroff 0


#---Firewall Config---#
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on # Turn on Firewall
/usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on # Turn on Firewall Logging
/usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on # Turn on Stealth Mode (Does Not Respond To ICMP Packets)
/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsigned off # Disallow Signed Built-In Software From Passing the Firewall
/usr/libexec/ApplicationFirewall/socketfilterfw --setallowsignedapp off # Disallow Signed Applications from bypassing the Firewall

pkill -HUP socketfilterfw # Restarts Firewall
#----------------------#

# Invalidates Sudo Session after script completion
sudo -k