#!/bin/bash
# Filename: /brew/brew-install.sh | Created 1 Sept 2021
# Description: A Bash Script To Install Homebrew and xcode dev tools
# Author: @AtropineTears
# Company: @NightshadeLabs

# Todo: Add --cert-status (needs OpenSSL) to homebrew install and return hash of file (export it)



#-------Pre-Reqs---------#
xcode-select --install

#-------Installation-------#
# Description: Installs Homebrew with cURL using TLS 1.3 as minimum, and only resolves to using IPv4 Addresses.
# Maybe Switch  To This| /usr/bin/ruby -e "$(curl --tlsv1.3 --ipv4 -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
/bin/bash -c "$(curl --tlsv1.3 --ipv4 -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"