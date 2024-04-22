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
  - [Usage](#usage)
    - [Description](#description-3)
    - [Steps](#steps-2)
      - [Install](#install)
      - [Update](#update)
      - [Uninstall](#uninstall)
      - [Query](#query)

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

## Usage

### Description

This details how to use the Plasma Discover application to search, install, update, or uninstall packages graphically.

### Steps

#### Install

1. In the **Discover** app, search/browse for the apps you wish to install using the provided **Search** bar in the top left.

2. Select the application from the search result to open its detailed view.

3. Select the **Sources** dropdown if available and select a source where you wish to install the package from:

   - **Flathub**: To install from the Flathub repository for the entire system.
   - **Flathub (user)**: To install from the Flathub repository for the current user only.

4. Click **Install** to install them.

#### Update

1. In the **Discover** app, go to the **Updates** section.

2. Wait for Discover to fetch available updates.

3. Click the **Update All** button in the top right to update all of your apps accordingly.

#### Uninstall

1. In the **Discover** app, search/browse for the apps you wish to uninstall using the provided **Search** bar in the top left.

2. Select the application from the search result to open its detailed view.

3. Click **Remove** to uninstall them.

4. After it's done uninstalling, click the **Delete settings and user data** button to remove its app data.

#### Query

1. In the **Discover** app, search/browse for the apps you wish to find using the provided **Search** bar in the top left by entering the app name.

2. To view more details about an app, click on the app from the search result to open its detailed view.
