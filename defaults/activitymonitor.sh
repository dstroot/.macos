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
# NAME:           activitymonitor.sh
# PURPOSE:        Setup Activity Monitor
# VERSION:  1.0   Initial version
# ------------------------------------------------------------------------------

# echo "###############################################################################"
# echo "# Activity Monitor                                                            #"
# echo "###############################################################################"

# echo "Activity Monitor: Show the main window when launching Activity Monitor"
# defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
#
# echo "Activity Monitor: Visualize CPU usage in the Activity Monitor Dock icon"
# defaults write com.apple.ActivityMonitor IconType -int 5
#
# echo "Activity Monitor: Show all processes in Activity Monitor"
# defaults write com.apple.ActivityMonitor ShowCategory -int 0
#
# echo "Activity Monitor: Sort Activity Monitor results by CPU usage"
# defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
# defaults write com.apple.ActivityMonitor SortDirection -int 0
