#!/bin/bash
# Homebrew-Harden: A Script To Harden and Secure Homebrew on Mac OS X
# Author: 0xAtropine | 228Labs

echo 'Homebrew-Harden'
echo 'When using Homebrew, NEVER use sudo as it is not required and you should always be using the least privelege available.'

#------CONFIG-------#


#-------Pre-Reqs---------#
xcode-select --install

#-------Installation-------#

# Installs Homebrew using TLS 1.3 as minimum, and only resolves to using IPv4 Addresses
# TO-DO: Add --cert-status (needs OpenSSL) and return hash of file (export it)
/usr/bin/ruby -e "$(curl --tlsv1.3 --ipv4 -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# https://docs.brew.sh/Manpage

# Sets Env Variable For Homebrew to only use HTTPS. May cause some downloads to fail
export HOMEBREW_NO_INSECURE_REDIRECT=1

# Requires SHA256 hash of homebrew cask packages
export HOMEBREW_CASK_OPTS=--require-sha

# Forces The Use of Homebrew's version of cURL rather than the systems (which may be outdated)
export HOMEBREW_FORCE_BREWED_CURL=1

# Sets Homebrew Auto Update To Default of 60 seconds
export HOMEBREW_AUTO_UPDATE_SECS=60

# Sets Homebrew To Display Install Time of Packages
export HOMEBREW_DISPLAY_INSTALL_TIMES=1

# Turns off Homebrew Analytical Data to be sent to developers
export HOMEBREW_NO_ANALYTICS=1

# Makes sure Homebrew Auto-Updates before running brew install, brew upgrade, or brew tap
# Default: Turned Off
# export HOMEBREW_NO_AUTO_UPDATE=0

# Installs OpenSSL and cURL with OpenSSL
brew install openssl
brew install curl --with-openssl
brew link --force curl