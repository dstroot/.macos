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

# https://github.com/rpavlick/add_to_dock

function add_app_to_dock {
  # adds an application to macOS Dock
  # usage: add_app_to_dock "Application Name" 
  # example add_app_to_dock "Terminal"

  app_name="${1}"
  launchservices_path="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"
  app_path=$(${launchservices_path} -dump | grep -o "/.*${app_name}.app" | grep -v -E "Backups|Caches|TimeMachine|Temporary|/Volumes/${app_name}" | uniq | sort | head -n1)
  if open -Ra "${app_path}"; then
      echo "$app_path added to the Dock."
      defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>${app_path}</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
  else
      echo "ERROR: $1 not found." 1>&2
  fi
}

function add_spacer_to_dock {
  # adds an empty space to macOS Dock

  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
}

function clear_dock {
  # removes all persistent icons from macOS Dock

  defaults write com.apple.dock persistent-apps -array
}

function reset_dock {
  # reset macOS Dock to default settings

  defaults write com.apple.dock; killall Dock
}

# echo "customizing dock application icons"
# WARNING: permanently clears your existing dock
clear_dock

add_app_to_dock "System Preferences"
add_app_to_dock "Activity Monitor"
add_spacer_to_dock
add_app_to_dock "Microsoft Outlook"
add_app_to_dock "Google Chrome"
add_app_to_dock "Microsoft Excel"
add_app_to_dock "Microsoft Word"
add_app_to_dock "Microsoft PowerPoint"
add_app_to_dock "kitty"
add_app_to_dock "Visual Studio Code"
add_app_to_dock "SelfControl"
add_app_to_dock "Skype"
add_spacer_to_dock

# refresh your dock to see the changes
killall Dock

#=====





# echo "Enable highlight hover effect for the grid view of a stack (Dock)"
# defaults write com.apple.dock mouse-over-hilite-stack -bool true

echo "Set the icon size of Dock items to 50 pixels"
defaults write com.apple.dock tilesize -int 50

echo "Change minimize/maximize window effect"
defaults write com.apple.dock mineffect -string "scale"

echo "Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true

# echo "Enable spring loading for all Dock items"
# defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

echo "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

echo "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

# echo "Disable Dashboard"
# defaults write com.apple.dashboard mcx-disabled -bool true

# echo "Don’t show Dashboard as a Space"
# defaults write com.apple.dock dashboard-in-overlay -bool true

# echo "Don’t automatically rearrange Spaces based on most recent use"
# defaults write com.apple.dock mru-spaces -bool false

echo "Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0

echo "Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

# echo "Make Dock icons of hidden applications translucent"
# defaults write com.apple.dock showhidden -bool true

echo "Don’t show recent applications in Dock"
defaults write com.apple.dock show-recents -bool false

# echo "Disable the Launchpad gesture (pinch with thumb and three fingers)"
# #defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# echo "Reset Launchpad, but keep the desktop wallpaper intact"
# find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# echo "Add iOS Simulator to Launchpad"
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications/iOS Simulator.app"

# echo "Add a spacer to the left side of the Dock (where the applications are)"
# #defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# echo "Add a spacer to the right side of the Dock (where the Trash is)"
# #defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'
