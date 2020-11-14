#!/bin/zsh

########################################################################
#                        Outset Version - EA                           #
################### written by Phil Walker Nov 2020 ####################
########################################################################

if [[ -e "/usr/local/outset/outset" ]]; then
    # Check the version
    outsetVersion=$(/usr/local/outset/outset --version)
    echo "<result>${outsetVersion}</result>"
else
    echo "<result>Not Installed</result>"
fi
exit 0