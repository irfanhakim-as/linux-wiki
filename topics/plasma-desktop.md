# Plasma Desktop

> [!NOTE]  
> This topic mostly or entirely pertains to KDE Plasma version `5.27` and may not have been updated for newer versions.

## Description

This topic focuses on the Plasma Desktop, a graphical desktop environment by KDE.

## Directory

- [Plasma Desktop](#plasma-desktop)
  - [Description](#description)
  - [Directory](#directory)
  - [Quality of Life Improvements](#quality-of-life-improvements)
    - [Description](#description-1)
    - [Workspace Behaviour](#workspace-behaviour)
    - [Dolphin](#dolphin)
      - [Show hidden files](#show-hidden-files)
      - [Add Refresh button](#add-refresh-button)
      - [Configure Dolphin options](#configure-dolphin-options)
      - [Show additional info and panel](#show-additional-info-and-panel)
      - [Show video thumbnails](#show-video-thumbnails)
      - [Enable HEIC Images Support](#enable-heic-images-support)
      - [Enhancing Dolphin Functionality](#enhancing-dolphin-functionality)
      - [Make Flatpak Apps Use KDE File Picker](#make-flatpak-apps-use-kde-file-picker)
    - [KRunner](#krunner)
      - [Center KRunner by Default](#center-krunner-by-default)
      - [Adding Additional Plugins](#adding-additional-plugins)
    - [Spectacle](#spectacle)
    - [Spectacle-like Window Management](#spectacle-like-window-management)
  - [Theme Customisations](#theme-customisations)
    - [Description](#description-2)
    - [Floating "Dock"](#floating-dock)
    - [Cleaner System Tray](#cleaner-system-tray)
    - [Task Switcher](#task-switcher)
    - [Prettier Icons](#prettier-icons)
    - [Menu Bar](#menu-bar)
    - [macOS-like Desktop](#macos-like-desktop)
  - [Widgets](#widgets)
    - [Description](#description-3)
    - [KDE Thermal Monitor](#kde-thermal-monitor)
      - [References](#references)
      - [Steps](#steps)
      - [Troubleshooting](#troubleshooting)
  - [Default Applications](#default-applications)
    - [Description](#description-4)
    - [Application Types](#application-types)
    - [File Types](#file-types)
  - [Auto Login](#auto-login)
    - [Description](#description-5)
    - [References](#references-1)
    - [Steps](#steps-1)

---

## Quality of Life Improvements

> [!NOTE]  
> Feel free to skip parts of this section that you do not wish to implement.

### Description

This details on some things that could be done to improve the experience of using the desktop.

### Workspace Behaviour

1. Launch the **System Settings** application.

2. Expand the **Workspace** section.

3. Click the **Workspace Behavior** menu item.

4. In the **General Behavior** tab, configure as follows:

   - Clicking files or folders: `Selects them`

5. Click the **Apply** button.

### Dolphin

#### Show hidden files

1. In the Dolphin app, click the **Hamburger** menu.

2. Enable **Show Hidden Files**.

#### Add Refresh button

1. In the Dolphin app, click the **Hamburger** menu.

2. Hover over **Configure**, and select **Configure Toolbars**.

3. Search for **Refresh** in the **Filter** box under **Available actions**.

4. Select the Refresh action and drag it to the **Current actions** list right before/above the **Split** action.

5. Click **Apply** and **OK**.

#### Configure Dolphin options

1. In the Dolphin app, click the **Hamburger** menu.

2. Hover over **Configure**, and select **Configure Dolphin**.

3. Click the **General** section, then click the **Confirmations** tab.

4. Uncheck the **Closing windows with multiple tabs** option.

5. Click the **Startup** section, and select the second option under **Show on startup**.

6. Click the inline **Folder** icon button, then click the **Downloads** folder.

7. Click **OK**, this will set the Downloads folder as the default folder upon launch.

8. In the same Startup section, select the **Show full path inside location bar** option under **General**.

9. Once all changes have been made, click **Apply** then **OK**.

#### Show additional info and panel

1. In the Dolphin app, click the **Hamburger** menu.

2. Hover over **Show Additional Information**, and select **Size**.

3. Now from the Hamburger menu, hover over **Show Panels**, and select **Information**.

#### Show video thumbnails

1. [Install](yay.md#install) the `ffmpegthumbs` package using `yay`.

2. Open **Dolphin**.

3. Enter the **Configure Dolphin** menu (<kbd>Ctrl + Shift + ,</kbd>).

4. In the **General** section, click the **Previews** tab.

5. Tick the **Video Files (ffmpegthumbs)** option.

6. Click **Apply** and **OK**.

#### Enable HEIC Images Support

This allows the viewing and thumbnailing of HEIC images.

1. [Install](yay.md#install) the `kimageformats` package using `yay`.

#### Enhancing Dolphin Functionality

1. [Install](yay.md#install) the `dolphin-plugins` package using `yay`.

2. [Install](yay.md#install) the `kio-gdrive` package using `yay` to add Google Drive directly into Dolphin.

3. Install several Dolphin Service Menus.

   - Create the `ServiceMenus` directory:

      ```sh
      mkdir -p ~/.local/share/kservices5/ServiceMenus
      ```

   - Download and install [**office2pdf**](https://store.kde.org/p/1172774) to add Office documents conversion to PDF:

      ```sh
      cp office2pdf.desktop ~/.local/share/kservices5/ServiceMenus
      ```

   - [Install](yay.md#install) [**KDE 5 Service Menu PDF**](https://store.kde.org/p/1227799) (`kf5-servicemenus-pdf`) using `yay` to add more PDF-related functionalities.

   - [Install](yay.md#install) [**Kompare Menu**](https://store.kde.org/p/1100884) (`kde-servicemenus-komparemenu`) using `yay` to add support for comparing different files.

   - [Install](yay.md#install) [**KDE 5 Service Menu ReImage**](https://store.kde.org/p/1231579) (`kde-service-menu-reimage`) using `yay` to add support for extra image-related functionalities.

   - You may also need to [install](yay.md#install) some dependencies for **KDE 5 Service Menu ReImage** such as `jhead` for converting PNG images to JPG.

4. Log out and log back into the desktop.

#### Make Flatpak Apps Use KDE File Picker

This makes Flatpak apps use Dolphin as the File Picker and not Nautilus (GTK).

1. Add these variables to `/etc/environment` *(might not be needed)*:

    ```sh
    GTK_USE_PORTAL=1
    XDG_CURRENT_DESKTOP=KDE
    ```

2. Make sure these packages are installed on your machine:

   - `xdg-desktop-portal`
   - `xdg-desktop-portal-gtk`

3. [Install](yay.md#install) the `xdg-desktop-portal-kde` package using `yay`.

4. [Uninstall](yay.md#uninstall) the `xdg-desktop-portal-gnome` package if it is installed.

5. Reboot your system.

### KRunner

#### Center KRunner by Default

1. Launch KRunner by pressing <kbd>Alt + Space</kbd>.

2. Click the inline **Settings** icon on KRunner's far left.

3. In the KRunner Settings module, change the **Position on screen** option from **Top** to **Center**.

4. Click **Apply** then **OK**.

#### Adding Additional Plugins

1. Launch KRunner by pressing <kbd>Alt + Space</kbd>.

2. Click the **Cogwheel** icon to the far left of KRunner.

3. Click the **Configure Enabled Search Plugins...** button.

4. In the **Plasma Search** section, click the **Get New Plugins** at the bottom right.

5. Search for the plugin you wish to install using the provided search bar.

6. Select the plugin you wish to install and click the **Install** button on the top right.

### Spectacle

1. Launch Spectacle.

2. Click **Configure** and you should be in the **General** tab.

3. For the **When launching Spectacle** option, set it to **Do not take a screenshot automatically**.

4. For the **After taking a screenshot** option, check the **Save file to default folder** box and set the dropdown value to **Copy image to clipboard**.

5. For the **Rectangular Region Selection** option, check the **Accept on click-and-release** box, and uncheck the **Show capture instructions** box.

6. Head to the **Save** tab and change the **Save Location** to `~/Pictures/Screenshots/Desktop` (create the folder beforehand).

7. Head to the **Shortcuts** tab and add custom keybindings for:
	- **Capture Active Window**: <kbd>Alt + Shift + 5</kbd>
	- **Capture Current Monitor**: <kbd>Alt + Shift + 3</kbd>
	- **Capture Rectangular Region**: <kbd>Alt + Shift + 4</kbd>

8. Click **Apply** then **OK**.

### Spectacle-like Window Management

This adds shortcuts that would make managing and moving application windows similar to the third-party macOS application, Spectacle.

1. Launch the **System Settings** app.

2. Expand the **Shortcuts** section.

3. Use the provided **Search** bar to search for these shortcuts and add the following custom shortcuts accordingly:

    - Quick Tile Window to the Bottom: <kbd>Alt + Shift + Down</kbd>
    - Quick Tile Window to the Left: <kbd>Alt + Shift + Left</kbd>
    - Quick Tile Window to the Right: <kbd>Alt + Shift + Right</kbd>
    - Quick Tile Window to the Top: <kbd>Alt + Shift + Up</kbd>
    - Quick Tile Window to the Top Left: <kbd>Meta + Alt + Shift + Left</kbd>
    - Quick Tile Window to the Top Right: <kbd>Meta + Alt + Shift + Right</kbd>
    - Quick Tile Window to the Bottom Left: <kbd>Ctrl + Alt + Shift + Left</kbd>
    - Quick Tile Window to the Bottom Right: <kbd>Ctrl + Alt + Shift + Right</kbd>
    - Move Window to the Center: <kbd>Alt + Shift + C</kbd>
    - Maximize Window: <kbd>Alt + Shift + F</kbd>

4. Click the **Apply** button.

---

## Theme Customisations

> [!NOTE]  
> Feel free to skip parts of this section that you do not wish to implement.

### Description

This details some customisation options for the Plasma desktop.

### Floating "Dock"

1. Right click the taskbar on our desktop.

2. Click **Enter Edit Mode**.

3. Click **More Options...**.

4. Select the **Floating Panel** checkbox.

5. Increase **Panel height** if you wish.

6. Set the **Panel Alignment** to **Center**.

7. Decrease the width of the panel to as short as possible using the arrows.

8. Exit Edit Mode.

### Cleaner System Tray

1. Right click the **Upward/Downward Arrow** icon at the system taskbar or menu bar that says **Show hidden icons**.

2. Click **Configure System Tray...**.

3. In the **General** section:

    - Set the **Panel icon size** to `Small`.

    - Set the **Panel icon spacing** to `Small` (on a screen lower than 1080p) or `Normal` (on a 1080p or higher screen).

4. Navigate to the **Entries** section and make the following (recommended) configurations:

    - Set **AnyDesk** to `Always hidden`.

    - Set **firewall-applet** to `Always hidden`.

    - Set **Updates** to `Always hidden`.

    - Set **KDE Connect** to `Always shown`.

    - Set **Keyboard Layout** to `Always hidden`.

    - Set **Lock Keys Status** to `Always hidden`.

    - Set **Clipboard** to `Always hidden`.

    - Set **Media Player** to `Always hidden`.

    - Set **Notifications** to `Always shown`.

5. Click **Apply** then **OK**.

### Task Switcher

1. [Install](yay.md#install) the `kdeplasma-addons` package using `yay` to add more task switcher options.

2. Launch the **System Settings** app.

3. Click the **Window Management** section.

4. Click the **Task Switcher** section.

5. In the **Main** tab, under the **Vizualisation** section, click the dropdown above the **Shortcuts** options.

6. By default, the **Breeze** task switcher is selected, switch this to **Thumbnail Grid**.

7. Under the **Shortcuts** section, configure as follows:

    - All windows:

      - Forward: <kbd>Alt + Tab</kbd>
      - Reverse: <kbd>Alt + `</kbd>

    - Current application:

      - Forward: `None`
      - Reverse: `None`

8. Click **Apply**.

### Prettier Icons

1. Launch the **System Settings** app.

2. Expand the **Appearance** section.

3. Get into the **Icons** page.

4. Click the **Get New Icons...** button.

5. Search for the `Mkos-Big-Sur` icon set and click the **Install** button.

6. Click the **Use** button to use the icon set and close the **Download New Icons** window.

7. Get into the **Cursors** page.

8. Click the **Get New Cursors...** button.

9. Search for the `Bibata Modern Classic` cursor set and click the **Install** button.

10. Click the **Install** button next to the `Bibata-Modern-Classic.tar.xz` option.

11. Click the **Use** button to use the icon set and close the **Download New Cursors** window.

### Menu Bar

1. Right click the desktop, hover over the **Add Panel** menu item, and select the **Application Menu Bar** option.

2. Right click the **Application Menu Bar** at the top and select the **Enter Edit Mode** option.

3. Configure the **Panel height** accordingly i.e. `27` on a 1080p screen or `33` on a 1440p screen.

4. Click the **More Options...** button and configure accordingly:

   - Panel Alignment: `Center`.
   - Visibility: `Always Visible`.
   - Opacity: `Adaptive`.

5. Add Widgets to the Menu Bar:

   - Click the **Add Widgets...** button.

   - Search for the widget in the provided search bar from the **Widgets** panel.

   - Locate the widget and click and drag it to the Menu Bar.

   - Release the widget to add it to the Menu Bar.

   - Do so for each of the following widgets:

     - `Application Launcher`.
     - `Window Title` (Requires a download).
     - `Global Menu` (Added by default).
     - `Digital Clock`.
     - `System Tray`.
     - `Peek at Desktop`.

        For widgets that require a download, download them by:

        - Clicking the **Get New Widgets...** button.
        - Select the **Download New Plasma Widgets** option.
        - Use the provided search bar to search for the widget by their name.
        - Locate the widget and click the **Install** button.
        - If prompted to **Pick Your Installation Option**, click the desired downloadable item's corresponding **Install** button.
        - Close the **Download New Plasma Widgets** window after you've finished downloading all the widgets you need.

        **Alternatively**, some of the widgets could be [installed](./yay.md#install) using `yay` directly:

        - Window Title: `plasma6-applets-window-title`

6. Position the widgets by clicking and dragging them like so on the Menu Bar in this order (from left to right):

   - `Application Launcher`.
   - `Window Title`.
   - `Global Menu`.
   - Add a `Panel Spacer` by clicking the **Add Spacer** button.
   - `Digital Clock`.
   - Add a `Panel Spacer` by clicking the **Add Spacer** button.
   - `System Tray`.
   - `Peek at Desktop`.

7. Configure the widgets by right clicking each widget and selecting the **Configure...** option:

   - **Window Title**:
     - **Appearance**:
       - Label style: `Application`.
       - Icon:
         - Show when available: `Disabled`.
       - Font:
         - Bold: `Disabled`.
         - Italic: `Disabled`.
         - First letters capital: `Enabled`.
       - Length: `Based on contents`.
       - Click the **Apply** button.
     - **Behavior**:
       - Filters:
         - Show only window information from current screen: `Disabled`.
         - Show only when maximized: `Disabled`.
       - Mouse:
         - Show tooltip on hover: `Enabled`.
         - Scroll to cycle and minimize through your tasks: `Enabled`.
       - Placeholder:
         - Show activity information: `Enabled`.
       - Click the **Apply** button.
     - Leave the rest as default and click the **OK** button.
   - **Digital Clock**:
     - **Appearance**:
       - Information - Show date: `Always beside time`.
       - Show seconds: `Only in the tooltip`.
       - Show time zone: `Only when different from local time zone`.
       - Display time zone as: `Code`.
       - Time display: `12-Hour`.
       - Date format: `Long Date`.
       - Text display: `Manual`.
         - Font Family: `SF Pro Display`.
         - Font Style: `Regular`.
         - Font Size: `12`.
       - Click the **Apply** button.
     - Leave the rest as default and click the **OK** button.
   - [**System Tray**](#cleaner-system-tray).

### macOS-like Desktop

1. Launch the **System Settings** application.

2. Click the **Appearance** section.

3. Configure the **Application Style**:

   - Click the **Application Style** menu item.

   - Click the **Configure GNOME/GTK Application Style...** button.

   - Click the **Get New GNOME/GTK Application Styles...** button.

   - In the provided search bar, search for `WhiteSur GTK Theme` and click the **Install** button.

   - When prompted to **Pick Your Installation Option**, click the corresponding **Install** button for:

     - `WhiteSur-Dark.tar.xz` (Dark) or `WhiteSur-Light.tar.xz` (Light).

        > [!TIP]  
        > Download the `-solid` variant if you are using an NVIDIA GPU.

   - Close the **Download New GNOME/GTK Application Styles** window.

   - In the **GNOME/GTK Application Style** page, expand the **GTK theme** dropdown and select the `WhiteSur-Dark` (Dark) or `WhiteSur-Light` (Light) option.

   - Click the **Apply** button.

4. Configure the **Plasma Style**:

   - Click the **Plasma Style** menu item.
   - Click the **Get New Plasma Styles...** button.
   - In the provided search bar, search for `Mkos-BigSur-plasma` and click the **Install** button.
   - Close the **Download New Plasma Styles** window.
   - In the **Plasma Style** page, select the **mkos-BigSur** option and click the **Apply** button.

5. Configure the **Window Decorations**:

   - Click the **Window Decorations** menu item.

   - Click the **Get New Window Decorations...** button.

   - In the provided search bar, search for `Mkos-BigSur-AuroraNight` (Dark) or `Mkos-BigSur-Aurora` (Light) and click the **Install** button.

   - Close the **Download New Window Decorations** window.

   - In the **Window Decorations** page, select the **Mkos-BigSur** option and click the **Apply** button.

   - Configure the **Titlebar Buttons**:

     - Click the **Titlebar Buttons** tab.
     - Remove the **More actions for this window** button.
     - Remove the **On all desktops** button.
     - Remove the **Context Help** button.
     - Drag the **Close** button to the far left.
     - Drag the **Minimize** button to the right of the **Close** button.
     - Drag the **Maximize** button to the right of the **Minimize** button.
     - Click the **Apply** button.

6. Configure the **Splash Screen** *(Optional)*:

   - Click the **Splash Screen** menu item.

   - In the **Splash Screen** page, select the **None** option and click the **Apply** button.

7. Configure the **Login Screen**:

    - From the **System Settings** application, click the **Startup and Shutdown** section.
    - Click the **Login Screen (SDDM)** menu item.
    - Click the **Get New SDDM Themes...** button.
    - In the provided search bar, search for `Apple Sonoma V3` and click the **Install** button.
    - Enter your user password when prompted.
    - Close the **Download New Login Screen** window.
    - In the **Login Screen (SDDM)** page, select the **Apple-Sonoma-V3** option and click the **Apply** button.
    - Enter your user password once again when prompted.

8. Add an [**Application Menu Bar**](#menu-bar) to the top of the screen.

9. Replace the default system taskbar with a [**Plank**](./plank.md#setup) dock.

10. Configure macOS-like [**Icons**](#prettier-icons).

11. [Install](./fonts.md#installation) and [Configure](./fonts.md#configuration) macOS-like **Fonts** (including Emojis).

---

## Widgets

### Description

This details some widgets we could add to our desktop for added functionality.

### KDE Thermal Monitor

#### References

- [CPU temperature goes to off state](https://github.com/kotelnik/plasma-applet-thermal-monitor/issues/53#issuecomment-500287155)

#### Steps

1. [Install](yay.md#install) the `plasma5-applets-thermal-monitor` package using `yay`.

2. Check for available sensors on your system:

    ```sh
    sensors
    ```

    > [!NOTE]  
    > Do note that some sensors may require additional packages to be installed (i.e. `zenpower3-dkms` for newer Ryzen CPUs).

3. Add the widget and configure the sources:

   - Add the widget to the menu/task bar.

   - Right click the widget and click **Configure Thermal Monitor**.

   - Add each source to the **Resources** list by hitting the **+** button.

   - Choose a **Source**.

   - Select **Show alias** and add a label to the source (i.e. `CPU`, `GPU`, `SSD`).

   - Click the **OK** button.

   - Do these for all your relevant sources. For example:
     - CPU: `zenpower-pci-00c3/Tdie`
     - GPU: `nvidia-smi`
     - SSD: `nvme-pci-0500/Composite`

   - Click the **Apply** button.

   - Click the **Appearance** section.

   - Adjust the **Alias font size** and other settings accordingly.

   - Click **Apply** and **OK**.

#### Troubleshooting

Fix the KDE Thermal Monitor issue requiring "Reload Temperature Sources" when `plasmashell` is restarted:

- Edit the `~/.local/share/plasma/plasmoids/org.kde.thermalMonitor/contents/ui/main.qml` file:

    ```qml
    property var systemmonitorAvailableSources: []
    ```

    Replace the `property var systemmonitorAvailableSources` line with the above line.

---

## Default Applications

### Description

This details on how to configure default applications of various types on KDE Plasma.

### Application Types

This section details how to configure the default application for certain types of applications.

1. Open the **System Settings** app.

2. Expand the **Applications** section.

3. Open the **Default Applications** menu item.

4. Here, you can configure the default application of various types including:

    - Web browser
    - File manager
    - Email client
    - Terminal emulator
    - Map
    - Dialer

5. To configure the default application for a certain type, click its corresponding dropdown and select the application you wish to use accordingly.

6. Click the **Apply** button to save your changes.

### File Types

This section details how to configure the default application to open certain file types.

1. Launch the **Dolphin** file manager.

2. Select and right click a file of the type you wish to configure i.e. a `.mkv` file.

3. From the context menu, hover over the **Open With** option, and select the **Other Application...** option.

4. Search and locate the application you wish to use to open the file type i.e. `VLC media player`.

5. Select the application and check the **Remember application association for all files of type "`X`"** box.

    `X` here represents the file type you are configuring i.e. `Matroska Video` for `.mkv` files.

6. Click the **OK** button.

    Now, all files of the type you configured will open with the selected application.

---

## Auto Login

### Description

This guides how to enable auto login to the desktop for our user.

### References

- [How to configure automatic login in KDE](https://www.simplified.guide/kde/automatic-login)

### Steps

1. Launch the **System Settings** application.

2. Expand the **Startup and Shutdown** section under the **Workspace** group.

3. Open the **Login Screen (SDDM)** page.

4. Click the **Behavior** button at the bottom.

5. Check the **Automatically log in** box and select your **user** from the dropdown alongside it. You can also change the default **session** (`Plasma`/`Wayland`) here.

6. Click the **Apply** button at the bottom.
