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
# NAME:           software_update.sh
# PURPOSE:        Configure software update preferences
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

# echo "Enable automatic software updates"

# # Check for macOS version
# osvers=$(/usr/bin/sw_vers -productVersion | awk -F. '{print $2}')
 
# # plist
# plist_file="/Library/Preferences/com.apple.SoftwareUpdate.plist"

# # Enable the following:
# #   Automatic background check for macOS software updates
# #   Automatic download of macOS software updates
# #   Automatic download and installation of XProtect, MRT and Gatekeeper updates
# #   Automatic download and installation of automatic security updates
# #   App updates from the App Store

# /usr/bin/defaults write "$plist_file" AutomaticCheckEnabled -bool true
# /usr/bin/defaults write "$plist_file" AutomaticDownload -bool true
# /usr/bin/defaults write "$plist_file" ConfigDataInstall -bool true
# /usr/bin/defaults write "$plist_file" CriticalUpdateInstall -bool true

# # For macOS Mojave and later, enable the automatic installation of macOS updates.
# if [[ "$osvers" -ge 14 ]]; then
# 	/usr/bin/defaults write "$plist_file" AutomaticallyInstallMacOSUpdates -bool true
# fi

# /usr/bin/defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool true