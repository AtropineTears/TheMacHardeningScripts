#!/bin/bash
# [Security/Privacy] Disables Captive Portal which can be exploited
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false