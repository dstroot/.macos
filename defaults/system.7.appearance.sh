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
# NAME:           system.4.appearance.sh
# PURPOSE:        System Settings Appearance
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

# shellcheck source="./functions/logging.sh"
source "../functions/logging.sh"

warn "**No Changes**"

# echo "Appearance is set to auto"
# # defaults delete "Apple Global Domain" "AppleInterfaceStyle"
# defaults write "Apple Global Domain" "AppleInterfaceStyleSwitchesAutomatically" '1'

# echo "General: Always show scrollbars"
# # Possible values: `WhenScrolling`, `Automatic` and `Always`
# defaults write NSGlobalDomain AppleShowScrollBars -string "Always"