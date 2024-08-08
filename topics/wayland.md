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
  - [Fix Firefox Crashes](#fix-firefox-crashes)
    - [Description](#description-3)
    - [Steps](#steps-2)
  - [Fix Picture in Picture](#fix-picture-in-picture)
    - [Description](#description-4)
    - [References](#references-3)
    - [Steps](#steps-3)

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
> This guide assumes that your system runs on Wayland.

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

---

## Fix Firefox Crashes

> [!IMPORTANT]  
> This bug at the moment seems to affect Firefox 129.0 on a Wayland system with NVIDIA hardware. Follow this guide only if it affects your system.

### Description

This details how to work around a bug where Firefox keeps crashing on a Wayland system with NVIDIA hardware.

### Steps

1. Launch the **Firefox** application.

2. Click the **Hamburger** menu found on the top right of the window.

3. Click the **Settings** menu item.

4. In the **Find in Settings** search bar, search for `hardware acceleration`.

5. Under **Performance**, configure the following settings:

   - Use recommended performance settings: `Disabled`

   - Use hardware acceleration when available: `Disabled`

    > [!NOTE]  
    > These settings should be re-enabled after an actual fix has been released for performance gains.

6. Restart the **Firefox** application.

---

## Fix Picture in Picture

> [!IMPORTANT]  
> This guide assumes that you are using the KDE Plasma desktop environment on Wayland.

### Description

The Picture in Picture (PiP) feature currently has issues where its window would not remember its last position and it would not be pinned on top of other windows by default. This details how to work around the latter bug.

### References

- [Firefox Wayland PiP workaround or How I Learned to Stop Clicking Keep Above and Love Window Rules](https://www.reddit.com/r/kde/comments/osjt3p/firefox_wayland_pip_workaround_or_how_i_learned)

### Steps

1. In a supported application i.e. Firefox, play a video in **PiP** mode.

2. Right click the **PiP** window to get the context menu.

3. In the context menu, hover over the **More Actions** menu item and select the **Configure Special Window Settings...** option.

4. In the newly opened **Window Rules** window, click the **Add Property...** button.

5. Select the **Window title** option.

6. From the new **Window title** line, expand the dropdown which defaults to `Unimportant` and select the `Exact Match` option.

7. Click the **Add Property...** button again and now select the **Keep above other windows** option.

8. Leave the new **Keep above other windows** line as default, `Apply Initially` and `Yes`.

9. Click the **Apply** button and then **OK**.
