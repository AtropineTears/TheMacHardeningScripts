#!/bin/bash

#---Screensaver---#
defaults write com.apple.screensaver askForPassword -int 1 # Ask for Password at Screensaver
defaults write com.apple.screensaver askForPasswordDelay -int 0 # Ask for Password as soon as Screensaver Starts

#---Finder---#
# Expose Hidden Files and Library Folders in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library
# Show All Filename Extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Disable saving documents to iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#---ETC---#
# Disable Crash Reporter
defaults write com.apple.CrashReporter DialogType none