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

---

## Add Colour Profile

### Description

This details how to add and use a colour profile with our monitor.

> [!IMPORTANT]  
> This guide assumes that you are using KDE Plasma as your desktop environment.

### Steps

1. [Install](yay.md#install) the `colord-kde` package using `yay`.

2. Open the **System Settings** app.

3. Under **Hardware**, click **Color Corrections**.

4. Click the desired monitor available under **Devices**.

5. Click **Add Profile** > **From File**.

6. Locate and select the desired `.icm` or `.icc` colour profile.

7. You may or may not click the **Install System Wide** button.

8. Restart your device.
