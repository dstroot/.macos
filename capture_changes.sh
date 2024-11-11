#!/bin/sh
# ------------------------------------------------------------------------------
# Copyright (c) 2014 Dan Stroot
# All rights reserved.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# ------------------------------------------------------------------------------
# NAME:           osx_defaults.sh
# PURPOSE:        sets all the things
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------
# References & Resources:
#  - https://github.com/MatthewMueller/dots
#  - https://github.com/thoughtbot/laptop
#  — https://mths.be/osx
#  - https://github.com/kevinSuttle/osxdefaults/blob/master/REFERENCE.md
#  - https://gist.github.com/brandonb927/3195465
#  - https://github.com/joeyhoer/starter ** SAME APPROACH **
# ------------------------------------------------------------------------------
# NOTE: How to track changes to create your own commands:
# ------------------------------------------------------------------------------
# $ defaults read > a
# ---- Change a setting, then: ----
# $ defaults read > b
# $ diff a b
#
# Doing this creates files called a and b, then displays the difference between
# them. With this knowledge you can then open up the file b in Sublime Text 2,
# search for the bit that changed and try and work out the command to change it.
# ------------------------------------------------------------------------------
progname=$0
ver="1.0"

# Define colors
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

# where we keep our defaults
FILES=${HOME}/.macos/defaults/*

#  Reset text attributes to normal
alias Reset="tput sgr0"

# Color-echo function
#   Argument $1 = message
#   Argument $2 = Color

cecho() {
  echo "${2}${1}"
  Reset # Reset to normal.
  return
}

# identify yourself
cecho "Running: $progname, version $ver." $blue

# Instructions:
# 1) Do a 'Before' run to save the current settings
# 2) Then launch System Preferences and make a change via the GUI. 
#    Best to do only one change at a time, then quit System Preferences.
# 3) Then do an 'After' run to see what file changed.
# 4) Then diff the plists:
#    diff -u <(plist before/Preferences/com.apple.loginwindow.plist) <(plist after/Preferences/com.apple.loginwindow.plist)
# 5) At this point we have located the setting. Confirm we have it with defaults:
#    $ defaults read /Library/Preferences/com.apple.loginwindow SHOWFULLNAME
#    $ sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool false
#    $ defaults read /Library/Preferences/com.apple.loginwindow SHOWFULLNAME
# 6) Launch System Preferences and confirm it changed.

echo ""
cecho "Is this a 'Before' run or an 'After' run? (B/A) " $blue
read -r response
case $response in
  B)
    sudo cp -r /Library/Preferences ~/@before
    ;;
  A)
    sudo cp -r /Library/Preferences ~/@after
    
    # See which files changed:
    sudo diff -ur ~/@before ~/@after
    
    # Remove files
    sudo rm -rf ~/@before
    sudo rm -rf ~/@after
    ;;
esac
exit 0
