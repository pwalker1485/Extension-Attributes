#!/bin/zsh

########################################################################
#                      Sophos Endpoint Version - EA                    #
########################################################################

versionInstalled="Not Installed"
if [[ -d "/Applications/Sophos Endpoint.app" ]] || [[ -d "/Applications/Sophos/Sophos Endpoint.app" ]]; then
    # Check the version
    versionInstalled=$(defaults read "/Library/Sophos Anti-Virus/product-info" ProductVersion)
fi
echo "<result>${versionInstalled}</result>"