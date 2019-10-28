#! /bin/sh
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
# NAME:           dock.sh
# PURPOSE:        Setup dock
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

source "./functions/dock_functions.sh"

echo "Dock: customizing dock application icons"
# WARNING: permanently clears your existing dock
clear_dock

# apps
add_app_to_dock "Launchpad"
add_app_to_dock "Google Chrome"
add_app_to_dock "Safari"
add_app_to_dock "Mail"
add_app_to_dock "Contacts"
add_app_to_dock "Calendar"
add_app_to_dock "Notes"
add_app_to_dock "Reminders"
add_app_to_dock "Maps"
add_app_to_dock "Photos"
add_app_to_dock "Messages"
add_app_to_dock "FaceTime"
add_app_to_dock "Music"  # TODO Catalina "Music"
add_app_to_dock "TV"  # TODO Catalina
add_app_to_dock "Spotify"
add_app_to_dock "App Store"
add_app_to_dock "Visual Studio Code"
add_app_to_dock "System Preferences"
add_app_to_dock "iTerm"
add_app_to_dock "Insomnia"
add_app_to_dock "Kitematic"
add_app_to_dock "Microsoft Remote Desktop"
add_app_to_dock "Microsoft Word"
add_app_to_dock "Microsoft Excel"
add_app_to_dock "Microsoft PowerPoint"
add_app_to_dock "Microsoft Outlook"

# folders
add_folder_to_dock "${HOME}/Downloads" -a 2 -d 0 -v 1

# echo "Dock: Enable highlight hover effect for the grid view of a stack (Dock)"
# defaults write com.apple.dock mouse-over-hilite-stack -bool true

echo "Dock: Set the icon size of Dock items to 50 pixels"
defaults write com.apple.dock tilesize -int 50

echo "Dock: Change minimize/maximize window effect"
defaults write com.apple.dock mineffect -string "scale"

echo "Dock: Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true

# echo "Dock: Enable spring loading for all Dock items"
# defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo "Dock: Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

echo "Dock: Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

# echo "Dock: Disable Dashboard"
# defaults write com.apple.dashboard mcx-disabled -bool true

# echo "Dock: Don’t show Dashboard as a Space"
# defaults write com.apple.dock dashboard-in-overlay -bool true

# echo "Dock: Don’t automatically rearrange Spaces based on most recent use"
# defaults write com.apple.dock mru-spaces -bool false

echo "Dock: Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0

echo "Dock: Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0

echo "Dock: Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

# echo "Dock: Make Dock icons of hidden applications translucent"
# defaults write com.apple.dock showhidden -bool true

echo "Dock: Don’t show recent applications in Dock"
defaults write com.apple.dock show-recents -bool false

# echo "Dock: Disable the Launchpad gesture (pinch with thumb and three fingers)"
# #defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# echo "Dock: Reset Launchpad, but keep the desktop wallpaper intact"
# find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# echo "Dock: Add iOS Simulator to Launchpad"
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications/iOS Simulator.app"








# ###############################################################################
# # Dock, Dashboard, and hot corners                                            #
# ###############################################################################

# # Enable highlight hover effect for the grid view of a stack (Dock)
# defaults write com.apple.dock mouse-over-hilite-stack -bool true

# # Set the icon size of Dock items to 36 pixels
# defaults write com.apple.dock tilesize -int 36

# # Change minimize/maximize window effect
# defaults write com.apple.dock mineffect -string "scale"

# # Minimize windows into their application’s icon
# defaults write com.apple.dock minimize-to-application -bool true

# # Enable spring loading for all Dock items
# defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# # Show indicator lights for open applications in the Dock
# defaults write com.apple.dock show-process-indicators -bool true

# # Wipe all (default) app icons from the Dock
# # This is only really useful when setting up a new Mac, or if you don’t use
# # the Dock to launch apps.
# #defaults write com.apple.dock persistent-apps -array

# # Show only open applications in the Dock
# #defaults write com.apple.dock static-only -bool true

# # Don’t animate opening applications from the Dock
# defaults write com.apple.dock launchanim -bool false

# # Speed up Mission Control animations
# defaults write com.apple.dock expose-animation-duration -float 0.1

# # Don’t group windows by application in Mission Control
# # (i.e. use the old Exposé behavior instead)
# defaults write com.apple.dock expose-group-by-app -bool false

# # Disable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool true

# # Don’t show Dashboard as a Space
# defaults write com.apple.dock dashboard-in-overlay -bool true

# # Don’t automatically rearrange Spaces based on most recent use
# defaults write com.apple.dock mru-spaces -bool false

# # Remove the auto-hiding Dock delay
# defaults write com.apple.dock autohide-delay -float 0
# # Remove the animation when hiding/showing the Dock
# defaults write com.apple.dock autohide-time-modifier -float 0

# # Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true

# # Make Dock icons of hidden applications translucent
# defaults write com.apple.dock showhidden -bool true

# # Don’t show recent applications in Dock
# defaults write com.apple.dock show-recents -bool false

# # Disable the Launchpad gesture (pinch with thumb and three fingers)
# #defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# # Reset Launchpad, but keep the desktop wallpaper intact
# find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# # Add iOS & Watch Simulator to Launchpad
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"



# # Hot corners
# # Possible values:
# #  0: no-op
# #  2: Mission Control
# #  3: Show application windows
# #  4: Desktop
# #  5: Start screen saver
# #  6: Disable screen saver
# #  7: Dashboard
# # 10: Put display to sleep
# # 11: Launchpad
# # 12: Notification Center
# # 13: Lock Screen
# # Top left screen corner → Mission Control
# defaults write com.apple.dock wvous-tl-corner -int 2
# defaults write com.apple.dock wvous-tl-modifier -int 0
# # Top right screen corner → Desktop
# defaults write com.apple.dock wvous-tr-corner -int 4
# defaults write com.apple.dock wvous-tr-modifier -int 0
# # Bottom left screen corner → Start screen saver
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0