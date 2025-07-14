# Steam

> [!NOTE]  
> Parts of this guide may assume that your system is [SteamOS](../distros/SteamOS.md) based or [SteamOS-like](../distros/Bazzite.md).

## Description

Steam is a video game digital distribution service and storefront developed by [Valve Corporation](https://www.valvesoftware.com).

## Directory

- [Steam](#steam)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Add Web Apps to Steam](#add-web-apps-to-steam)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
    - [Recommendations](#recommendations)
  - [Troubleshooting](#troubleshooting)
    - [Description](#description-2)
    - [References](#references-2)
    - [Move Content Failure](#move-content-failure)

## References

- [Steam](https://store.steampowered.com)

---

## Add Web Apps to Steam

### Description

This details how to add web-based services to Steam so they can be accessed in gaming mode.

### References

- [Xbox Cloud Gaming in Microsoft Edge with Steam Deck](https://support.microsoft.com/en-au/topic/xbox-cloud-gaming-in-microsoft-edge-with-steam-deck-43dd011b-0ce8-4810-8302-965be6d53296)
- [Make Firefox work better in game mode](https://www.reddit.com/r/SteamDeck/comments/16eiyi6/make_firefox_work_better_in_game_mode)
- [Watch DRM content on Firefox](https://support.mozilla.org/en-US/kb/enable-drm)

### Steps

1. [Install](flatpak.md#install) a web browser such as **Firefox** (`org.mozilla.firefox `) or **Google Chrome** (`com.google.Chrome`) as a Flatpak.

2. If you intend to use Firefox for this process, pre-configure it as follows:

   - Launch the **Firefox** application on your desktop.
   - In the address bar, type `about:profiles` and submit by hitting the <kbd>Enter</kbd> key.
   - In the **About Profiles** page, identify the current default profile (i.e. `default-release`).
   - Click the **Create a New Profile** button.
   - In the **Create Profile Wizard** window, click the **Next** button to begin creating the new profile.
   - In the provided form of the **Create Profile Wizard** window, configure the following:

     - Enter new profile name: `SteamOS`

      Click the **Finish** button to finish creating the new profile.

   - Back in the **About Profiles** page, locate the previous default profile (i.e. `default-release`) and click its corresponding **Set as default profile** button to make it the default again.
   - Locate the newly created profile (i.e. `SteamOS`) and click its corresponding **Launch profile in new browser** button.
   - In the browser window of the new profile:

     - If there is a sidebar showing, right click the sidebar, and select the **Hide sidebar** context menu option.
     - [Configure](firefox.md#configuration) the `full-screen-api.ignore-widgets` setting to `true`.
     - If you wish to use any web apps that require DRM (i.e. Spotify), login to said service, and attempt to access a DRM content to prompt an **Enable DRM** option you need to click to enable for the first time.
     - **(Optional)** Add any extension(s) you wish to use on the browser (i.e. uBlock Origin).

   - You may close the browser window of the new profile once you have finished pre-configuring it.

3. In the **Application Launcher** (Start Menu), locate the web browser (i.e. **Firefox**), right click on its app icon, and select the **Add to Steam** context menu option.

4. On the **Steam** application, locate the web browser that has been added to your Steam library.

5. Right click the web browser application from your Steam library and select **Properties**.

6. In the **Shortcut** section of the **Properties** menu, rename the app to the intended web service (i.e. `YouTube`).

7. Leave the **Target** section (i.e. `"/usr/bin/flatpak"`) and the **Start In** section (i.e. `"/usr/bin/"`) as is.

8. In the **Launch Options** section, by default, it will be filled with this command:

   - Firefox:

      ```sh
      "run" "--branch=stable" "--arch=x86_64" "--command=firefox" "--file-forwarding" "org.mozilla.firefox" "@@u" "@@"
      ```

      Chrome:

      ```sh
      "run" "--branch=stable" "--arch=x86_64" "--command=/app/bin/chrome" "--file-forwarding" "com.google.Chrome" "@@u" "@@"
      ```

   - Replace the value of this section to the following command instead, according to your browser:

      Firefox:

      ```sh
      "run" "--branch=stable" "--arch=x86_64" "--socket=wayland" "--env=MOZ_ENABLE_WAYLAND=1" "--env=GDK_SCALE=1.25" "--command=firefox" "--file-forwarding" "org.mozilla.firefox" "@@u" "@@" "-P" "SteamOS" "--kiosk" "https://www.google.com"
      ```

      Chrome:

      ```sh
      "run" "--branch=stable" "--arch=x86_64" "--command=/app/bin/chrome" "--file-forwarding" "com.google.Chrome" "@@u" "@@" "--window-size=1024,640" "--force-device-scale-factor=1.25" "--device-scale-factor=1.25" "--kiosk" "https://www.google.com"
      ```

      Replace the `"https://www.google.com"` value with the URL of the intended service (i.e. `"https://www.youtube.com"`).

9. Test run it while you're still on Desktop mode, if it works, it should be ready to use in Gaming mode.

### Recommendations

- In gaming mode, use the **Web Browser** controller layout for these apps if it's not used by default:

  - To exit from the app while in gaming mode, use the <kbd>Ctrl</kbd> + <kbd>W</kbd> keybind to close the tab (and hence, the app) via the left menu button on your controller (i.e. **Share** on the DS4 controller, **View** on the Steam Deck controller).

- Add some artworks (i.e. capsules, hero, logo, etc.) for the service using the **SteamGridDB** plugin from **Decky Loader**.

---

## Troubleshooting

### Description

This details troubleshooting steps or workarounds for certain issues within SteamOS.

### References

- [Content File Locked woes](https://www.reddit.com/r/SteamDeck/comments/uaoa4r/content_file_locked_woes)

### Move Content Failure

When trying to move content from one drive to another, it fails with the following error: `content file locked`.

1. Identify the ID of the game that has failed to move from the game's Steam store page or SteamDB.

    As an example, if the link to the game's Steam store page is like so:

    ```
    https://store.steampowered.com/app/641990/The_Escapists_2
    ```

    Then the ID of the game is `641990`.

2. Move the game's `compatdata` from the source drive (i.e. `/run/media/mmcblk0p1`) to the internal drive (i.e. `/home/deck`):

    ```sh
    mv -f /run/media/mmcblk0p1/steamapps/compatdata/641990 /home/deck/.local/share/Steam/steamapps/compatdata/
    ```

    Replace `641990` with the ID of the game.

3. Restart the attempt to move the game accordingly via the **Storage** section in the Steam client within Gaming mode.
