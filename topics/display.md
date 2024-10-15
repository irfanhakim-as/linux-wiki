# Display

## Description

This details configuration options pertaining display.

## Directory

- [Display](#display)
  - [Description](#description)
  - [Directory](#directory)
  - [Add Colour Profile](#add-colour-profile)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Screen Brightness Adjustment](#screen-brightness-adjustment)
    - [Description](#description-2)
    - [References](#references)
    - [Steps](#steps-1)
    - [Multiple Screens (Deprecated)](#multiple-screens-deprecated)

---

## Add Colour Profile

> [!IMPORTANT]  
> This guide assumes that you are using KDE Plasma as your desktop environment.

### Description

This details how to add and use a colour profile with our monitor.

### Steps

1. [Install](yay.md#install) the `colord-kde` package using `yay`.

2. Open the **System Settings** app.

3. Under **Hardware**, click **Color Corrections**.

4. Click the desired monitor available under **Devices**.

5. Click **Add Profile** > **From File**.

6. Locate and select the desired `.icm` or `.icc` colour profile.

7. You may or may not click the **Install System Wide** button.

8. Restart your device.

---

## Screen Brightness Adjustment

> [!IMPORTANT]  
> This guide assumes that you are using KDE Plasma 6 as your desktop environment.

### Description

This details how to adjust the brightness of your connected screen(s) on KDE Plasma.

### References

- [Alt tab problem with Fedora KDE](https://discuss.kde.org/t/alt-tab-problem-with-fedora-kde/17280/1)

### Steps

> [!NOTE]  
> KDE Plasma 6.2+ has built-in support for adjusting the brightness of multiple screens individually by default.

1. On the desktop's **System Tray**, click the **Brightness and Color** Applet.

2. Adjust the **Display Brightness** slider of each attached screens accordingly.

### Multiple Screens (Deprecated)

> [!NOTE]  
> This part of the guide has been deprecated and is no longer needed in KDE Plasma 6.2+.

1. [Install](yay.md#install) the `ddcutil` package (should come preinstalled by default in most cases) using `yay`.

    **Alternatively**, you may instead [install](yay.md#install) the `ddcutil-service` package (recommended alternative).

2. [Install](yay.md#install) the `vdu_controls` package using `yay`.

3. Launch the **VDU Controls** application.

4. Adjust the **Brightness** slider for each connected screen accordingly.

5. Close the application once you're done.
