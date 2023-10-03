#!/bin/bash

# Function to update the server
update_server() {
    echo "Updating package lists..."
    sudo apt update

    echo "Upgrading packages..."
    sudo apt upgrade -y

    # Optionally, remove old packages (clean up)
    echo "Removing old packages..."
    sudo apt autoremove -y

    # Optionally, clear the package cache
    echo "Clearing package cache..."
    sudo apt clean

    # Optionally, reboot the server if required
    # echo "Rebooting the server..."
    # sudo reboot
}

# Main script
echo "Starting server update..."

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# Call the update_server function
update_server

echo "Server update completed successfully."
