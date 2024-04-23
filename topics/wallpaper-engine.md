# Wallpaper Engine

## Description

Wallpaper Engine is an application for Windows with a companion app on Android which allows users to use and create animated and interactive wallpapers.

> [!IMPORTANT]  
> This guide requires KDE Plasma as the desktop environment.

## Directory

- [Wallpaper Engine](#wallpaper-engine)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Integration with KDE Plasma](#integration-with-kde-plasma)
    - [Description](#description-1)
    - [Steps](#steps)

## References

- [Wallpaper Engine](https://www.wallpaperengine.io)

---

## Integration with KDE Plasma

### Description

This details the use of Wallpaper Engine wallpapers in KDE Plasma.

### Steps

1. Install [Wallpaper Engine](https://store.steampowered.com/app/431960/Wallpaper_Engine) on Steam with Remote Play.

2. [Install](yay.md#install) the `plasma5-wallpapers-wallpaper-engine` plugin using `yay`.

3. Use and setup the plugin in the KDE Plasma's **Wallpaper Settings**:

   - Right click on the desktop.

   - Click **Configure Desktop and Wallpaper**.

   - In the **Wallpaper** section, change the **Wallpaper type** to `Wallpaper Engine for Kde`.

   - Click the **Library** button.

   - Set the library to the Steam path (`~/.local/share/Steam`).

   - Within the **Wallpaper** section, click the **Settings** tab.

   - Change the **Video Backend** to `Mpv`.

   - Go back to the Wallpapers tab and choose a wallpaper (subscribe for more wallpapers through the [Wallpaper Engine Steam Workshop](https://steamcommunity.com/workshop/about/?appid=431960)).

   - Click **Apply** and **OK**.
