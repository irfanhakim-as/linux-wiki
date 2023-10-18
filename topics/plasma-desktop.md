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

Show hidden files:

- In the Dolphin app, click the **Hamburger** menu.
- Enable **Show Hidden Files**.

Add Refresh button:

- In the Dolphin app, click the **Hamburger** menu.
- Hover over **Configure**, and select **Configure Toolbars**.
- Search for **Refresh** in the **Filter** box under **Available actions**.
- Select the Refresh action and drag it to the **Current actions** list right before/above the **Split** action.
- Click **Apply** and **OK**.

Configure Dolphin options:

- In the Dolphin app, click the **Hamburger** menu.
- Hover over **Configure**, and select **Configure Dolphin**.
- Click the **General** section, then click the **Confirmations** tab.
- Uncheck the **Closing windows with multiple tabs** option.

- Click the **Startup** section, and select the second option under **Show on startup**.
- Click the inline **Folder** icon button, then click the **Downloads** folder.
- Click **OK**, this will set the Downloads folder as the default folder upon launch.

- In the same Startup section, select the **Show full path inside location bar** option under **General**.

- Once all changes have been made, click **Apply** then **OK**.

Show additional info and panel:

- In the Dolphin app, click the **Hamburger** menu.
- Hover over **Show Additional Information**, and select **Size**.
- Now from the Hamburger menu, hover over **Show Panels**, and select **Information**.

### KRunner

- Launch KRunner by pressing <kbd>Alt + Space</kbd>.
- Click the inline **Settings** icon on KRunner's far left.
- In the KRunner Settings module, change the **Position on screen** option from **Top** to **Center**.
- Click **Apply** then **OK**.

### Spectacle

- Launch Spectacle.
- Click **Configure** and you should be in the **General** tab.
- For the **When launching Spectacle** option, set it to **Do not take a screenshot automatically**.
- For the **After taking a screenshot** option, check the **Save file to default folder** box and set the dropdown value to **Copy image to clipboard**.
- For the **Rectangular Region Selection** option, check the **Accept on click-and-release** box.
- Head to the **Save** tab and change the **Save Location** to `~/Pictures/Screenshots/Desktop` (create the folder beforehand).
- Head to the **Shortcuts** tab and add custom keybindings for:
	- **Capture Active Window**: <kbd>Alt + Shift + 5</kbd>
	- **Capture Current Monitor**: <kbd>Alt + Shift + 3</kbd>
	- **Capture Rectangular Region**: <kbd>Alt + Shift + 4</kbd>
- Click **Apply** then **OK**.

---

## Theme Customisations

### Description

This details some customisation options for the desktop.

### Floating "Dock"

- Right click the taskbar on our desktop.
- Click **Enter Edit Mode**.
- Click **More Options...**.
- Select the **Floating Panel** checkbox.
- Increase **Panel height** if you wish.
- Set the **Panel Alignment** to **Center**.
- Decrease the width of the panel to as short as possible using the arrows.
- Exit Edit Mode.

### Cleaner System Tray

- Right click the **Upward Arrow** icon at the bottom right of the taskbar that says **Show hidden icons**.
- Click **Configure System Tray...**.
- Click the **Entries** section.
- Switch **KDE Connect** to **Always shown**.
- Switch **Keyboard Layout** to **Always hidden**.
- Switch **Lock Keys Status** to **Always hidden**.
- Switch **Clipboard** to **Always hidden**.
- Switch **Notifications** to **Always shown**.
- Click **Apply** then **OK**.

### Task Switcher

- Launch the **System Settings** app.
- Click the **Window Management** section.
- Click the **Task Switcher** section.
- In the **Main** tab, under the **Vizualisation** section, click the dropdown above the **Shortcuts** options.
- By default, the **Breeze** task switcher is selected, switch this to **Thumbnail Grid**.
- Click **Apply**.
