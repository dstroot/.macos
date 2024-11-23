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

FOREGROUND="#7aa2f7"  
BORDER="#ff87d7"    
TITLE="#ffffff"


info() {
    local TEXT=$1
    local ITEM1=$2
    local ITEM2=$3
    local ITEM3=$4
    local ITEM4=$5

    gum log --structured --level info "$TEXT" "$ITEM1" "$ITEM2" "$ITEM3" "$ITEM4"
}

warn() {
    local TEXT=$1
    gum log --level warn "$TEXT"
}

error() {
    local TEXT=$1
    gum log --level error "$TEXT"
    exit 1;
}

announce_step() {
  local TEXT=$1
  gum style --foreground "$FOREGROUND" --border-foreground "$BORDER" --border double --align left --width 70 --margin "1 0" --padding "0 2" "$TEXT"
}

# declare -a FILES=()

# # where we keep our defaults
# read -a FILES <<< "${HOME}"/.macos/defaults/*

# # Close any open System Preferences panes, to prevent them from
# # overriding settings we’re about to change
# # osascript -e 'tell application "System Preferences" to quit'


# # If these files are readable, source them
# for index in "${!FILES[@]}"
# do
#   if [ -r "${FILES[$index]}" ]; then
#     echo "$index"
#     printf "Processing %s" '$(basename "${FILES[$index]}")'
#   fi
# done

# unset FILES

search_dir="${HOME}"/.macos/defaults
for entry in "$search_dir"/settings.*.*.sh
do
  announce_step "Processing: $(basename "$entry")"
  bash "$entry"
done



# for f in $FILES
# do
#   # echo ""
#   # cecho "===================================================" $white
#   # cecho "==> Processing $(basename $f) configuration:" $green
#   # cecho "===================================================" $white
#   # echo ""
#   printf "Processing %s, $(basename $f)"
#   # sh $f
# done

# echo ""
# cecho "===================================================" $white
# cecho " Restart affected applications" $green
# cecho "===================================================" $white
# echo ""

# applications=(
#   "Activity Monitor"
#   "Address Book"
#   "Calendar"
#   "Contacts"
#   "cfprefsd"
#   "Dock"
#   "Finder"
#   "Mail"
#   "Messages"
#   "Safari"
#   "SizeUp"
#   "SystemUIServer"
#   "Terminal"
#   "Transmission"
#   "iCal"
# )

# for i in "${applications[@]}"; do
#   killall "${i}" > /dev/null 2>&1
# done

# cecho "Kill everything? (y/n)" $red
# read -r response
# case $response in
#   [yY])
#   for i in "${applications[@]}"; do
#     killall "${i}" > /dev/null 2>&1
#   done
# esac

# cecho "All Done!" $green
# cecho "Note: some of these changes require a logout/restart to take effect." $green

exit 0
