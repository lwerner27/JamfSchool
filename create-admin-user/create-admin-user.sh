#!/bin/bash

# Set variables
userName="newAdminUser"     # The username for the new user
password="P@ssw0rd"         # The password for the new user
realName="New Admin User"   # The user real name

# Find the next available user ID
maxid=$(dscl . -list /Users UniqueID | awk '{print $2}' | sort -ug | tail -1)
newUID=$((maxid+1))

# Create a new admin user
dscl . -create /Users/$userName
dscl . -create /Users/$userName UserShell /bin/bash
dscl . -create /Users/$userName RealName "$realName"
dscl . -create /Users/$userName UniqueID "$newUID"
dscl . -create /Users/$userName PrimaryGroupID 80
dscl . -create /Users/$userName NFSHomeDirectory /Users/$userName
dscl . -passwd /Users/$userName $password

# Create home directory
mkdir /Users/$userName
chown $userName:staff /Users/$userName

# Add user to admin group
dscl . -append /Groups/admin GroupMembership $userName

echo "New admin user $userName created with UID $newUID."
