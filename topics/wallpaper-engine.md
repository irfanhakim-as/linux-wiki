# Wallpaper Engine

> [!IMPORTANT]  
> This guide requires KDE Plasma as the desktop environment.

## Description

Wallpaper Engine is an application for Windows with a companion app on Android which allows users to use and create animated and interactive wallpapers.

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

1. Install [Wallpaper Engine](https://store.steampowered.com/app/431960/Wallpaper_Engine) on **Steam** with Remote Play.

2. [Install](yay.md#install) the `plasma6-wallpapers-wallpaper-engine-git` plugin using `yay`.

3. [Install](yay.md#install) the `mpv` package using `yay` if you don't have it installed already.

4. Use and setup the plugin in KDE Plasma's **Wallpaper Settings**:

   - Right click on the desktop.

   - Click **Desktop and Wallpaper**.

   - In the **Wallpaper** section, change the **Wallpaper type** to `Wallpaper Engine for Kde`.

   - From the **Wallpapers** tab, click the **Library** button.

   - Set the full path to Steam (i.e. `~/.local/share/Steam`).

   - Still from within the **Wallpaper** section, navigate to the **Settings** tab.

   - Set the **Video Backend** to `Mpv`.

        > [!TIP]  
        > You may also make any other necessary changes to your selected wallpaper in this tab.

   - Go back to the Wallpapers tab and choose a wallpaper.

        > [!TIP]  
        > You can subscribe to more wallpapers from the [Wallpaper Engine Steam Workshop](https://steamcommunity.com/workshop/browse/?appid=431960).

   - Click **Apply** and **OK**.
