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
# NAME:           trackpad.sh
# PURPOSE:        Setup trackpad
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

# shellcheck source="./functions/logging.sh"
source "../functions/logging.sh"

info "**Enable** "Tap to click""
/usr/libexec/PlistBuddy -c "Delete ':Clicking'" -c "Add ':Clicking' bool 'true'" "$HOME/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist"
/usr/libexec/PlistBuddy -c "Delete ':Clicking'" -c "Add ':Clicking' bool 'true'" "$HOME/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist"

info "Secondary click: **"Click or Tap With Two Fingers"**"
/usr/libexec/PlistBuddy -c "Delete ':ContextMenuGesture'" -c "Add ':ContextMenuGesture' integer '1'" "$HOME/Library/Preferences/.GlobalPreferences.plist"
/usr/libexec/PlistBuddy -c "Delete ':TrackpadRightClick'" -c "Add ':TrackpadRightClick' bool 'true'" "$HOME/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist"
/usr/libexec/PlistBuddy -c "Delete ':TrackpadRightClick'" -c "Add ':TrackpadRightClick' bool 'true'" "$HOME/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist"

info "**Increase** Tracking speed"
/usr/libexec/PlistBuddy -c "Delete ':com.apple.trackpad.scaling'" -c "Add ':com.apple.trackpad.scaling' real '1.000000'" "$HOME/Library/Preferences/.GlobalPreferences.plist"

#---------------------------

echo "Trackpad: enable tap to click for this user and for the login screen"

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1


defaults write "com.apple.AppleMultitouchTrackpad" "ActuationStrength" -int 0
defaults write "com.apple.AppleMultitouchTrackpad" "Clicking" -int 0


# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1





# echo "Enable tap to click"
# defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" "Clicking" '1'
# defaults write "com.apple.AppleMultitouchTrackpad" "Clicking" '1'

# echo "Enable secondary click with two fingers"
# defaults write "com.apple.AppleMultitouchTrackpad" "TrackpadRightClick" '1'
# defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" "TrackpadRightClick" '1'

# echo "Set tracking speed"
# defaults write "Apple Global Domain" "com.apple.trackpad.scaling" '"0.875"'

# echo "Enable three-finger swipe"
# defaults write "com.apple.AppleMultitouchTrackpad" "TrackpadThreeFingerHorizSwipeGesture" '2'
# defaults write "com.apple.driver.AppleBluetoothMultitouch.trackpad" "TrackpadThreeFingerHorizSwipeGesture" '2'

# execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true && \
#          defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1 && \
#          defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 && \
#          defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1" \
#     "Enable 'Tap to click'"

# execute "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true && \
#          defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1 && \
#          defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true && \
#          defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 0 && \
#          defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0 && \
#          defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 0" \
#     "Map 'click or tap with two fingers' to the secondary click"

# echo "Trackpad: map bottom right corner to right-click"
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# echo "Trackpad: swipe between pages with three fingers"
# defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1

# echo "Disable “natural” (Lion-style) scrolling"
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

