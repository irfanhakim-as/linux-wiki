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
  - [Emoji Support](#emoji-support)
    - [Description](#description-3)
    - [Steps](#steps-2)
  - [Microsoft Fonts Support](#microsoft-fonts-support)
    - [Description](#description-4)
    - [Steps](#steps-3)
  - [Apple Fonts Support](#apple-fonts-support)
    - [Description](#description-5)
    - [References](#references-1)
    - [Steps](#steps-4)
  - [Improve Fonts Legibility](#improve-fonts-legibility)
    - [Description](#description-6)
    - [Steps](#steps-5)

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

    - General: `SF Pro Text 12pt`
    - Fixed width: `SF Mono Powerline 12pt`
    - Small: `SF Compact 10pt`
    - Toolbar: `SF Pro Display 12pt`
    - Menu: `SF Pro Display 12pt`
    - Window title: `SF Pro Display 12pt`

    You may adjust the font sizes to your liking.

4. Restart your system for the changes to take effect.

---

## Emoji Support

### Description

This details several configuration options for our desktop to use better looking fonts we have installed.

> [!IMPORTANT]
> This guide is redundant and **NOT** needed if you have completed the [Installation](#installation) and [Configuration](#configuration) sections.

### Steps

1. Install an emoji font package using `yay`.

    Install `ttf-twemoji` for Twitter emoji:

    ```sh
    yay -S ttf-twemoji
    ```

    Alternatively, install `ttf-apple-emoji` for Apple emoji:

    ```sh
    yay -S ttf-apple-emoji
    ```

2. Create the `fontconfig` directory if it's not available already:

    ```sh
    mkdir -p ~/.config/fontconfig
    ```

3. Update or create a new `fonts.conf` file in the `fontconfig` directory.

    > [!IMPORTANT]
    > Backup the existing `fonts.conf` file if any.

    ```sh
    nano ~/.config/fontconfig/fonts.conf
    ```

    Sample `fonts.conf` configuration for Twitter emoji:

    ```conf
    <?xml version='1.0'?>
    <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
    <fontconfig>
        <alias>
            <family>sans-serif</family>
            <prefer>
                <family>Noto Sans</family>
                <family>Twemoji</family>
                <family>Noto Color Emoji</family>
                <family>Noto Emoji</family>
            </prefer>
        </alias>
        <alias>
            <family>serif</family>
            <prefer>
                <family>Noto Serif</family>
                <family>Twemoji</family>
                <family>Noto Color Emoji</family>
                <family>Noto Emoji</family>
            </prefer>
        </alias>
        <alias>
            <family>monospace</family>
            <prefer>
                <family>Noto Mono</family>
                <family>Twemoji</family>
                <family>Noto Color Emoji</family>
                <family>Noto Emoji</family>
            </prefer>
        </alias>
    </fontconfig>
    ```

    Alternatively, this is a sample `fonts.conf` configuration for Apple emoji:

    ```conf
    <?xml version='1.0'?>
    <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
    <fontconfig>
        <alias>
            <family>sans-serif</family>
            <prefer>
                <family>Noto Sans</family>
                <family>Apple Color Emoji</family>
                <family>Noto Color Emoji</family>
                <family>Noto Emoji</family>
            </prefer>
        </alias>
        <alias>
            <family>serif</family>
            <prefer>
                <family>Noto Serif</family>
                <family>Apple Color Emoji</family>
                <family>Noto Color Emoji</family>
                <family>Noto Emoji</family>
            </prefer>
        </alias>
        <alias>
            <family>monospace</family>
            <prefer>
                <family>Noto Mono</family>
                <family>Apple Color Emoji</family>
                <family>Noto Color Emoji</family>
                <family>Noto Emoji</family>
            </prefer>
        </alias>
    </fontconfig>
    ```

4. Refresh the font cache:

    ```
    fc-cache -f -v
    ```

5. Log out and log back into the desktop.

---

## Microsoft Fonts Support

### Description

This details how to install and set up Microsoft Windows fonts on Linux.

> [!IMPORTANT]
> This guide is redundant and **NOT** needed if you have completed the [Installation](#installation) and [Configuration](#configuration) sections.

### Steps

1. Install Windows 10 fonts:

    ```sh
    yay -S ttf-ms-win10-auto
    ```

2. Fix anti-aliasing issue with the Calibri font (looks pixelated by default).

    Create or update the `fonts.conf` file in the `fontconfig` directory:

    ```sh
    nano ~/.config/fontconfig/fonts.conf
    ```

    Add the following `match` block to the end of the `fonts.conf` file just before the closing of the `fontconfig` tag:

    ```conf
    <match target="font">
        <edit name="embeddedbitmap" mode="assign">
            <bool>false</bool>
        </edit>
    </match>
    ```

3. Log out and log back into the desktop.

---

## Apple Fonts Support

### Description

This details how to install and set up Apple macOS fonts on Linux.

> [!IMPORTANT]
> This guide is redundant and **NOT** needed if you have completed the [Installation](#installation) and [Configuration](#configuration) sections.

### References

- [apple-fonts](https://aur.archlinux.org/packages/apple-fonts)
- [Fonts for Apple platforms](https://developer.apple.com/fonts)

### Steps

1. Install Apple fonts:

    ```sh
    yay -S apple-fonts
    ```

2. Set our `fonts.conf` config to use Apple fonts.

    Create or update the `fonts.conf` file in the `fontconfig` directory:

    ```sh
    nano ~/.config/fontconfig/fonts.conf
    ```

    Replace the first preferred fonts of each `family` block in our config to `SF Pro Text`, `New York`, and `SF Mono`:

    ```conf
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
            <family>SF Mono</family>
            <family>Apple Color Emoji</family>
            <family>Noto Color Emoji</family>
            <family>Noto Emoji</family>
        </prefer>
    </alias>
    ```

3. Log out and log back into the desktop.

---

## Improve Fonts Legibility

### Description

This improves how fonts and texts are rendered to make them clearer and more legible. Note that this might break Apple fonts/emoji.

> [!WARNING]  
> This might break certain fonts including Apple fonts/emoji recommended by this wiki, more testing is needed!

> [!NOTE]  
> This guide assumes that you are using KDE Plasma as your desktop environment.

### Steps

1. Launch the **System Settings** application.

2. Click the **Appearance** category.

3. Click **Fonts**.

4. Configure the following settings as such:

    ```
    ✅ Enable Anti-Aliasing
    Sub-pixel rendering: RGB
    Hinting: Full
    ```

5. Click the **Apply** button.
