# Touchpad

> [!IMPORTANT]  
> This guide is tested on a system comprised of an Arch Linux based PC running KDE Plasma using the Apple Magic Trackpad 2 (or its [clone](#apple-magic-trackpad-clone)).

## Description

This details how we could configure and setup a touchpad for use on desktop Linux.

## Directory

- [Touchpad](#touchpad)
  - [Description](#description)
  - [Directory](#directory)
  - [Touchpad Configuration](#touchpad-configuration)
    - [Description](#description-1)
    - [Steps](#steps)
  - [macOS-like Gestures](#macos-like-gestures)
    - [Description](#description-2)
    - [References](#references)
    - [Steps](#steps-1)
  - [Smooth Scrolling in Mozilla Applications](#smooth-scrolling-in-mozilla-applications)
    - [Description](#description-3)
    - [References](#references-1)
    - [Firefox](#firefox)
    - [Thunderbird](#thunderbird)
  - [Apple Magic Trackpad Clone](#apple-magic-trackpad-clone)
    - [Description](#description-4)
    - [References](#references-2)
    - [Steps](#steps-2)

---

## Touchpad Configuration

### Description

This details recommended configuration options for the trackpad on KDE Plasma.

### Steps

1. Launch the **System Settings** application.

2. Under **Hardware**, expand the **Input Devices** section.

3. Select the **Touchpad** menu item.

4. Configure the touchpad like so (make changes to your liking):

   - Device enabled: `Enabled`
   - Pointer acceleration: `0.10`
   - Acceleration profile: `Adaptive`
   - Tapping: `Tap-to-click` and `Tap-and-drag`
   - Two-finger tap: `Right-click`
   - Scrolling: `Two fingers` and `Invert scroll direction (Natural scrolling)`
   - Right click: `Press anywhere with two fingers`

5. Click **Apply**.

---

## macOS-like Gestures

> [!NOTE]  
> This guide is theoretically supposed to only work with X11, but from testing, it also works on Wayland.

### Description

This details how we could configure our trackpad to behave more like it would on macOS.

### References

- [Touchégg](https://github.com/JoseExposito/touchegg)
- [Touché](https://github.com/JoseExposito/touche)
- [ToucheggKDE](https://github.com/NayamAmarshe/ToucheggKDE)

### Steps

1. [Install](yay.md#install) the `touchegg` package using `yay`.

2. [Start and Enable](autostart.md#start-and-enable-service) the `touchegg.service` service.

3. Restart the system or run the `touchegg` command manually i.e. through **KRunner** for the first time.

4. Configure Touchégg:

   - Edit the Touchégg configuration file:

      ```sh
      nano ~/.config/touchegg/touchegg.conf
      ```

   - Copy the content of the sample [touchegg.conf](../attachments/touchegg.conf) file and paste it into the configuration file.

   - Make your own modifications and add in your own values to the configuration file as you see fit, then save the file.

5. [Install](flatpak.md#install) the **Touché** (`com.github.joseexposito.touche`) app as a Flatpak.

6. To further configure the Touchégg gestures, you can do so graphically through the Touché app.

---

## Smooth Scrolling in Mozilla Applications

### Description

This details how to enable smooth scrolling in Mozilla applications including Firefox and Thunderbird.

### References

- [Kinetic Scrolling on Linux?](https://community.frame.work/t/solved-kinetic-scrolling-on-linux/17564)
- [PSA for Firefox users: set MOZ_USE_XINPUT2=1 to enable macOS-like smooth scrolling](https://www.reddit.com/r/linux/comments/72mfv8/psa_for_firefox_users_set_moz_use_xinput21_to)

### Firefox

1. Add the following [Environment Variable](flatpak.md#add-permission-overrides) to the **Firefox** Flatpak app using **Flatseal**:

    ```sh
    MOZ_USE_XINPUT2=1
    ```

2. In the **General** tab, under the **Browsing** section, update the following [Firefox setting](firefox.md#preferences):

   - **Use smooth scrolling**: `Enabled`

3. Restart the **Firefox** application.

### Thunderbird

1. Add the following [Environment Variable](flatpak.md#add-permission-overrides) to the **Thunderbird** Flatpak app using **Flatseal**:

    ```sh
    MOZ_USE_XINPUT2=1
    ```

2. In the **General** tab, under the **Language & Appearance** section, update the following [Thunderbird setting](thunderbird.md#preferences):

   - **Use smooth scrolling**: `Enabled`

3. Restart the **Thunderbird** application.

---

## Apple Magic Trackpad Clone

### Description

This details how to add support for a clone of the Apple Magic Trackpad such as the [JOMAA KB96](https://www.aliexpress.com/item/1005008016979688.html).

### References

- [A better way of getting Bosto touchpad working](https://www.reddit.com/r/Fedora/comments/1b901w1/a_better_way_of_getting_bosto_touchpad_working)
- [udev - RULES FILES](https://man7.org/linux/man-pages/man7/udev.7.html#RULES_FILES)

### Steps

1. This _workaround_ only works with _true_ Apple Magic Trackpad clones. Hence, while the (clone) trackpad is attached to your system, run the following command to ensure its `VID` and `PID` value matches the original Apple Magic Trackpad 2 (i.e. `05ac:0265`):

   ```sh
   lsusb | grep -i '05ac:0265'
   ```

   Sample output:

   ```
     Bus 001 Device 008: ID 05ac:0265 Apple, Inc.
     Bus 003 Device 024: ID 05ac:0265 Apple, Inc. Magic Trackpad
   ```

   Based on this example, `Apple, Inc.` is the Magic Trackpad clone we wish to enable support for and use, meanwhile `Apple, Inc. Magic Trackpad` is the original Apple Magic Trackpad 2 - note that both of them share the same `VID` and `PID` values.

2. Create a custom `udev` rules file (i.e. `99-magic-trackpad-clone.rules`) to _tell_ the system to use the `hid-multitouch` driver instead of the default `magicmouse` driver for the Magic Trackpad (and by extension, its clone):

   ```sh
   sudo nano /etc/udev/rules.d/99-magic-trackpad-clone.rules
   ```

   Content of the rules file:

   ```
   # /etc/udev/rules.d/99-magic-trackpad-clone.rules
   # Source: https://www.reddit.com/r/Fedora/comments/1b901w1/a_better_way_of_getting_bosto_touchpad_working
   # 2024 March 07, u/NonStandardUser
   # No tinkering required, just add this rule to udev.

   KERNEL=="0003:05AC:0265.*", \
   PROGRAM="/bin/sh -c 'echo -n %k > /sys/bus/hid/drivers/magicmouse/unbind;\
   echo -n %k > /sys/bus/hid/drivers/hid-multitouch/bind'"
   ```

3. To apply the workaround, either reattach the Magic Trackpad clone to your system, or run the following command:

   ```sh
   sudo udevadm control --reload-rules && sudo udevadm trigger
   ```

   Your Magic Trackpad clone should now be using the `hid-multitouch` driver and work as intended.

4. **(Optional)** Note that due to the way the `udev` rules file is set up, this workaround will only work for the Magic Trackpad clone, while _breaking_ an actual, original Apple Magic Trackpad 2. To revert it, rename the rules file:

   ```sh
   sudo mv /etc/udev/rules.d/99-magic-trackpad-clone.rules /etc/udev/rules.d/99-magic-trackpad-clone.rules.disabled
   ```

   The original Apple Magic Trackpad 2 will then work as per usual after reattaching it to your system (while the Magic Trackpad clone will not).
