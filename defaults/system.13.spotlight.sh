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
# NAME:           system.8.spotlight.sh
# PURPOSE:        System Settings Spotlight
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

# echo "Spotlight: Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed before."
# # NOTE: Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
# sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# echo "Spotlight: Change indexing order and disable some search results"
# defaults write com.apple.spotlight orderedItems -array \
# 	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
# 	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
# 	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
# 	'{"enabled" = 1;"name" = "PDF";}' \
# 	'{"enabled" = 1;"name" = "FONTS";}' \
# 	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
# 	'{"enabled" = 0;"name" = "MESSAGES";}' \
# 	'{"enabled" = 0;"name" = "CONTACT";}' \
# 	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
# 	'{"enabled" = 0;"name" = "IMAGES";}' \
# 	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
# 	'{"enabled" = 0;"name" = "MUSIC";}' \
# 	'{"enabled" = 0;"name" = "MOVIES";}' \
# 	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
# 	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
# 	'{"enabled" = 0;"name" = "SOURCE";}' \
# 	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
# 	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
# 	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
# 	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
# 	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
# 	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'

# echo "Spotlight: Load new settings before rebuilding the index"
# killall mds > /dev/null 2>&1

# echo "Spotlight: Make sure indexing is enabled for the main volume"
# sudo mdutil -i on / > /dev/null

# echo "Spotlight: Rebuild the index from scratch"
# sudo mdutil -E / > /dev/null

echo "Disable Help Apple Improve Search"
defaults write "com.apple.assistant.support" "Search Queries Data Sharing Status" '2'


# # Sequoia 
# defaults write "com.apple.Spotlight" "orderedItems" '( \
# 	{enabled=1;name=APPLICATIONS;}, \
# 	{enabled=0;name="MENU_EXPRESSION";}, \
# 	{enabled=0;name=CONTACT;}, \
# 	{enabled=0;name="MENU_CONVERSION";}, \
# 	{enabled=0;name="MENU_DEFINITION";}, \
# 	{enabled=1;name=DOCUMENTS;}, \
# 	{enabled=0;name="EVENT_TODO";}, \
# 	{enabled=1;name=DIRECTORIES;}, \
# 	{enabled=0;name=FONTS;}, \
# 	{enabled=0;name=IMAGES;}, \
# 	{enabled=0;name=MESSAGES;}, \
# 	{enabled=0;name=MOVIES;}, \
# 	{enabled=0;name=MUSIC;}, \
# 	{enabled=0;name="MENU_OTHER";}, \
# 	{enabled=1;name=PDF;}, \
# 	{enabled=0;name=PRESENTATIONS;}, \
# 	{enabled=0;name="MENU_SPOTLIGHT_SUGGESTIONS";}, \
# 	{enabled=1;name=SPREADSHEETS;}, \
# 	{enabled=0;name="SYSTEM_PREFS";}, \
# 	{enabled=0;name=TIPS;},{ \
# 	enabled=0;name=BOOKMARKS;}, \
# )'