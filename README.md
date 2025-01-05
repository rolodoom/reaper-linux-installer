# reaper-linux-installer

A lightweight Bash script to download and install REAPER on Linux, dynamically selecting the correct version and branch for a seamless setup.

This script downloads and installs the specified version of REAPER on a Linux system. It supports versions with or without a period (e.g., `729` or `7.29`).

## Status

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/rolodoom/reaper-linux-installer/master/LICENSE)

## Requirements

- A Linux-based operating system
- `wget`: The script uses `wget` to download the tarball.
- `tar`: The script uses `tar` to extract the downloaded archive.
- `sudo`: To install REAPER system-wide, the script requires `sudo` permissions.

## Usage

### Preparation

1. Clone this repository or copy the script to your local environment.
2. Make the script executable:

```bash
chmod +x install_reaper.sh
```

### Syntax

Run the script passing the version number of REAPER you want to install. You can provide the version with or without a period:

```bash
./install_reaper.sh <REAPER_VERSION>
```

Where `<REAPER_VERSION>` is the version number of REAPER you want to install.

- **Example 1**: Installing REAPER version `7.x` (e.g., `729`):

```bash
./install_reaper.sh 729
```

- **Example 2**: Installing a future REAPER version `10.x` (e.g., `1025`):

```bash
./install_reaper.sh 1025
```

### Options:

- `-h` or `--help`: Show usage instructions.

Example:

```bash
./install_reaper.sh -h
```

## Script Functionality

1. The script accepts the REAPER version as an argument.
2. It automatically determines the major version based on the first one or two digits:
   - For versions like `720`, it uses `7.x`.
   - For versions like `1025`, it uses `10.x`.
3. It downloads the requested version from REAPER's website.
4. The script installs REAPER on the system in the `/opt` directory and integrates it into the desktop environment.
5. After installation, the script cleans up any temporary files.

## Upgrade or Re-install REAPER

To upgrade or re-install a different version of REAPER, run the script again with a differente version value.

## Uninstall REAPER

To uninstall, you can use the following command that is included by default in REAPER:

```bash
sudo sh /opt/REAPER/uninstall-reaper.sh
```

## Bugs and Issues

Have a bug or an issue with this template? [Open a new issue](https://github.com/rolodoom/reaper-linux-installer/issues) here on GitHub.

## License

This code in this repository is released under the [MIT](https://raw.githubusercontent.com/rolodoom/reaper-linux-installer/master/LICENSE) license, which means you can use it for any purpose, even for commercial projects. In other words, do what you want with it. The only requirement with the MIT License is that the license and copyright notice must be provided with the software.
