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
# NAME:           dock_functions.sh
# PURPOSE:        Setup dock
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

# https://github.com/rpavlick/add_to_dock
# https://gist.github.com/kamui545/c810eccf6281b33a53e094484247f5e8

function add_app_to_dock {
    app_name="${1}"
    app_path=""

    # places to look for an application
    declare -a paths=(
    "/System/Cryptexes/App/System/Applications/"
    "/Applications"
    "$HOME/Applications"
    "/System/Applications"
    "/System/Applications/Utilities"
    );

    # check the paths for the app
    for path in "${paths[@]}"; do
        app=$(ls "${path}" | grep -o "${app_name}.app" | uniq | sort | head -n1)
        if [[ -n "${app}" ]]; then
            app_path="${path}/${app}"
        fi
    done

    if open -Ra "${app_path}"; then
        defaults write com.apple.dock persistent-apps -array-add "<dict>
            <key>tile-data</key>
            <dict>
                <key>file-data</key>
                <dict>
                    <key>_CFURLString</key>
                    <string>${app_path}</string>
                    <key>_CFURLStringType</key>
                    <integer>0</integer>
                </dict>
            </dict>
        </dict>"

        echo "Dock: $app_path added to the Dock."
    else
        echo "ERROR: Application $1 not found." 1>&2
    fi
}

# adds a folder to macOS Dock
# usage: add_folder_to_dock "Folder Path" -a n -d n -v n
# example: add_folder_to_dock "~/Downloads" -a 2 -d 0 -v 1
# key:

# -a or --arrangement
#   1 -> Name
#   2 -> Date Added
#   3 -> Date Modified
#   4 -> Date Created
#   5 -> Kind

# -d or --displayAs
#   0 -> Stack
#   1 -> Folder

# -v or --showAs
#   0 -> Automatic
#   1 -> Fan
#   2 -> Grid
#   3 -> List

function add_folder_to_dock {
    folder="${1}"
    arrangement="1"
    displayAs="0"
    showAs="0"

    while [[ "$#" -gt 0 ]]; do
        case $1 in
            -a|--arrangement)
                if [[ $2 =~ ^[1-5]$ ]]; then
                    arrangement="${2}"
                fi
                ;;
            -d|--displayAs)
                if [[ $2 =~ ^[0-1]$ ]]; then
                    displayAs="${2}"
                fi
                ;;
            -v|--showAs)
                if [[ $2 =~ ^[0-3]$ ]]; then
                    showAs="${2}"
                fi
                ;;
        esac
        shift
    done

    if [ -d "$folder" ]; then
        defaults write com.apple.dock persistent-others -array-add "<dict>
            <key>tile-data</key>
            <dict>
                <key>arrangement</key>
                <integer>${arrangement}</integer>
                <key>displayas</key>
                <integer>${displayAs}</integer>
                <key>file-data</key>
                <dict>
                    <key>_CFURLString</key>
                    <string>file://${folder}</string>
                    <key>_CFURLStringType</key>
                    <integer>15</integer>
                </dict>
                <key>file-type</key>
                <integer>2</integer>
                <key>showas</key>
                <integer>${showAs}</integer>
            </dict>
            <key>tile-type</key>
            <string>directory-tile</string>
        </dict>"

        echo "Dock: $folder added to the Dock."
    else
        echo "ERROR: Folder $folder not found."
    fi
}

# adds an empty space to macOS Dock
function add_spacer_to_dock {
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
}

# adds an empty small space to macOS Dock
function add_small_spacer_to_dock {
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'
}

function clear_apps_from_dock {
    defaults delete com.apple.dock persistent-apps
}

function clear_others_from_dock {
    defaults delete com.apple.dock persistent-others
}

# removes all icons from macOS Dock
function clear_dock {
    clear_apps_from_dock
    clear_others_from_dock
}

# reset macOS Dock to default settings
function reset_dock {
  defaults delete com.apple.dock
  killall Dock
}

function disable_recent_apps_from_dock {
    defaults write com.apple.dock show-recents -bool false
}

function enable_recent_apps_from_dock {
    defaults write com.apple.dock show-recents -bool true
}
