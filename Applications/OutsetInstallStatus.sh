#!/bin/zsh

########################################################################
#                     Outset Install Status - EA                       #
################### written by Phil Walker Nov 2020 ####################
########################################################################

if [[ -e "/usr/local/outset/outset" ]]; then
    echo "<result>Installed</result>"
else
    echo "<result>Not Installed</result>"
fi
exit 0