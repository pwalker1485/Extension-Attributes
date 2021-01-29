#!/bin/zsh

########################################################################
#                     Rosetta 2 Install Status - EA                    #
#################### Written by Phil Walker Dec 2020 ###################
########################################################################

########################################################################
#                            Variables                                 #
########################################################################

# CPU Architecture
cpuArch=$(/usr/bin/arch)
# Rosetta 2 Launch Daemon
launchDaemon="/Library/Apple/System/Library/LaunchDaemons/com.apple.oahd.plist"

########################################################################
#                         Script starts here                           #
########################################################################

# Check the CPU architecture
if [[ "$cpuArch" != "arm64" ]]; then
    ### DEBUG
    #echo "Intel CPU detected, Rosetta 2 not required"
    rosettaStatus="Not Required"
else
    ### DEBUG
    #echo "Apple silicon Mac, checking Rosetta 2 install status"
    # Check for the Rosetta 2 Launch Daemon
    if [[ -f "$launchDaemon" ]]; then
        rosettaStatus="Installed"
    else
    	rosettaStatus="Not Installed"
    fi
fi
echo "<result>${rosettaStatus}</result>"
exit 0