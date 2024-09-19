# Dolphin

## Description

Dolphin is KDE's file manager that lets you navigate and browse the contents of your hard drives, USB sticks, SD cards, and more. Creating, moving, or deleting files and folders is simple and fast.

## Directory

- [Dolphin](#dolphin)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Configuration Options](#configuration-options)
    - [Description](#description-1)
    - [Show hidden files](#show-hidden-files)
    - [Add Refresh button](#add-refresh-button)
    - [Show additional info and panel](#show-additional-info-and-panel)
    - [Interface options](#interface-options)
    - [Show file previews or thumbnails](#show-file-previews-or-thumbnails)
    - [Show file previews on remote mounts](#show-file-previews-on-remote-mounts)
  - [Enhancing Dolphin Functionality](#enhancing-dolphin-functionality)
    - [Description](#description-2)
    - [References](#references-1)
    - [Packages](#packages)
    - [Service Menus](#service-menus)
  - [Make Flatpak Apps Use KDE File Picker](#make-flatpak-apps-use-kde-file-picker)
    - [Description](#description-3)
    - [References](#references-2)
    - [Steps](#steps)

## References

- [Dolphin](https://apps.kde.org/dolphin)
- [Dolphin Arch Wiki](https://wiki.archlinux.org/title/Dolphin)

---

## Configuration Options

### Description

This details several configuration options for enhancing the experience of using Dolphin.

### Show hidden files

1. In the Dolphin app, click the **Hamburger** menu located in the top right corner.

2. Enable the **Show Hidden Files** menu item.

3. This option can also be toggled using either the <kbd>Ctrl + H</kbd> or <kbd>Alt + .</kbd> key combination.

### Add Refresh button

1. In the Dolphin app, click the **Hamburger** menu located in the top right corner.

2. Hover over the **Configure** menu item, and select the **Configure Toolbars...** option.

3. Search for `Refresh` in the **Filter** box under **Available actions**.

4. Select the **Refresh** action, drag it to the **Current actions** list, and place it just below the **Split** action.

5. Click **Apply** and **OK**.

### Show additional info and panel

1. In the Dolphin app, click the **Hamburger** menu located in the top right corner.

2. Hover over the **Show Additional Information** menu item, and select **Size**.

3. Navigate back to the **Hamburger** menu.

4. Hover over the **Show Panels** menu item, and select **Information**.

### Interface options

1. In the Dolphin app, click the **Hamburger** menu located in the top right corner.

2. Hover over the **Configure** menu item, and select the **Configure Dolphin...** option.

3. Click the **Interface** section, then click the **Confirmations** tab.

4. Uncheck the **Closing windows with multiple tabs** option.

5. Navigate to the **Folders & Tabs** tab and select the second radio button under **Show on startup**.

6. Click the inline **Folder** icon button, then select your user's **Downloads** folder.

7. Click **OK**, this will set the Downloads folder as the default folder upon launch.

8. In the **Status & Location bars** tab, enable the **Show full path inside location bar** option.

9. Once all changes have been made, click **Apply** then **OK**.

### Show file previews or thumbnails

1. In the Dolphin app, click the **Hamburger** menu located in the top right corner.

2. Hover over the **Configure** menu item, and select the **Configure Dolphin...** option.

3. Click the **Interface** section, then click the **Previews** tab.

4. In the **Show previews in the view for** list, enable all file types you wish to show previews for i.e. **Video Files (ffmpegthumbs)**.

5. Click **Apply** then **OK**.

### Show file previews on remote mounts

> [!NOTE]  
> This setting may only be required on KDE Plasma 6.

1. Following the steps described in the [previous section](#show-file-previews-or-thumbnails), locate the **Skip previews for remote files above** setting.

2. Set the value to a high enough size limit (i.e. `51200 MiB`) for Dolphin to generate previews for them as long as they do not exceed this limit.

3. Click **Apply** then **OK**.

---

## Enhancing Dolphin Functionality

> [!TIP]  
> A system reboot is required after completing all of the following steps.

### Description

This details several recommendations to enhance or extend Dolphin's feature set.

### References

- [KDE Store Dolphin Service Menus](https://store.kde.org/browse?cat=102)
- [File previews](https://wiki.archlinux.org/title/Dolphin#File_previews)

### Packages

These packages are recommended to be [installed](yay.md#install) using `yay` to add in some features Dolphin may not include by default:

1. `dolphin-plugins` to add version control and Dropbox support.

2. `kio-gdrive` to add Google Drive directly into Dolphin.

3. `ffmpegthumbs` to support video thumbnails in Dolphin.

4. `kimageformats` to add support for HEIC image files and GIMP's XCF files.

### Service Menus

Dolphin service menus add additional features directly to Dolphin's context menu.

1. Some Dolphin service menus can either be installed using a package manager or helper such as `yay`, while others may require manual download and installation from the KDE Store.

    For the latter, create the service menus directory for your user:

    ```sh
    mkdir -p ~/.local/share/kio/servicemenus
    ```

    **Alternatively**, create the directory system-wide:

    ```sh
    mkdir -p /usr/share/kio/servicemenus
    ```

2. Install the following recommended service menus accordingly:

    > [!WARNING]  
    > At least some of these service menus are not guaranteed to work on KDE Plasma 6.

   - [**office2pdf**](https://store.kde.org/p/1172774) to add Office documents conversion to PDF:

     - Manual installation:

        ```sh
        cp office2pdf.desktop <service-menus-directory>
        ```

   - [**KDE 5 Service Menu PDF**](https://store.kde.org/p/1227799) to add more PDF-related functionalities:

     - [Install](yay.md#install) the `kf5-servicemenus-pdf` package using `yay`.

   - [**KDE 6 Service Menu ReImage**](https://store.kde.org/p/2196940) to add support for extra image-related functionalities:

     - [Install](yay.md#install) the `kf6-servicemenus-reimage` package using `yay`.
     - You may also need to [install](yay.md#install) some optional dependencies such as `jhead` for converting PNG images to JPG.

---

## Make Flatpak Apps Use KDE File Picker

### Description

This makes Flatpak apps use Dolphin as the system file picker and not any others such as Nautilus (GTK).

### References

- [Consistent file dialog under KDE Plasma](https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications#Consistent_file_dialog_under_KDE_Plasma)

### Steps

1. Add necessary environment variables to the `/etc/environment` file *(might not be needed)*:

    Edit the system's environment file:

    ```sh
    sudo nano /etc/environment
    ```

    Add and save the following variable values to the file:

    ```sh
    GTK_USE_PORTAL=1
    XDG_CURRENT_DESKTOP=KDE
    ```

    > [!NOTE]  
    > The `GTK_USE_PORTAL=1` variable and value may have been replaced by `GDK_DEBUG=portals` instead.

2. Make sure these packages have been [installed](yay.md#install) on your machine:

   - `xdg-desktop-portal`
   - `xdg-desktop-portal-gtk`
   - `xdg-desktop-portal-kde`

    > [!NOTE]  
    > You may need to [uninstall](yay.md#uninstall) the `xdg-desktop-portal-gnome` package using `yay` if it is installed.

3. Some applications may also require additional steps in order for them to launch and use Portals correctly, such as:

   - [Firefox](firefox.md#use-native-file-manager)

4. Reboot your system.
