# Steam

## Description

Steam is a video game digital distribution service and storefront developed by [Valve Corporation](https://www.valvesoftware.com).

> [!NOTE]  
> Parts of this guide may assume that your system is [SteamOS](../distros/SteamOS.md) based or [SteamOS-like](../distros/Bazzite.md).

## Directory

- [Steam](#steam)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Add Non-Steam Services](#add-non-steam-services)
    - [Description](#description-1)
    - [Steps](#steps)
    - [Recommendations](#recommendations)

## References

- [Steam](https://store.steampowered.com)

---

## Add Non-Steam Services

### Description

This details how to add non-Steam services based on Google Chrome, to Steam so it can be accessed in gaming mode.

### Steps

1. Install Google Chrome as a Flatpak using the **Discover** app, or through the terminal:

    ```sh
    flatpak install --user com.google.Chrome
    ```

2. In the **Application Launcher** (Start Menu), locate Google Chrome, right click on it and select **Add to Steam**.

3. On **Steam**, locate the added **Google Chrome** app.

4. Right click the app and select **Properties**.

5. In the **Shortcut** section of the **Properties** menu, rename the app to the intended service (i.e. `Netflix`).

6. Leave the **Target** section (`"/usr/bin/flatpak"`) and the **Start In** section (`"/usr/bin/"`) as is.

7. In the **Launch Options** section, by default, it will be filled with this command:

    ```sh
    "run" "--branch=stable" "--arch=x86_64" "--command=/app/bin/chrome" "--file-forwarding" "com.google.Chrome" "@@u" "@@"
    ```

    Update it with the following command instead:

    ```sh
    run --branch=stable --arch=x86_64 --command=/app/bin/chrome --file-forwarding com.google.Chrome @@u @@ --window-size=1024,640 --force-device-scale-factor=1.25 --device-scale-factor=1.25 --kiosk "https://www.google.com"
    ```

    or:

    ```sh
    "run" "--branch=stable" "--arch=x86_64" "--command=/app/bin/chrome" "--file-forwarding" "com.google.Chrome" "@@u" "@@" "--window-size=1024,640" "--force-device-scale-factor=1.25" "--device-scale-factor=1.25" "--kiosk" "https://www.google.com"
    ```

    Replace the `"https://www.google.com"` value with the URL of the intended service (i.e. `"https://www.netflix.com"`).

8. Test run it while you're still on Desktop mode, if it works, it should be ready to use in Gaming mode.

### Recommendations

- Use the **Web Browser** controller layout for these apps, if it's not used by default.

- Add some artworks (i.e. capsules, hero, logo, etc.) for the service using the **SteamGridDB** plugin from **Decky Loader**.

- To exit from the app while in gaming mode, use the left menu button on your controller (i.e. **Share** on the DS4 controller, **View** on the Steam Deck controller). The **Web Browser** controller layout must be used for this to work.
