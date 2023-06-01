# macOS New Admin User Creation Script

This script creates a new admin user on macOS and assigns a unique ID.

## Prerequisites

You must have root access on the macOS system where you intend to run this script. The script should be run in Terminal.

## Usage

1. Open Terminal.

2. Save the script into a file named `create_admin.sh` (or another name of your choice) on your macOS system.

3. Edit the following variables in the script to fit your needs:
    - `userName`: Desired username for the new admin user.
    - `password`: Desired password for the new admin user. 
    - `realName`: The real name of the new admin user.

4. Change the permissions of the script file to make it executable:

    ```bash
    chmod +x /path/to/create_admin.sh
    ```

5. Run the script with root privileges:

    ```bash
    sudo sh /path/to/create_admin.sh
    ```

    Be sure to replace `/path/to/create_admin.sh` with the actual path where you saved the script.

## Disclaimer

Please use this script responsibly. Misuse of this script could result in severe damage to your macOS system. 

Creating a user with administrative privileges should be done carefully, as this allows the user to make significant changes to the system. 

Always ensure that the password you set for the new admin user is secure.