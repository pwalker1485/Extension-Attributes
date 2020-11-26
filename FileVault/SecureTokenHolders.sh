#!/bin/zsh

########################################################################
#                      Secure Token Status - EA                        #
################### written by Phil Walker Nov 2020 ####################
########################################################################

########################################################################
#                            Variables                                 #
########################################################################

# Get a list of users and include the management account
userList=$(dscl . -list /Users | grep -v "^_\|daemon\|nobody\|root")

########################################################################
#                         Script starts here                           #
########################################################################

for user in ${(f)userList}; do
    # Get users SecureToken Staus
    secureTokenStatus=$(sysadminctl -secureTokenStatus "$user" 2>&1)
    if [[ "$secureTokenStatus" =~ "ENABLED" ]]; then
        secureTokenUsers+=($user)
    fi
done
if [[ -z "${secureTokenUsers[@]}" ]]; then
    echo "<result>No Users</result>"
else
    echo "<result>${secureTokenUsers[@]}</result>"
fi
exit 0