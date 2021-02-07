#!/bin/zsh

########################################################################
#   Find all inactive versions of Oracle Java Development Kit 8 - EA   #
################## Written by Phil Walker June 2019 ####################
########################################################################
# Edit Jan 2021

########################################################################
#                            Variables                                 #
########################################################################

jdk8Check=$(find /Library/Java/JavaVirtualMachines/ -iname "*jdk1.8*" -maxdepth 1 | awk 'END {print NR}')

########################################################################
#                         Script starts here                           #
########################################################################

if [[ "$jdk8Check" -gt "0" ]]; then
    # Get the active version of Java
    activeJDK=$(java -version 2>&1 | head -n 1 | awk -F '"' '{print $2}')
    # Check for additional versions of Oracle Java Development Kit 8
    jdk8Previous=$(find /Library/Java/JavaVirtualMachines/ -iname "*jdk1.8*" -maxdepth 1 | awk -F/ '{print $NF}' | sed -e 's/jdk//' -e 's/.jdk//' \
    | grep -v "$activeJDK" | sort -u)
    if [[ "$jdk8Previous" == "" ]]; then
        echo "<result>None</result>"
    else
        echo "<result>$jdk8Previous</result>"
    fi
else
    echo "<result>None</result>"
fi
exit 0