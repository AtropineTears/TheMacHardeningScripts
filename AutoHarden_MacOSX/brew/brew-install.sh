#!/bin/bash

# Todo: Add --cert-status (needs OpenSSL) to homebrew install and return hash of file (export it)



#-------Pre-Reqs---------#
xcode-select --install

#-------Installation-------#
# Description: Installs Homebrew with cURL using TLS 1.3 as minimum, and only resolves to using IPv4 Addresses.
/usr/bin/ruby -e "$(curl --tlsv1.3 --ipv4 -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"