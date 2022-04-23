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
# NAME:           general.sh
# PURPOSE:        Set general UI
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

# echo "Restart automatically if the computer freezes"
# sudo systemsetup -setrestartfreeze on

echo "General: Menu bar: Set date and time format e.g. Sun 11 Aug 16:55"
defaults write com.apple.menuextra.clock "DateFormat" -string "EEE MMM d h:mm:ss a"

# echo "General: Disable the sound effects on boot."
# sudo nvram SystemAudioVolume=" "

echo "General: Automatically quit printer app once the print jobs is complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# echo "General: ower Chime"
# defaults write com.apple.PowerChime ChimeOnAllHardware -bool true; open /System/Library/CoreServices/PowerChime.app &

# echo "General: Save to disk (not to iCloud) by default"
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# echo "General: Disable automatic capitalization as it’s annoying when typing code"
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# echo "General: Disable smart dashes as they’re annoying when typing code"
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# echo "General: Disable automatic period substitution as it’s annoying when typing code"
# defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# echo "General: Disable smart quotes as they’re annoying when typing code"
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# echo "General: Disable auto-correct"
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# echo "General: Set sidebar icon size to medium"
# defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# echo "General: Always show scrollbars"
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# # Possible values: `WhenScrolling`, `Automatic` and `Always`

# echo "General: Increase window resize speed for Cocoa applications"
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# echo "General: Expand save panel by default"
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# echo "General: Expand print panel by default"
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# echo "General: Disable the “Are you sure you want to open this application?” dialog"
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# echo "General: Remove duplicates in the “Open With” menu (also see `lscleanup` alias)"
# /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# echo "General: Display ASCII control characters using caret notation in standard text views"
# echo "Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`"
# defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# echo "General: Disable Resume system-wide"
# defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# echo "General: Disable automatic termination of inactive apps"
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# echo "General: Set Help Viewer windows to non-floating mode"
# defaults write com.apple.helpviewer DevMode -bool true

# echo "General: Turn off font smoothing. (turn off on Retina)"
# defaults write -g CGFontRenderingFontSmoothingDisabled -bool true
# defaults write -g CGFontRenderingFontSmoothingDisabled -bool false


# echo "Set font smoothing"

# # Light font smoothing (1):
# defaults -currentHost write -globalDomain AppleFontSmoothing -int 1

# # Medium font smoothing (2):
# defaults -currentHost write -globalDomain AppleFontSmoothing -int 2

# # Heavy font smoothing (3):
# defaults -currentHost write -globalDomain AppleFontSmoothing -int 3

# # No font smoothing (0):
# defaults -currentHost write -globalDomain AppleFontSmoothing -int 0