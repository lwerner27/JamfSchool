#!/bin/bash

# WHAT: 
# This is a script that will download and install python3

# Download Location 
pythonLocation="https://www.python.org/ftp/python/3.10.6/python-3.10.6-macos11.pkg"

# Output File
outputFile="/private/tmp/PythonInstaller.pkg"

# Download the python installer
curl -X GET $pythonLocation -sS -o $outputFile

# Run the Python Installer
installer -pkg $outputFile -target /

# Cleanup Installer
rm -rf $outputFile