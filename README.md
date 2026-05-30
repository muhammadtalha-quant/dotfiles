# My OWN Dotfiles for Hyprland + Noctalia v5 + ArchLinux

## Installation
Following steps should be followed to install these configs. Unlike other configs where you install an OS and then install the config, this is a bit different, this config ships with `archinstall` json configs for quick and effortless install.

### Step 1
- Boot into already flashed archlinux live usb {minimal}
- Connect to wifi with `iwctl station wlan<id> connect <network-name>`, leave if you are connected with ethernet.
- To find your wlan id, type `iwctl station list`
- To find your network (just in case), type `iwctl station wlan<id> get-networks`
- After you connect to wifi, test your connection with `ping -c 5 google.com`
- Then after that run `sudo pacman -Sy archinstall archlinux-keyring git jq` to refresh package database for pacman and install some pre-requisites for the dotfile installation. 

### Step 2
- Clone the repository into the live session by `git clone https://github.com/muhammadtalha-quant/dotfiles.git`.
- Change directory to the freshly cloned repo with `cd dotfiles`
- Run `jq '.hostname = "host-name-of-your-choice"' config.json > config.json` to change your hostname.
- Run `lsblk` and find your storage device node, then run `jq '.disk_config.device_modifications.[0].device = "/dev/<target-device>"' config.json` to point to the correct storage device for installation
- Run `jq '.encryption_password = "disk-encryption-password-of-your-choice"' creds.json > creds.json` to change disk encryption password.
- Run `jq '."!root-password" = "root-password-of-your-choice"' creds.json > creds.json` to change root user password.
- Run `jq '.users.[0]."!password" = "user-password-of-your-choice"' creds.json > creds.json` to change your user password. This password will be used in logging into system.
- Run `jq '.users.[0].username = "username-of-your-choice"' creds.json > creds.json` to change your username.

### Step 3
- Run `archinstall --config config.json --creds creds.json` to begin the unattended installation of arch linux.
- When the installation is completed, select reboot to restart your system..

> [!NOTE]
> This will install minimal arch linux with hyprland on top.

### Step 4
- Open terminal using the key shown in hyprland generated message bar in the top.
- Run `chsh -s $(which fish)` to change shell from bash to fish.
- Run `git clone https://github.com/muhammadtalha-quant/dotfiles.git` to clone the dotfile repository again.
- Change directory to the freshly cloned repo with `cd dotfiles`
- Run `./bootstrap.fish` and then sit and provide password when prompted.
