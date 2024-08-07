# Wayland

## Description

Wayland is a replacement for the X11 window system protocol and architecture with the aim to be easier to develop, extend, and maintain. Wayland is the language (protocol) that applications can use to talk to a display server in order to make themselves visible and get input from the user (a person).

## Directory

- [Wayland](#wayland)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Fix Keys Activating When Switching Tasks](#fix-keys-activating-when-switching-tasks)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Identifying Apps Running Xwayland](#identifying-apps-running-xwayland)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)

## References

- [Wayland](https://wayland.freedesktop.org)
- [Wayland (Wikipedia)](https://en.wikipedia.org/wiki/Wayland_(protocol))
- [Wayland (ArchWiki)](https://wiki.archlinux.org/title/Wayland)

---

## Fix Keys Activating When Switching Tasks

> [!IMPORTANT]  
> This guide assumes that you are using the KDE Plasma desktop environment on Wayland.

### Description

This details how to fix a bug where keys are unexpectedly activating in the last focused (Xwayland) application window when switching tasks using the task switcher on KDE Plasma.

### References

- [Alt tab problem with Fedora KDE](https://discuss.kde.org/t/alt-tab-problem-with-fedora-kde/17280/1)

### Steps

1. Launch the **System Settings** application.

2. Scroll down to the **Security & Privacy** section and click the **Application Permissions** menu item.

3. In the Application Permissions page, navigate to the **Legacy X11 App Support** menu.

4. In the Legacy X11 App Support page, set the following setting to the corresponding value:

    - Allow legacy X11 apps to read keystrokes typed in all apps: `Never`

5. Click the **Apply** button.

---

## Identifying Apps Running Xwayland

> [!IMPORTANT]  
> This guide assumes that you are using the KDE Plasma desktop environment on Wayland.

### Description

This details how to identify apps running using Xwayland on Wayland.

### References

- [Detect Xwayland applications visually](https://wiki.archlinux.org/title/Wayland#Detect_Xwayland_applications_visually)

### Steps

1. [Install](yay.md#install) the `xorg-xlsclients` package using `yay`.

2. Run the following command to list down all applications running via Xwayland:

    ```sh
    xlsclients -l
    ```

    **Alternatively**, KDE Plasma Desktop (or Kwin) users on Wayland could use the following command instead without requiring the `xorg-xlsclients` package:

    ```sh
    qdbus6 org.kde.KWin /KWin org.kde.KWin.showDebugConsole
    ```
