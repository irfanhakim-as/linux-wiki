# Alacritty

## Description

Alacritty is a modern terminal emulator that comes with sensible defaults, but allows for extensive configuration.

## Directory

- [Alacritty](#alacritty)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Set as Default Terminal](#set-as-default-terminal)
    - [Description](#description-1)
    - [Steps](#steps)

## References

- [Alacritty](https://github.com/alacritty/alacritty)

---

## Set as Default Terminal

### Description

This installs and sets up Alacritty as the default terminal.

> [!IMPORTANT]  
> This guide assumes that you are using the KDE Plasma desktop environment.

### Steps

1. Install `alacritty`, `tmux`, and `wmctrl` using `yay`:

    ```sh
    yay -S alacritty tmux wmctrl
    ```

2. Set a custom shortcut to launch Alacritty:

    - Open the **System Settings** app.

    - Click **Shortcuts**.

    - Click **Custom Shortcuts**.

    - Right click an empty space and click **New** > **Global Shortcut** > **Command/URL**.

    - Name the shortcut (i.e. **Run alacritty**).

    - Click **Trigger** and add a **Shortcut** (i.e. <kbd>Ctrl + Alt + T</kbd>).

    - Under **Action**, add the **Command**, `wmctrl -x -a "alacritty" || alacritty -e tmux`. This will launch Alacritty if it's not running, or switch to it if it is.
