#!/bin/bash

########################################################################
#          32-bit Applications Installed - Extention Attribute         #
########################################################################

########################################################################
#                            Variables                                 #
########################################################################

# OS version - amended to account for Big Sur
osShort=$(SYSTEM_VERSION_COMPAT=1 sw_vers -productVersion | awk -F. '{print $2}')
# Check for 32-bit Applications
# If running macOS Mojave or previous, exclude the system app InkServer.app and the system framework QuickLook which includes quicklookd32.app (both are 32-bit)
# Added additional exclusion for external disks for 10.14 as so many users have old crap on external disks
if [[ "$osShort" -le "14" ]]; then
    thirtyTwoBitApps=$(/usr/bin/mdfind "kMDItemExecutableArchitectures == 'i386' && kMDItemExecutableArchitectures != 'x86_64' && \
kMDItemKind == 'Application'" | grep -v "/System/Library/Input Methods/InkServer.app" | grep -v "/System/Library/Frameworks/QuickLook.framework/Versions/A/Resources/quicklookd32.app" | grep -v "/Volumes")
else
    thirtyTwoBitApps=$(/usr/bin/mdfind "kMDItemExecutableArchitectures == 'i386' && kMDItemExecutableArchitectures != 'x86_64' && kMDItemKind == 'Application'")
fi

########################################################################
#                         Script starts here                           #
########################################################################

if [[ "${thirtyTwoBitApps}" != "" ]]; then
    echo "<result>Yes</result>"
else
    echo "<result>No</result>"
fi
exit 0