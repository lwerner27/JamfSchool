#!/bin/bash

# WHAT:
# A script for binding macOS devies to AD with a set of common configurations

# Binds the Computer to AD
/usr/sbin/dsconfigad \
    -a "$(scutil --get LocalHostName)" \
    -u "username" \                                 # Username of the user with permission to bind to AD
    -p "password" \                                 # Binding Users password
    -ou "CN=Computers, DC=DOMAIN, DC=COM" \         # Distinguished name for the OU where the device should be located in AD
    -domain "domain.com" \                          # Full Qualified Domain Name for the AD
    -mobile "enable" \                              # Enable mobile accounts for users, options: enable or disable 
    -mobileconfirm "disable" \                      # Enable or Disable confirmation before a mobile account is created, options: enable or disable 
    -shell "/bin/bash" \                            # Specify the default shell for the terminal to use
    -groups "Domain Admins, Enterprise Admins" \    # Names of groups that should have admin access when they login 
    -localhome "enable"                             # Enable local home directories, enable is required if using mobile accounts, options: enable or disable