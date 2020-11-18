#!/bin/bash

########################################################################
#                   FileVault Status (On or Off)                       #
########################################################################

fvStatus=$(fdesetup status | awk '/FileVault is/{print $3}' | tr -d .)

echo "<result>$fvStatus</result>"

exit 0