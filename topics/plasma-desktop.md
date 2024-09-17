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
      - [References](#references)
    - [KRunner](#krunner)
      - [Center KRunner by Default](#center-krunner-by-default)
      - [Adding Additional Plugins](#adding-additional-plugins)
    - [Spectacle](#spectacle)
    - [Spectacle-like Window Management](#spectacle-like-window-management)
  - [Theme Customisations](#theme-customisations)
    - [Description](#description-2)
    - [Floating Dock](#floating-dock)
    - [Cleaner System Tray](#cleaner-system-tray)
    - [Task Switcher](#task-switcher)
    - [Prettier Icons](#prettier-icons)
    - [Menu Bar](#menu-bar)
    - [macOS-like Desktop](#macos-like-desktop)
  - [Widgets](#widgets)
    - [Description](#description-3)
    - [Installing a Widget](#installing-a-widget)
    - [Adding a Widget](#adding-a-widget)
    - [Configuring a Widget](#configuring-a-widget)
    - [KDE Thermal Monitor](#kde-thermal-monitor)
      - [References](#references-1)
      - [Steps](#steps)
      - [Troubleshooting](#troubleshooting)
  - [Default Applications](#default-applications)
    - [Description](#description-4)
    - [Application Types](#application-types)
    - [File Types](#file-types)
  - [Auto Login](#auto-login)
    - [Description](#description-5)
    - [References](#references-2)
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

This details configuration steps for enhancing the Dolphin file manager's experience and functionality.

#### References

- [Configuration Options](./dolphin.md#configuration-options)
- [Enhancing Dolphin Functionality](./dolphin.md#enhancing-dolphin-functionality)
- [Make Flatpak Apps Use KDE File Picker](./dolphin.md#make-flatpak-apps-use-kde-file-picker)

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

2. Click **Configure Spectacle...** which should launch the **Configure** window.

3. Configure the following settings:

   - **General**:
     - When launching Spectacle: `Do not take a screenshot automatically`.
     - After taking a screenshot:
       - Save file to default folder: `Enabled`.
       - `Copy image to clipboard`.
     - While Spectacle is running:
       - Press screenshot key to: `Take a new Screenshot`.
     - Rectangular Region Selection:
       - General:
         - Use light background: `Disabled`.
         - Accept on click-and-release: `Enabled`.
         - Show capture instructions: `Disabled`.
       - Show magnifier: `While holding Shift`.
       - Remember selected area: `Never`.

   - **Image Saving**:
     - Save Location: `~/Pictures/Screenshots/Desktop` (create the folder beforehand).
     - Compression Quality: `90%`.
     - Filename:
       - `Screenshot_<yyyy><MM><dd>_<HH><mm><ss>`, `PNG` (Plasma 6).
       - `Screenshot_%Y%M%D_%H%m%S`, `PNG` (Plasma 5).

   - **Video Saving**:
     - Save Location: `~/Videos/Screencasts` (create the folder beforehand).
     - Filename: `Screencast_<yyyy><MM><dd>_<HH><mm><ss>`, `MP4/H.264`.

4. Head to the **Shortcuts** tab and add custom keybindings for:

    > [!IMPORTANT]  
    > Skip this redundant and breaking step if you intend to use [Toshy](./toshy.md#kde-spectacle).

	- **Capture Active Window**: <kbd>Alt + Shift + 5</kbd>
	- **Capture Current Monitor**: <kbd>Alt + Shift + 3</kbd>
	- **Capture Rectangular Region**: <kbd>Alt + Shift + 4</kbd>

5.  Click **Apply** then **OK**.

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

This details some customisation options for the Plasma Desktop.

### Floating Dock

1. Right click the **Default Panel** (Taskbar/Dock).

2. Click the **Show Panel Configuration** option.

3. In the **Panel Settings** panel, set the following options:

   - Position: `Bottom`
   - Alignment: `Center`
   - Width: `Fit content`
   - Visibility: `Always visible`
   - Opacity: `Adaptive`
   - Style (Floating): `Enabled`

4. Adjust the **Panel Height** as you wish i.e. `64`.

5. If used with a [Menu Bar](#menu-bar), it is recommended to remove everything from the panel except the default **Icons-only Task Manager**.

6. Click the **Done** button in the **Panel Settings** panel.

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

    > [!IMPORTANT]  
    > Skip this redundant and breaking step if you intend to use [Toshy](./toshy.md#task-switcher).

    - All windows:

      - Forward: <kbd>Alt + Tab</kbd>
      - Reverse: <kbd>Alt + `</kbd>

    - Current application:

      - Forward: `None`
      - Reverse: `None`

8. Click **Apply**.

### Prettier Icons

1. Launch the **System Settings** application.

2. Click the **Colors & Themes** menu item under the **Appearance & Style** section.

3. Configure the **Icons**:

   - Click the **Icons** menu item.

   - Click the **Get New...** button.

   - In the provided search bar, search for `Mkos-Big-Sur` and click the **Install** button.

   - Close the **Download New Icons** window.

   - In the **Icons** page, select the **Mkos-Big-Sur-Night** (Dark) or **Mkos-Big-Sur** (Light) option and click the **Apply** button.

4. Configure the **Cursors**:

   - Click the **Cursors** menu item.

   - Click the **Get New...** button.

   - In the provided search bar, search for `Bibata Modern Classic` (Dark) or `Bibata Modern Ice` (Light) and click the **Install** button.

   - When prompted to **Pick Your Installation Option**, click the corresponding **Install** button for:

     - `Bibata-Modern-Classic.tar.xz` (Dark) or `Bibata-Modern-Ice.tar.xz` (Light).

   - Close the **Download New Cursors** window.

   - In the **Cursors** page, select the **Bibata-Modern-Classic** (Dark) or **Bibata-Modern-Ice** (Light) option and click the **Apply** button.

### Menu Bar

1. Right click the desktop and click the **Enter Edit Mode** button.

2. Expand the **Add Panel** dropdown and select the **Application Menu Bar** option.

3. Right click the **Application Menu Bar** and select the **Show Panel Configuration** option.

4. In the **Panel Settings** panel, set the following options:

   - Position: `Top`
   - Alignment: `Center`
   - Width: `Fill width`
   - Visibility: `Always visible`
   - Opacity: `Adaptive`
   - Style (Floating): `Disabled`

5. Adjust the **Panel Height** as you wish i.e. `32`.

6. [Add](#adding-a-widget) the following **Widgets** to the Menu Bar:

   - **Application Launcher**
   - **Window Title** by **dhruv8sh** or `plasma6-applets-window-title` (AUR): [Requires installation](#installing-a-widget)
   - **Global Menu**
   - **Digital Clock**
   - **System Tray**
   - **Peek at Desktop**

7. Position the widgets by clicking and dragging them like so on the Menu Bar in this order (from left to right):

   - **Application Launcher**
   - **Window Title**
   - **Global Menu**
   - **Panel Spacer** (Click the **Add Spacer** button)
   - **Digital Clock**
   - **Panel Spacer** (Click the **Add Spacer** button)
   - **System Tray**
   - **Peek at Desktop**

8.  [Configure](#configuring-a-widget) the following widgets as such:

   - **Window Title**:
     - **Appearance**:
       - Label style: `Application`
       - Icon:
         - Show when available: `Disabled`
       - Font:
         - Bold: `Disabled`
         - Italic: `Disabled`
         - First letters capital: `Enabled`
       - Length: `Based on contents`
       - Spacing: `4`
       - Left margin: `4`
       - Right margin: `4`
       - Click the **Apply** button
     - **Behavior**:
       - Filters:
         - Show only window information from current screen: `Disabled`
         - Show only when maximized: `Disabled`
       - Mouse:
         - Show tooltip on hover: `Enabled`
         - Scroll to cycle and minimize through your tasks: `Disabled`
       - Placeholder:
         - Show activity information: `Enabled`
       - Click the **Apply** button
     - Leave the rest as default and click the **OK** button
   - **Digital Clock**:
     - **Appearance**:
       - Information:
         - Show date: `Always beside time`
       - Show seconds: `Only in the tooltip`
       - Show time zone: `Only when different from local time zone`
       - Display time zone as: `Code`
       - Time display: `12-Hour`
       - Date format: `Long Date`
       - Text display: `Manual`
         - Font Family: `SF Pro Display`
         - Font Style: `Regular`
         - Font Size: `12`
       - Click the **Apply** button
     - Leave the rest as default and click the **OK** button
   - [**System Tray**](#cleaner-system-tray)

9.  Click the **Done** button in the **Panel Settings** panel.

### macOS-like Desktop

1. Launch the **System Settings** application.

2. Click the **Colors & Themes** menu item under the **Appearance & Style** section.

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

        > [!TIP]  
        > Select the `-solid` variant if you are using an NVIDIA GPU.

   - Click the **Apply** button.

4. Configure the **Plasma Style**:

   - Click the **Plasma Style** menu item.

   - Click the **Get New...** button.

   - In the provided search bar, search for `Apple-Dark Theme` (Dark) or `Mkos-BigSur-plasma` (Light) and click the **Install** button.

   - Close the **Download New Plasma Styles** window.

   - In the **Plasma Style** page, select the **AppleDark-ALL** (Dark) or **mkos-BigSur** (Light) option and click the **Apply** button.

5. Configure the **Window Decorations**:

   - Click the **Window Decorations** menu item.

   - Click the **Get New...** button.

   - In the provided search bar, search for `Big Sur Night mkos` (Dark) or `Mkos-BigSur-Aurora` (Light) and click the **Install** button.

   - Close the **Download New Window Decorations** window.

   - In the **Window Decorations** page, select the **Mkos-BigSur-Night** (Dark) or **Mkos-BigSur** (Light) option and click the **Apply** button.

   - Configure the **Window Borders**:

     - Expand the Window Borders dropdown to the right of the **Window Decorations** title.
     - Select the `Theme's default (Normal Window Borders)` option.
     - Click the **Apply** button.

   - Configure the **Titlebar Buttons**:

     - Click the **Configure Titlebar Buttons...** button.
     - Remove the **More actions for this window** button.
     - Remove the **On all desktops** button.
     - Remove the **Context help** button.
     - Drag the **Close** button to the far left.
     - Drag the **Minimize** button to the right of the **Close** button.
     - Drag the **Maximize** button to the right of the **Minimize** button.
     - Click the **Apply** button.

6. Configure macOS-like [**Icons** and **Cursors**](#prettier-icons).

7. Configure the **Splash Screen** *(Optional)*:

   - Click the **Splash Screen** menu item.

   - In the **Splash Screen** page, select the **None** option and click the **Apply** button.

8. Configure the **Login Screen**:

   - Click the **Login Screen (SDDM)** menu item.

   - Click the **Get New...** button.

   - In the provided search bar, search for `Apple Sonoma V3` and click the **Install** button.

   - When prompted to authenticate, enter your user password and click **OK**.

   - Close the **Download New Login Screen** window.

   - In the **Login Screen (SDDM)** page, select the **Apple-Sonoma-V3** option and click the **Apply** button.

   - When prompted to authenticate, enter your user password and click **OK**.

9. Add an [**Application Menu Bar**](#menu-bar) to the top of the screen.

10. Configure the **Default Panel** as a macOS-like [Dock](#floating-dock).

    > [!NOTE]  
    > It is no longer recommended to replace the default panel with a [**Plank**](./plank.md#setup) dock due to incompatibility with Wayland.

11. [Install](./fonts.md#installation) and [Configure](./fonts.md#configuration) macOS-like **Fonts** (including Emojis).

---

## Widgets

### Description

This details some additional widgets we could add to our desktop for added functionality.

### Installing a Widget

1. If the widget is available in your package manager, [install](./yay.md#install) the package using `yay` directly.

2. **Alternatively**, install the widget through the KDE Plasma Desktop:

   - Right click the desktop and select the **Enter Edit Mode** menu item.
   - Click the **Get New Widgets...** button.
   - Select the **Download New Plasma Widgets** option.
   - Use the provided search bar to search for the widget by their name.
   - Locate the widget and click its corresponding **Install** button.
   - If prompted to **Pick Your Installation Option**, click the desired downloadable item's corresponding **Install** button.
   - If prompted to authenticate, enter your user password and click **OK**.
   - Close the **Download New Plasma Widgets** window after you've finished.

### Adding a Widget

1. If you wish to add a widget to the **Desktop**, right click the desktop and select the **Enter Edit Mode** menu item.

2. If you wish to add a widget to a **Panel** (i.e. menu bar or dock), right click the panel and select the **Show Panel Configuration** menu item.

3. Click the **Add Widgets...** button.

4. Search for the widget in the provided search bar from the **Widgets** panel.

5. Click and drag the widget to the desired position and release it to add it.

### Configuring a Widget

1. Right click the widget and select its **Configure...** menu item.

2. Modify the widget's settings as desired in each section and click the **Apply** button to save the changes.

3. Click the **OK** button once done to save all changes.

### KDE Thermal Monitor

#### References

- [CPU temperature goes to off state](https://github.com/kotelnik/plasma-applet-thermal-monitor/issues/53#issuecomment-500287155)

#### Steps

1. [Install](yay.md#install) the `plasma6-applets-thermal-monitor-git` package using `yay`.

2. Check for available sensors on your system:

    ```sh
    sensors
    ```

    > [!NOTE]  
    > Do note that some sensors may require additional packages to be installed (i.e. `zenpower3-dkms` for newer Ryzen CPUs).

3. Add the widget and configure the sources:

   - Add the **Thermal Monitor** widget to the menu/taskbar.

   - Right click the widget and click the **Configure Thermal Monitor...** option.

   - From the newly opened **Thermal Monitor Settings** window, configure the following:

     - In the **Sensors** section, add each source you wish to have monitored:

       - Click the **Add Sensor...** button.
       - Click the corresponding **+** button on each source you wish added.
       - Click the **X** button from the **Add Sensor** window when you're done adding all sources.
       - For each sensor, click their corresponding **Pencil** (Edit) button and add a sensible **Name** (label) to it.

            > [!TIP]  
            > Sample sources: `lmsensors/zenpower-pci-00c3/temp1` (CPU), `gpu/gpu0/temperature` (GPU), `lmsensors/nvme-pci-0100/temp1` (SSD)

       - Once done, click the **Apply** button.

     - In the **Appearance** section, configure the following options:

       - Temperature:
         - Show unit: `Enabled`
         - Enable danger color: `Enabled`
         - Warning threshold: `75c`
         - Meltdown threshold: `90c`
       - Primary label: `Temperature`
       - Font scale: `1.0`
       - Once done, click the **Apply** button.

     - Click the **OK** button to save all changes.

#### Troubleshooting

> [!WARNING]  
> This fix was for an older version of the Thermal Monitor widget on KDE Plasma 5

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
