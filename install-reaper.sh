#!/bin/bash
#  _______   _______
# |  _____| |  ___  |
# | |       | |   | |    Rolando Ramos Torres (@rolodoom)
# | |       | |___| |    http://rolandoramostorres.com
# |_|       |_______|
#  _         _______     
# | |       |  ___  |
# | |       | |   | |    intall-reaper
# | |_____  | |___| |    Bash script to download and install REAPER on Linux.
# |_______| |_______|
# 
#

# Display usage/help if -h or --help is passed or if no argument is provided
if [ -z "$1" ] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  echo "Usage: $0 <REAPER_VERSION>"
  echo
  echo "This script downloads and installs REAPER on Linux."
  echo
  echo "Arguments:"
  echo "  <REAPER_VERSION>  The version of REAPER to install, with or without a period."
  echo "                    Example: 729 or 7.29 (both are accepted)."
  echo
  echo "Example:"
  echo "  $0 729"
  echo "  This will download and install REAPER version 7.x."
  echo
  exit 0
fi

# REAPER version passed by the user (remove any periods if present)
REAPER_VERSION="${1//./}"

# Check the number of digits and extract the correct major version
if [ ${#REAPER_VERSION} -gt 3 ]; then
  # For versions with 4 digits like 1025, we take the first two digits
  REAPER_MAJOR_VERSION="${REAPER_VERSION:0:2}"
else
  # For versions with 3 digits or less like 720, we take the first digit
  REAPER_MAJOR_VERSION="${REAPER_VERSION:0:1}"
fi

# Generate the REAPER_BRANCH based on the major version
REAPER_BRANCH="${REAPER_MAJOR_VERSION}.x"

# Download the requested version of REAPER
wget -O reaper.tar.xz "https://www.reaper.fm/files/${REAPER_BRANCH}/reaper${REAPER_VERSION}_linux_x86_64.tar.xz"

# Create the directory for installation
mkdir ./reaper

# Extract the downloaded tar archive into the installation directory
tar -C ./reaper -xf reaper.tar.xz

# Install REAPER
sudo ./reaper/reaper_linux_x86_64/install-reaper.sh --install /opt --integrate-desktop --usr-local-bin-symlink --quiet

# Clean up by removing both the extracted files and the source tar.xz file
rm -rf ./reaper
rm reaper.tar.xz
