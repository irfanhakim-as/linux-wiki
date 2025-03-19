# Visual Studio Code

## Description

Visual Studio Code, commonly referred to as VS Code, is an integrated development environment developed by Microsoft for Windows, Linux, macOS and web browsers.

## Directory

- [Visual Studio Code](#visual-studio-code)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Configuration](#configuration)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)
    - [Native Title Bar](#native-title-bar)

## References

- [Visual Studio Code](https://code.visualstudio.com)
- [Wikipedia](https://en.wikipedia.org/wiki/Visual_Studio_Code)

---

## Setup

### Description

This details the installation process of the Visual Studio Code editor.

### References

- [Setting up Visual Studio Code](https://code.visualstudio.com/docs/setup/setup-overview)

### Steps

1. [Install](flatpak.md#install) the **Visual Studio Code** (`com.visualstudio.code`) app as a Flatpak.

---

## Configuration

### Description

This details some configuration options for the Visual Studio Code editor.

### References

- [User and workspace settings](https://code.visualstudio.com/docs/editor/settings)

### Steps

This details how to configure the Visual Studio Code editor:

1. Launch the **Visual Studio Code** application.

2. Activate the **Command Palette** by pressing <kbd>Ctrl + Shift + P</kbd> simultaneously and type in `Settings` in the provided prompt.

3. Select either one of the following options:

   - **Preferences: Open Settings (UI)**: This will open the graphical settings interface.
   - **Preferences: Open User Settings (JSON)**: This will open the editor's JSON settings file.

4. Make your changes accordingly and save the file if you are configuring through the JSON settings file.

### Native Title Bar

This details the configuration option required to make Visual Studio Code use the native title bar or window decoration theming on your desktop:

1. In the graphical settings interface, search for the `title bar style` setting.

2. From the search results, locate the **Window: Title Bar Style** setting.

3. Expand the dropdown and select the `native` option.

4. **Alternatively**, if you are using the JSON settings file, update or add the following configuration to the file:

    ```json
    "window.titleBarStyle": "native"
    ```
