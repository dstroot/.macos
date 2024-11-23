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

info() {
    local TEXT=$1
    local PRINT="$(gum format -- "$TEXT")"
    gum log --level info "$PRINT"
}

warn() {
    local TEXT=$1
    local PRINT="$(gum format -- "$TEXT")"
    gum log --level warn "$PRINT"
}

info **Disable** Slightly dim the display on battery
/usr/libexec/PlistBuddy -c "Delete ':Battery Power:ReduceBrightness'" -c "Add ':Battery Power:ReduceBrightness' bool 'false'" /Library/Preferences/com.apple.PowerManagement.plist

info Options: Wake for Network Access on battery: **Never**  (off=0, on=1)
# -- on power --
/usr/libexec/PlistBuddy -c "Delete ':AC Power:Wake On LAN'" -c "Add ':AC Power:Wake On LAN' integer '1'" /Library/Preferences/com.apple.PowerManagement.plist
# -- on battery --
/usr/libexec/PlistBuddy -c "Delete ':Battery Power:Wake On LAN'" -c "Add ':Battery Power:Wake On LAN' integer '0'" /Library/Preferences/com.apple.PowerManagement.plist