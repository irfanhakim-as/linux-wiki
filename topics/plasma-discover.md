# Plasma Discover

## Description

This topic focuses on the Plasma Discover application, a graphical package manager by KDE.

## Directory

- [Plasma Discover](#plasma-discover)
  - [Description](#description)
  - [Directory](#directory)
  - [Installation](#installation)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Add Flathub Repository](#add-flathub-repository)
    - [Description](#description-2)
    - [Steps](#steps-1)
  - [Software Installation and Update](#software-installation-and-update)
    - [Description](#description-3)
    - [Steps](#steps-2)

---

## Installation

### Description

This details how to install the Plasma Discover application (and Flatpak).

### Steps

1. [Install](yay.md#install) the `discover` package using `yay`.

2. Follow [this guide](flatpak.md#installation) to install Flatpak so we could use it with Discover.

---

## Add Flathub Repository

### Description

This details how to add the Flathub repository to Plasma Discover so we have access to Flatpak applications.

### Steps

1. Follow [this guide](flatpak.md#add-flathub-repository) to add the Flathub repository for the user and system.

2. Add Flatpak/Flathub to the **Discover** app and make them default:

   - Launch the **Discover** app.
   - Go to **Settings**.
   - Select the Flatpak repos available (system and user).
   - Make Default.

---

## Software Installation and Update

### Description

This details how to install desktop applications (as **Flatpaks**) and update them.

### Steps

While in desktop mode, you're able to install desktop apps for everyday use. This is done using the **Discover** app.

1. To install apps, simply launch the **Discover** app.

2. Search/browse for the apps you wish to install using the provided **Search** bar in the top left.

3. Select the application from the search result to open its detailed view.

4. Select the **Sources** dropdown if available and select **Flathub** or **Flathub (user)**.

5. Click **Install** to install them.

If any updates are available to these apps, they will appear in the **Updates** section found in the bottom left of the side panel in the Discover app.

1. To update apps, just go to the **Updates** section.

2. Wait for Discover to fetch available updates.

3. Click the **Update All** button in the top right to update all of your apps accordingly.
