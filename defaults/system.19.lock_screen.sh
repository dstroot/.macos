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
# NAME:           system.7.displays.sh
# PURPOSE:        System Settings Displays
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

# echo "Security: Setup found information on Lock Screen"
# if [ -n "$STRAP_GIT_NAME" ] && [ -n "$STRAP_GIT_EMAIL" ]; then
#  sudo defaults write /Library/Preferences/com.apple.loginwindow \
#    LoginwindowText \
#    "Found this computer? Please contact $STRAP_GIT_NAME at $STRAP_GIT_EMAIL."
# fi

# /usr/libexec/PlistBuddy -c "Delete ':LoginwindowText'" -c "Add ':LoginwindowText' string 'Found this computer? Please contact Dan Stroot at email@gmail.com or (949) 444-4444. Reward!'" /Library/Preferences/com.apple.loginwindow.plist
# /usr/libexec/PlistBuddy -c "Delete ':LoginwindowText'" -c "Add ':LoginwindowText' string 'Found this computer? Please contact Dan Stroot at email@gmail.com or (949) 444-4444. Reward!'" /System/Volumes/Preboot/F32AB030-8B16-4930-A033-0AB30E8FC277/Library/Preferences/com.apple.loginwindow.plist

# These may not be needed anymore:

# ---

# Text Input: Click "Edit":

# **Disable** "Correct spelling automatically"
# defaults write "Apple Global Domain" "NSAutomaticSpellingCorrectionEnabled" '0'
# defaults write "Apple Global Domain" "WebAutomaticSpellingCorrectionEnabled" '0'

# **Disable** "Capitalize words automatically"
# defaults write "Apple Global Domain" "NSAutomaticCapitalizationEnabled" '0'

# **Disable** "Add period with double-space"
# defaults write "Apple Global Domain" "NSAutomaticPeriodSubstitutionEnabled" '0'

# **Disable** "Use smart quotes and dashes"
# defaults write "Apple Global Domain" "NSAutomaticDashSubstitutionEnabled" '0'
# defaults write "Apple Global Domain" "NSAutomaticQuoteSubstitutionEnabled" '0'