# Plasma Desktop

## Description

This topic focuses on the Plasma Desktop, a graphical desktop environment by KDE.

## Directory

- [Plasma Desktop](#plasma-desktop)
  - [Description](#description)
  - [Directory](#directory)
  - [Quality of Life Improvements](#quality-of-life-improvements)
    - [Description](#description-1)
    - [Dolphin](#dolphin)
      - [Show hidden files](#show-hidden-files)
      - [Add Refresh button](#add-refresh-button)
      - [Configure Dolphin options](#configure-dolphin-options)
      - [Show additional info and panel](#show-additional-info-and-panel)
      - [Show video thumbnails](#show-video-thumbnails)
      - [Enhancing Dolphin Functionality](#enhancing-dolphin-functionality)
    - [KRunner](#krunner)
    - [Spectacle](#spectacle)
  - [Theme Customisations](#theme-customisations)
    - [Description](#description-2)
    - [Floating "Dock"](#floating-dock)
    - [Cleaner System Tray](#cleaner-system-tray)
    - [Task Switcher](#task-switcher)

---

## Quality of Life Improvements

### Description

This details on some things that could be done to improve the experience of using the desktop.

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

1. Install the `ffmpegthumbs` package using `yay`:

    ```sh
    yay -S ffmpegthumbs
    ```

2. Open **Dolphin**.

3. Enter the **Configure Dolphin** menu (<kbd>Ctrl + Shift + ,</kbd>).

4. In the **General** section, click the **Previews** tab.

5. Tick the **Video Files (ffmpegthumbs)** option.

6. Click **Apply** and **OK**.

#### Enhancing Dolphin Functionality

1. Install the `dolphin-plugins` package using `yay`:

    ```sh
    yay -S dolphin-plugins
    ```

2. Install the `kio-gdrive` package using `yay` to add Google Drive directly into Dolphin:

    ```sh
    yay -S kio-gdrive
    ```

3. Install several Dolphin Service Menus.

    Create the `ServiceMenus` directory:

    ```sh
    mkdir -p ~/.local/share/kservices5/ServiceMenus
    ```

    Download and install [office2pdf](https://store.kde.org/p/1172774) to add Office documents conversion to PDF:

    ```sh
    cp office2pdf.desktop ~/.local/share/kservices5/ServiceMenus
    ```

    Download and install [KDE 5 Service Menu PDF](https://store.kde.org/p/1227799) using `yay` to add more PDF-related functionalities:

    ```sh
    yay -S kde-servicemenus-pdf
    ```

    Download and install [kompare_servicemenu](https://store.kde.org/p/1100884) using `yay` to add support for comparing different files:

    ```sh
    yay -S kde-servicemenus-komparemenu
    ```

    Download and install [KDE 5 Service Menu ReImage](https://store.kde.org/p/1231579) using `yay` to add support for extra image-related functionalities:

    ```sh
    yay -S kde-service-menu-reimage
    ```

    You may need to install some dependencies for `kde-service-menu-reimage` such as `jhead` for converting PNG images to JPG:

    ```sh
    yay -S jhead
    ```

4. Log out and log back into the desktop.

### KRunner

1. Launch KRunner by pressing <kbd>Alt + Space</kbd>.

2. Click the inline **Settings** icon on KRunner's far left.

3. In the KRunner Settings module, change the **Position on screen** option from **Top** to **Center**.

4. Click **Apply** then **OK**.

### Spectacle

1. Launch Spectacle.

2. Click **Configure** and you should be in the **General** tab.

3. For the **When launching Spectacle** option, set it to **Do not take a screenshot automatically**.

4. For the **After taking a screenshot** option, check the **Save file to default folder** box and set the dropdown value to **Copy image to clipboard**.

5. For the **Rectangular Region Selection** option, check the **Accept on click-and-release** box.

6. Head to the **Save** tab and change the **Save Location** to `~/Pictures/Screenshots/Desktop` (create the folder beforehand).

7. Head to the **Shortcuts** tab and add custom keybindings for:
	- **Capture Active Window**: <kbd>Alt + Shift + 5</kbd>
	- **Capture Current Monitor**: <kbd>Alt + Shift + 3</kbd>
	- **Capture Rectangular Region**: <kbd>Alt + Shift + 4</kbd>

8. Click **Apply** then **OK**.

---

## Theme Customisations

### Description

This details some customisation options for the desktop.

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

1. Right click the **Upward Arrow** icon at the bottom right of the taskbar that says **Show hidden icons**.

2. Click **Configure System Tray...**.

3. Click the **Entries** section.

4. Switch **KDE Connect** to **Always shown**.

5. Switch **Keyboard Layout** to **Always hidden**.

6. Switch **Lock Keys Status** to **Always hidden**.

7. Switch **Clipboard** to **Always hidden**.

8. Switch **Notifications** to **Always shown**.

9. Click **Apply** then **OK**.

### Task Switcher

1. Install the `kdeplasma-addons` package using `yay` to add more task switcher options:

    ```sh
    yay -S kdeplasma-addons
    ```

2. Launch the **System Settings** app.

3. Click the **Window Management** section.

4. Click the **Task Switcher** section.

5. In the **Main** tab, under the **Vizualisation** section, click the dropdown above the **Shortcuts** options.

6. By default, the **Breeze** task switcher is selected, switch this to **Thumbnail Grid**.

7. Click **Apply**.
