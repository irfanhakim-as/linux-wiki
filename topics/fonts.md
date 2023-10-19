# Fonts

## Description

This guide seeks to add more fonts and use better fonts for our desktop.

> [!IMPORTANT]  
> This guide assumes that you are using KDE Plasma as your desktop environment.

## Directory

- [Fonts](#fonts)
  - [Description](#description)
  - [Directory](#directory)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references)
    - [Steps](#steps)
  - [Configuration](#configuration)
    - [Description](#description-2)
    - [Steps](#steps-1)

---

## Installation

### Description

This details where we could get the fonts we need and how to install them.

### References

- [irfanhakim-as/fonts](https://github.com/irfanhakim-as/fonts)

### Steps

1. Clone the `fonts` repo:

    ```sh
    git clone https://github.com/irfanhakim-as/fonts.git
    ```

2. Enter the repository:

    ```sh
    cd fonts
    ```

3. Run the installer script to install the fonts:

    ```sh
    ./install.sh
    ```

---

## Configuration

### Description

This details several configuration options for our desktop to use better looking fonts we have installed.

### Steps

1. Create a backup the original fontconfig `fonts.conf` (if any) to somewhere safe (i.e. `~/Backups`):

    ```sh
    cp ~/.config/fontconfig/fonts.conf ~/Backups/fonts.conf.bak
    ```

2. Create a new `fonts.conf` file:

    ```sh
    nano ~/.config/fontconfig/fonts.conf
    ```

    The content of the new `fonts.conf` file:

    ```conf
    <?xml version='1.0'?>
    <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
    <fontconfig>
        <alias>
            <family>sans-serif</family>
            <prefer>
                <family>SF Pro Text</family>
                <family>Apple Color Emoji</family>
                <family>Noto Color Emoji</family>
                <family>Noto Emoji</family>
            </prefer>
        </alias>
        <alias>
            <family>serif</family>
            <prefer>
                <family>New York</family>
                <family>Apple Color Emoji</family>
                <family>Noto Color Emoji</family>
                <family>Noto Emoji</family>
            </prefer>
        </alias>
        <alias>
            <family>monospace</family>
            <prefer>
                <family>SF Mono Powerline</family>
                <family>Apple Color Emoji</family>
                <family>Noto Color Emoji</family>
                <family>Noto Emoji</family>
            </prefer>
        </alias>
        <match target="font">
            <edit mode="assign" name="embeddedbitmap">
                <bool>false</bool>
            </edit>
        </match>
        <dir>~/.fonts</dir>
    </fontconfig>
    ```

3. Edit the fonts used in the **System Settings** app under **Appearance** > **Fonts**:

        General: SF Pro Text 12pt
        Fixed width: SF Mono Powerline 12pt
        Small: SF Compact 10pt
        Toolbar: SF Pro Display 12pt
        Menu: SF Pro Display 12pt
        Window title: SF Pro Display 12pt

    You may adjust the font sizes to your liking.

4. Restart your system for the changes to take effect.
