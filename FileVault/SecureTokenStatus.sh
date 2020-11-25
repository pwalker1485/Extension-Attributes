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

echo "<result>"
for user in ${(f)userList}; do
    # Get users SecureToken Staus
    secureTokenStatus=$(sysadminctl -secureTokenStatus "$user" 2>&1)
    if [[ "$secureTokenStatus" =~ "ENABLED" ]]; then
        echo "${user}: SecureToken Found"
    fi
done
echo "</result>"