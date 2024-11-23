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

announce_step() {
  local TEXT=$1
  gum style --foreground "$FOREGROUND" --border-foreground "$BORDER" --border double --align left --width 70 --margin "1 0" --padding "0 2" "$TEXT"
}

close_settings() {
  # Close any open System Preferences panes, to prevent them
  # from overriding settings we’re about to change
  osascript -e 'tell application "System Preferences" to quit'
}

process_settings() {
  announce_step "Processing settings files"
  search_dir="${HOME}"/.macos/defaults

  for entry in "$search_dir"/settings.*.*.sh; do
    announce_step "Processing: $(basename "$entry")"

    if [ "$DEBUG" == "Yes" ]; then
      shellcheck -x "$entry"
    else
      bash "$entry"
    fi
  done
}

kill_with_fire() {
  announce_step "Killing applications..."

  applications=(
    # "Activity Monitor"
    # "Address Book"
    "Calendar"
    "Contacts"
    "cfprefsd"
    "Dock"
    "Finder"
    "Mail"
    "Messages"
    "Safari"
    "SizeUp"
    "SystemUIServer"
    "Terminal"
    "Transmission"
    "iCal"
  )

  for i in "${applications[@]}"; do
    if [ "$DEBUG" != "Yes" ]; then
      killall "${i}" > /dev/null 2>&1
    else
      echo "Mock killing ${i}"
    fi
  done

}

ask_debug () {
    announce_step "Would you like to turn debug on?" 

    DEBUG=$(gum choose --header.foreground="$BORDER" --selected.foreground="$FOREGROUND" --cursor.foreground="$FOREGROUND" "No" "Yes")
}

####
# Main script starts here
####
 
main() {
  # Set Variables
  FOREGROUND="#7aa2f7"  
  BORDER="#ff87d7"
  DEBUG=""    

  # Housekeeping
  close_settings
  
  # Debugging
  ask_debug

  # Steps
  process_settings
  kill_with_fire
  
  # Finished
  announce_step "All Done!" 
  echo "Note: some of these changes require a logout/restart to take effect."
  exit 0
}
 
main 

