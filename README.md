# My Installer Script

This repository hosts the "My Installer" script, a versatile Bash script designed to facilitate the installation of multiple software tools on Linux systems. Created by Tvanbael, this script is particularly useful for setting up a new machine with essential tools like Ghidra, Obsidian, BurpSuite Pro, and Others Tools.


[](https://github.com/Ardcord/My_installer/assets/93101315/8f49cb78-d5ff-43f3-9299-813a2081583d)



## Features

    Root Verification: Ensures the script is run with root privileges for proper installations.
    Dynamic Menu System: Offers an interactive menu for selecting which tools to install.
    Custom Install Paths: Automatically sets up installation directories within the user's home directory.
    Automatic Downloads: Handles the downloading of Ghidra, OpenJDK 17, and more to come.
    Easy Configuration: Adds paths to the user's .zshrc for immediate tool availability.

    New feature: Auto-update whith "My_Installer.sh -u"

## Prerequisites

    Linux OS
    wget, unzip, and tar utilities for handling downloads and extractions.
    Root or sudo access.

## Getting Started

  To use the installer script, follow these simple steps:

  1. Clone the repository or download the installer.sh script directly.

    git clone https://github.com/YourUsername/YourRepositoryName.git

  or

    curl -O https://raw.githubusercontent.com/YourUsername/YourRepositoryName/main/installer.sh

  2. Make the script executable.

    chmod +x installer.sh

  3. Run the script with root privileges.

    sudo ./installer.sh

  4. Follow the interactive menu to select and install your desired tools.


## Customization

  You can easily extend the script to include more tools. Just add new tool variables, update the toggle functions, and modify the start_install function to handle the new tool installations.
  Contributing

  Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

    Fork the Project
    Create your Feature Branch (git checkout -b feature/AmazingFeature)
    Commit your Changes (git commit -m 'Add some AmazingFeature')
    Push to the Branch (git push origin feature/AmazingFeature)
    Open a Pull Request


## Acknowledgements

    National Security Agency (NSA) for Ghidra.
    PortSwigger Web Security for Burp Suite Pro.
    The developers and contributors of Obsidian.
