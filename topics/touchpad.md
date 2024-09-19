# Touchpad

> [!IMPORTANT]  
> This guide focuses on a specific system comprised of an Arch Linux based PC using KDE Plasma on X11, and the Apple Magic Trackpad 2.

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

---

## Touchpad Configuration

### Description

This details optional configurations for the trackpad.

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

### Description

This details how we could configure our trackpad to behave more like it would on macOS, on X11.

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

> [!NOTE]  
> This has been tested with the Mozilla Firefox and Mozilla Thunderbird Flatpak running on the X11 graphics platform.

### Description

This details how to enable smooth scrolling in Mozilla applications including Firefox and Thunderbird on X11.

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
