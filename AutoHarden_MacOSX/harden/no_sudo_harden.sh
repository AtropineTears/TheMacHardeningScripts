#!/bin/bash

#---Screensaver---#
defaults write com.apple.screensaver askForPassword -int 1 # Ask for Password at Screensaver
defaults write com.apple.screensaver askForPasswordDelay -int 0 # Ask for Password as soon as Screensaver Starts

#---Finder---#
# [Security] Expose Hidden Files and Library Folders in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
chflags nohidden ~/Library
# [Security] Show All Filename Extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# [Privacy] Disables saving documents to iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#---ETC---#
# [Privacy] Disable Crash Reporter
defaults write com.apple.CrashReporter DialogType none