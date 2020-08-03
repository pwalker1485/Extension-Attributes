#!/bin/bash

########################################################################
#                   macOS Upgrade Pre Check Status                     #
################## Written by Phil Walker Sept 2019 ####################
########################################################################
# Modified June 2020

########################################################################
#                            Variables                                 #
########################################################################

# Get the logged in user
loggedInUser=$(stat -f %Su /dev/console)
# Check the logged in user has a local account (for 10.12 MacBooks only)
mobileAccount=$(dscl . -read /Users/"$loggedInUser" OriginalNodeName 2>/dev/null)
# Path to NoMAD Login AD bundle
noLoADBundle="/Library/Security/SecurityAgentPlugins/NoMADLoginAD.bundle"
# Installer location
macOSInstaller="/Applications/Install macOS Catalina.app"
# Required disk space
requiredSpace="15"
# OS version
osShort=$(/usr/bin/sw_vers -productVersion | awk -F. '{print $2}')

########################################################################
#                         Script starts here                           #
########################################################################

# Get available disk space
if [[ "$osShort" -eq "12" ]]; then
	freeSpace=$(/usr/sbin/diskutil info / | grep "Available Space" | awk '{print $4}')
else
  freeSpace=$(/usr/sbin/diskutil info / | grep "Free Space" | awk '{print $4}')
fi

if [ -z "$freeSpace" ]; then
  freeSpace="5"
fi

# Confirm there is enough disk space for the upgrade
if [[ ${freeSpace%.*} -ge ${requiredSpace} ]]; then
	spaceStatus="OK"
fi

# Confirm the installer is available
if [[ -d "$macOSInstaller" ]]; then
	catalinaInstaller="Found"
else
	catalinaInstaller="Not Found"
fi

# Get account status of logged in user (Local or Mobile)
if [[ "$mobileAccount" == "" ]]; then
	accountStatus="Local"
else
	accountStatus="Mobile"
fi

# Upgrade Status
if [[ "$osShort" -eq "14" ]]; then
	if [[ -d "$noLoADBundle" ]] && [[ "$accountStatus" == "Local" ]]; then
		if [[ "$spaceStatus" == "OK" ]] && [[ "$catalinaInstaller" == "Found" ]]; then
      		echo "<result>Upgrade Ready</result>"
    	else
      		echo "<result>Disk space:${freeSpace}GB | Installer:${catalinaInstaller} | Account status:${accountStatus}</result>"
		fi
	else
  		echo "<result>Disk space:${freeSpace}GB | Installer:${catalinaInstaller} | Account status:${accountStatus}</result>"
	fi
fi

if [[ "$osShort" -ge "15" ]]; then
  echo "<result>Not Required</result>"
elif [[ "$osShort" -le "11" ]] || [[ "$osShort" -eq "13" ]]; then
  if [[ "$spaceStatus" == "OK" ]] && [[ "$catalinaInstaller" == "Found" ]]; then
    echo "<result>Upgrade Ready</result>"
  else
    echo "<result>Disk space:${freeSpace}GB | Installer:${catalinaInstaller}</result>"
  fi
fi

exit 0
