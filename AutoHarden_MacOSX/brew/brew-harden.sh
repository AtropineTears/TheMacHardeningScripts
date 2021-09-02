#!/bin/bash
# Filename: brew-harden.sh | 1 Sept 2021
# Description: A Bash Script To Harden and Secure Homebrew on Mac OS X
# Author: @AtropineTears
# Company: @OpenNightshade

#------METADATA------#
echo 'Filename: brew-harden.sh | created by @OpenNightshade and @AtropineTears'
echo 'Notice: When using Homebrew, you should NEVER use sudo as it is not required. You should go by the least privelege available.'
# Print out the homebrew log file
echo 'HOMEBREW LOG PATH: ~/Library/Logs/Homebrew/'

#------CONSTANTS-------#
CONSTANT_LOG_PATH='~/Library/Logs/Homebrew/'


#------Https-Only-------#
# [SECURITY]
# NOTE: While ensuring your downloads are fully secure, this is likely to cause from-source SourceForge, some GNU & GNOME-hosted formulae to fail to download
# Sets Env Variable For Homebrew to only use HTTPS.
export HOMEBREW_NO_INSECURE_REDIRECT=1

# [SECURITY]
# Requires SHA256 hash of homebrew cask packages
# TODO: Check whether I need to remove parenthesis
export HOMEBREW_CASK_OPTS="--require-sha"

# [SECURITY]
# Forces The Use of Homebrew's version of cURL rather than the systems (which may be outdated)
export HOMEBREW_FORCE_BREWED_CURL=1

# [SECURITY]
# Displays timestamps for when formulas are installed
export HOMEBREW_DISPLAY_INSTALL_TIMES=1


# [GENERAL]
# Sets Homebrew Auto Update To Default of 60 seconds
export HOMEBREW_AUTO_UPDATE_SECS=60

# [SECURITY]
# Sets Homebrew To Display Install Time of Packages
export HOMEBREW_DISPLAY_INSTALL_TIMES=1

#-------ANALYTICS-------#
# [PRIVACY]
# Turns off Homebrew Analytical Data to be sent to developers
export HOMEBREW_NO_ANALYTICS=1
brew analytics off


# [UPDATING]
# Sets updates to happen every 300 seconds (?)
export HOMEBREW_AUTO_UPDATE_SECS=300

#-------Autoclean-------#
# [CLEANUP]
# Cleans up formulae every 3 days
# Default: 30
export HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS=3

# Makes sure Homebrew Auto-Updates before running brew install, brew upgrade, or brew tap
# Default: Turned Off
# export HOMEBREW_NO_AUTO_UPDATE=0

#-------Set Autoupdate and Set Autoupgrade-------#
# Automatically updates/upgrades every twelve hours. It will also send a notficiation when it is updating. The first time it is called it will also upgrade right then and there.
brew autoupdate start 43200 --upgrade --enable-notification --immediate

# Installs OpenSSL and cURL with OpenSSL
brew install openssl
brew install curl --with-openssl
brew link --force curl