# Firefox

## Description

Mozilla Firefox, or simply Firefox, is a free and open source web browser developed by the Mozilla Foundation and its subsidiary, the Mozilla Corporation.

## Directory

- [Firefox](#firefox)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Configuration](#configuration)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
    - [Use Native File Manager](#use-native-file-manager)
  - [Preferences](#preferences)
    - [Description](#description-2)
    - [Steps](#steps-1)
  - [Customise Toolbar](#customise-toolbar)
    - [Description](#description-3)
    - [Steps](#steps-2)
    - [Follow KDE Plasma Window Decoration](#follow-kde-plasma-window-decoration)
  - [Update Default Search Engine](#update-default-search-engine)
    - [Description](#description-4)
    - [Steps](#steps-3)

## References

- [Mozilla Firefox](https://www.mozilla.org/en-US/firefox)

---

## Configuration

### Description

This details how to modify Firefox's configurations and some recommended settings.

### References

- [XDG Desktop Portal integration](https://wiki.archlinux.org/title/Firefox#XDG_Desktop_Portal_integration)

### Steps

1. Launch the **Firefox** application.

2. In the address bar, type `about:config` and submit by hitting the <kbd>Enter</kbd> key.

3. When prompted with the **Proceed with Caution** warning, click the **Accept the Risk and Continue** button.

4. Using the provided search bar, search for the setting you wish to configure.

5. After locating the specific setting entry, edit its value:

   - If it's a boolean setting, click its corresponding **Toggle** button to toggle it from `true` to `false` and vice versa.
   - Otherwise, click its corresponding **Edit** button to edit its value accordingly.

6. Restart the application.

### Use Native File Manager

This details how to enable the use of the native file manager on Firefox.

1. Update the following setting accordingly:

   - **widget.use-xdg-desktop-portal.file-picker**: `1`

---

## Preferences

### Description

This details how to modify Firefox's preferences and some recommended settings.

### Steps

1. Launch the **Firefox** application.

2. Head to the **Settings** page by clicking on the **Hamburger** icon in the top right corner and selecting the **Settings** menu item.

3. Scroll through the **Settings** page and locate any settings you wish to change.

4. Make your changes accordingly.

---

## Customise Toolbar

### Description

This details how to customise Firefox's toolbar and some recommended configurations.

### Steps

1. Launch the **Firefox** application.

2. Right click the **Toolbar** (area surrounding the address bar).

3. Select the **Customize Toolbar...** option.

4. Make your changes accordingly in the **Customize Firefox** page and click the **Done** button once finished.

### Follow KDE Plasma Window Decoration

This details how to make Firefox use the native window decoration theming on KDE Plasma:

1. At the bottom of the **Customize Firefox** page, check the **Title Bar** box to enable it.

---

## Update Default Search Engine

### Description

This details how to update the default search engine on Firefox.

### Steps

1. Launch the **Firefox** application.

2. If it's a directly supported search engine on Firefox, simply update the following [Firefox setting](#preferences) in the **Search** tab:

   - **Default Search Engine**: Any of the provided search engines in the dropdown (i.e. `DuckDuckGo`)

3. Otherwise, if it's a custom search engine, use the address bar and head to the search engine's endpoint (page).

4. While on the search engine page, right click the address bar and select the **Add "Custom Search Engine"** context menu option.

    > [!TIP]  
    > In this or any of the following steps, the **Custom Search Engine** name will be different depending on the actual name of the custom search engine.

5. Once the custom search engine has been added to Firefox, update the following [Firefox setting](#preferences) in the **Search** tab:

   - **Default Search Engine**: The custom search engine

    **Optionally**, update the **Search Shortcuts** setting by enabling the custom search engine's entry and adding a concise **Keyword** to it (i.e. `@custom`) to make it easier to search with it explicitly if it isn't set as the default.
