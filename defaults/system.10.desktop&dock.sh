#!/bin/bash
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
# NAME:           system.6.dock.sh
# PURPOSE:        System Settings Dock
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

source "../functions/dock_functions.sh"
source "../functions/logging.sh"


echo "Dock: customizing dock application icons"
# WARNING: permanently clears your existing dock
clear_dock

# apps
add_app_to_dock "System Settings"
add_app_to_dock "Launchpad"

add_app_to_dock "Google Chrome"
# add_app_to_dock "Firefox"
add_app_to_dock "Safari"

add_app_to_dock "Mail"
add_app_to_dock "HEY"

# add_app_to_dock "Maps"
add_app_to_dock "Photos"
add_app_to_dock "Messages"
add_app_to_dock "FaceTime"

add_app_to_dock "Contacts"
add_app_to_dock "Calendar"
add_app_to_dock "Notes"
add_app_to_dock "Reminders"

# add_app_to_dock "TV"  # TODO Catalina
add_app_to_dock "Music"  # TODO Catalina "Music"
add_app_to_dock "Audio MIDI Setup"

# add_app_to_dock "Spotify"
add_app_to_dock "News"
add_app_to_dock "Stocks"

# add_app_to_dock "App Store"
add_app_to_dock "Windows App"
add_app_to_dock "Visual Studio Code"
add_app_to_dock "iTerm"

add_app_to_dock "Microsoft Word"
add_app_to_dock "Microsoft Excel"
add_app_to_dock "Microsoft PowerPoint"

add_app_to_dock "Obsidian"

# folders

# Screenshots
mkdir -p ${HOME}/Pictures/Screenshots
add_folder_to_dock "${HOME}/Pictures/Screenshots" -a 1 -d 0 -v 1

# Downloads
add_folder_to_dock "${HOME}/Downloads" -a 2 -d 0 -v 1

# echo "Dock: Enable highlight hover effect for the grid view of a stack (Dock)"
# defaults write com.apple.dock mouse-over-hilite-stack -bool true

echo "Dock: dock placement: bottom, left, right"
defaults write com.apple.dock "orientation" -string "bottom"

echo "Dock: Set the icon size of Dock items to 50 pixels"
defaults write com.apple.dock tilesize -int 50

echo "Dock: Change minimize/maximize window effect"
defaults write com.apple.dock mineffect -string "scale"

echo "Dock: Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true

echo "Dock: Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

echo "Dock: Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

echo "Dock: Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0

echo "Dock: Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0

echo "Dock: Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Dock: Don’t show recent applications in Dock"
defaults write com.apple.dock show-recents -bool false

echo "Click wallpaper to reveal deskop only in stage manager"
defaults write "com.apple.WindowManager" "EnableStandardClickToShowDesktop" '0'

echo "Make launchpad icons smaller"
defaults write com.apple.dock springboard-columns -int 14
defaults write com.apple.dock springboard-rows -int 9

# echo "Reset Launchpad to defaults"
# defaults delete com.apple.dock springboard-rows
# defaults delete com.apple.dock springboard-columns
# defaults write com.apple.dock ResetLaunchPad -bool true

echo "Mission Control: Speed up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1

echo "Mission Control: Group windows by application in Mission Control"
defaults write "com.apple.dock" "expose-group-apps" '1'

echo "Dock: Set hot corners"
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left screen corner → Nothing
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner → Nothing
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right screen corner → Mission Control
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0


killall Dock > /dev/null 2>&1
