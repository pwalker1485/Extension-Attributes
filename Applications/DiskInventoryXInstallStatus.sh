#!/bin/bash

########################################################################
#         Disk Inventory X Install Status - Extention Attribute        #
########################################################################

########################################################################
#                            Variables                                 #
########################################################################

diskInventoryX="/Users/admin/Applications/Disk Inventory X.app"

########################################################################
#                         Script starts here                           #
########################################################################

if [[ -d "$diskInventoryX" ]]; then
    echo "<result>Installed</result>"
else
    echo "<result>Not Installed</result>"
fi

exit 0