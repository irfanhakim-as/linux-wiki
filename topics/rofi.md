# Rofi

## Description

A window switcher, Application launcher and dmenu replacement.

## Directory

- [Rofi](#rofi)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Use as Spotlight Alternative](#use-as-spotlight-alternative)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Configuration](#configuration)
    - [Description](#description-2)
    - [References](#references-1)
    - [Steps](#steps-1)

## References

- [Rofi](https://github.com/davatorium/rofi)

---

## Use as Spotlight Alternative

### Description

This installs Rofi and sets it up as a Spotlight equivalent.

> [!IMPORTANT]  
> This guide assumes that you are using KDE Plasma as your desktop environment.

### Steps

1. [Install](yay.md#install) the `rofi` package using `yay`.

2. Set a custom shortcut to launch Rofi:

   - Open the **System Settings** app.

   - Click **Shortcuts**.

   - Click **Custom Shortcuts**.

   - Right click an empty space and click **New** > **Global Shortcut** > **Command/URL**.

   - Name the shortcut (i.e. `Run rofi`).

   - Click **Trigger** and add a **Shortcut** (i.e. <kbd>Alt + Space</kbd>).

   - Under **Action**, add the **Command**, `rofi -show combi`.

---

## Configuration

### Description

This details a sample configuration and theme customisation to improve Rofi.

### References

- [DT Rofi config](https://gitlab.com/dwt1/dotfiles/-/tree/master/.config/rofi)

### Steps

1. Create Rofi's config and `themes` directories:

    ```sh
    mkdir -p ~/.config/rofi/themes
    ```

2. Create a theme file for Rofi:

   - Create a theme file named `dt-center.rasi`:

        ```sh
        nano ~/.config/rofi/themes/dt-center.rasi
        ```

   - Copy the content of the sample [dt-center.rasi](../attachments/dt-center.rasi) file and paste it into the theme file.

   - Make your own modifications and add in your own values to the theme file as you see fit, then save the file.

3. Create a configuration file named for Rofi:

   - Create a configuration file named `config.rasi`:

        ```sh
        nano ~/.config/rofi/config.rasi
        ```

   - Copy the content of the sample [config.rasi](../attachments/config.rasi) file and paste it into the configuration file.

   - Make your own modifications and add in your own values to the configuration file as you see fit, then save the file.

4. Make any desired changes to either the theme, `~/.config/rofi/themes/dt-center.rasi` or configuration file, `~/.config/rofi/config.rasi` accordingly.
