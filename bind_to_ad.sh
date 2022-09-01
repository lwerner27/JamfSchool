#!/bin/bash

# WHAT:
# A script for binding macOS devies to AD with a set of common configurations

# Get the computer name
computerName="$(scutil --get LocalHostName)"

# The username and password to authenticate against against AD with
username='Administrator'
password='password123'

# OU DN path
ou='CN=Computers,DC=DOMAIN,DC=COM'

# The FQDN (or IP address) of the domain you are trying to join
domain='domain.com'

# Enable or Disable Mobile Acounts
# Options: enable OR disable
mobile='enable'

# Enable or Disalbe the confirmation before a mobile account is created. 
# Options: enable OR disable
mobileconfirm='disable'

# Set which shell to use for the terminal
shell='/bin/bash'

# Domain groups that should have Admin access
groups='Domain Admins, Enterprise Admins'

# Set whether or not to create a local home directory 
# NOTE: requires 'enable' when mobile is also enabled 
localHome='enable'

# Binds the Computer to AD
/usr/sbin/dsconfigad \
    -a $computerName \
    -u $username \
    -p $password \
    -ou $ou \
    -domain $domain \
    -mobile $mobile \
    -mobileconfirm $mobileconfirm \
    -shell $shell \
    -groups $groups \
    -localhome $localHome 