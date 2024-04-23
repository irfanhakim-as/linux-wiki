# Fish

## Description

Fish is a smart and user-friendly command line shell for macOS, Linux, and the rest of the family.

## Directory

- [Fish](#fish)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [Installation](#installation)
    - [Make Default](#make-default)
  - [Configuration](#configuration)
    - [Description](#description-2)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [fish-shell](https://github.com/fish-shell/fish-shell)
- [fish shell](https://fishshell.com)

---

## Setup

### Description

This details the installation of the Fish shell and making it the default shell for the user.

### Installation

1. [Install](yay.md#install) the **Fish** (`fish`) package using `yay`.

### Make Default

1. Verify where the Fish shell is installed to by running:

    ```sh
    which fish
    ```

    This should output the full path to the Fish shell, such as `/usr/bin/fish`.

2. Check if the path to the Fish shell is listed in `/etc/shells` by running:

    ```sh
    cat /etc/shells
    ```

    If the path is not listed, add it to the file by running:

    ```sh
    echo "$(which fish)" | sudo tee -a /etc/shells
    ```

    Enter your `sudo` password when prompted.

3. Change your default shell to Fish by running:

    ```sh
    chsh -s "$(which fish)"
    ```

4. Restart your terminal or desktop to apply the changes.

---

## Configuration

### Description

This details an example, ideal configuration or profile for the Fish shell.

### References

- [DTOS config.fish](https://gitlab.com/dwt1/dotfiles/-/blob/2a687641af1fa4e31e080960e0b6a5f3d21d759d/.config/fish/config.fish)

### Steps

1. Create the Fish configuration directory (if not already exists) by running:

    ```sh
    mkdir -p ~/.config/fish
    ```

2. Create a backup of the existing Fish configuration file by running:

    ```sh
    mv ~/.config/fish/config.fish ~/.config/fish/config.fish.bak
    ```

3. Create a new Fish configuration file by running:

    ```sh
    nano ~/.config/fish/config.fish
    ```

    Copy the content of the sample [config.fish](../attachments/config.fish) file and paste it into the new fish configuration file.

4. Make your own modifications and add in your own values to the configuration file as you see fit, then save the file.

    As it is, the configuration requires some dependencies that need to be [installed](yay.md#install) first, including:

    - [`podman`](podman.md#installation) and/or [`docker`](docker.md#setup)
    - `nano`
    - `vim`
    - `git`
    - `bat`
    - `lolcat`
    - `eza`
    - [`yay`](yay.md#installation)
    - [`flatpak`](flatpak.md#setup)
    - [`distrobox`](distrobox.md#installation)
    - `neofetch`
    - `python-virtualenv`
    - `rsync`
    - `shell-color-scripts`
    - `starship`
    - `visual-studio-code-bin` ([`yay`](yay.md#install)) or `com.visualstudio.code` ([`flatpak`](flatpak.md#install)) (Optional)
    - `kubectl` (Optional)
    - `arch-wiki-docs` and `arch-wiki-lite` (Optional)
    - `helm` (Optional)
    - `yt-dlp` (Optional)
    - `tmux` (Optional)
    - [`miniconda3`](python.md#miniconda-environments) (Optional)

5. Restart your terminal or reload the new configuration to apply the changes:

    ```sh
    source ~/.config/fish/config.fish
    ```
