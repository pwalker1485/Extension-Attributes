#!/bin/bash

########################################################################
#               Legacy Java Status - Extension Attribute               #
################## Written by Phil Walker Aug 2020 #####################
########################################################################

########################################################################
#                            Variables                                 #
########################################################################

# Legacy Java
legacyJava="/Library/Java/JavaVirtualMachines/1.6.0.jdk"

########################################################################
#                         Script starts here                           #
########################################################################

if [[ -d "$legacyJava" ]]; then
    echo "<result>Installed</result>"
else
    echo "<result>Not Installed</result>"
fi
exit 0