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

# shellcheck source="./functions/logging.sh"
source "./functions/logging.sh"

info "**Enable** App Store updates"
/Library/Preferences/com.apple.SoftwareUpdate.plist
/usr/libexec/PlistBuddy -c "Delete ':AutoUpdate'" -c "Add ':AutoUpdate' bool 'true'" /Library/Preferences/com.apple.commerce.plist

info "**Enable** MacOS updates"
/usr/libexec/PlistBuddy -c "Delete ':AutomaticallyInstallMacOSUpdates'" -c "Add ':AutomaticallyInstallMacOSUpdates' bool 'true'" /Library/Preferences/com.apple.SoftwareUpdate.plist



# Login Items & Extensions:
# 	Review "Open at Login", "Allow in Background", and "Extensions"
# 	Extensions: Click "i with circle" ⌽ for "sharing" and adjust

# Sharing: Check that everything is off

# systemsetup – configuration tool for certain machine settings in System Preferences.
# scutil – Manage system configuration parameters

# echo "Timezone: Set the timezone; see 'sudo systemsetup -listtimezones' for other values"
# systemsetup -settimezone "America/Los_Angeles" > /dev/null

# # Set computer name (as done via System Preferences → Sharing)
# USER_NAME="$USER"
# COMPUTER_SERIAL=`system_profiler SPHardwareDataType | grep "Serial Number (system):" | cut -d "":"" -f 2 | sed -r 's/ //g'`
# COMPUTER_MODEL=`system_profiler SPHardwareDataType | grep "Model Name:" | cut -d "":"" -f 2 | sed -r 's/ //g'`

# # Concatenate User, Model and Serial (descriptive and unique)
# COMPUTER_NAME="$USER_NAME"
# COMPUTER_NAME+="-"
# COMPUTER_NAME+="$COMPUTER_MODEL"
# COMPUTER_NAME+="-"
# COMPUTER_NAME+="$COMPUTER_SERIAL"

# # notifying computer name update only if name will be changed
# if [[ $COMPUTER_NAME != $(sudo scutil --get ComputerName) ]]
#   then
#   echo "Computer name set to $COMPUTER_NAME"
#   sudo scutil --set ComputerName $COMPUTER_NAME
#   sudo scutil --set HostName $COMPUTER_NAME
#   sudo scutil --set LocalHostName $COMPUTER_NAME
#   sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
# fi
