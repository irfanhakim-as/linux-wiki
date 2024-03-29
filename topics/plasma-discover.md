# Plasma Discover

## Description

This topic focuses on the Plasma Discover application, a graphical package manager by KDE.

## Directory

- [Plasma Discover](#plasma-discover)
  - [Description](#description)
  - [Directory](#directory)
  - [Discover and Flatpak Installation](#discover-and-flatpak-installation)
    - [Description](#description-1)
    - [Steps](#steps)
      - [Arch Linux](#arch-linux)
  - [Add Flathub Repository](#add-flathub-repository)
    - [Description](#description-2)
    - [Steps](#steps-1)
  - [Software Installation and Update](#software-installation-and-update)
    - [Description](#description-3)
    - [Steps](#steps-2)

---

## Discover and Flatpak Installation

### Description

This details how to install the Plasma Discover application and Flatpak.

### Steps

#### Arch Linux

1. Install the `discover` package using `yay`:

    ```sh
    yay -S discover
    ```

2. Install the `flatpak` package using `yay`:

    ```sh
    yay -S flatpak
    ```

---

## Add Flathub Repository

### Description

This details how to add the Flathub repository so we have access to Flatpak applications.

### Steps

1. Add the Flathub repository for the user:

    ```sh
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    ```

2. Add the Flathub repository for the system:

    ```sh
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    ```

3. To check the Flatpak repos/remotes available in our system:

    ```sh
    flatpak remotes --show-details
    ```

4. Add Flatpak/Flathub to the **Discover** app:

   - Open **Discover**.
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
