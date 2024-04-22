# Flatpak

## Description

Flatpak, formerly known as xdg-app, is a utility for software deployment and package management for Linux. It is advertised as offering a sandbox environment in which users can run application software in isolation from the rest of the system.

> [!NOTE]  
> Parts of this guide assumes that you are using the KDE Plasma desktop environment.

## Directory

- [Flatpak](#flatpak)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [Installation](#installation)
    - [Add Flathub Repository](#add-flathub-repository)
  - [Usage](#usage)
    - [Description](#description-2)
    - [Steps](#steps)
      - [Install](#install)
      - [Update](#update)
      - [Uninstall](#uninstall)
      - [Query](#query)
  - [Respect KDE Theme](#respect-kde-theme)
    - [Description](#description-3)
    - [References](#references-1)
    - [Steps](#steps-1)
  - [Make Flatpak Apps Use KDE File Picker](#make-flatpak-apps-use-kde-file-picker)
    - [Description](#description-4)
    - [References](#references-2)
  - [Add Permission Overrides](#add-permission-overrides)
    - [Description](#description-5)
    - [Steps](#steps-2)
  - [Recommended Global Permissions](#recommended-global-permissions)
    - [Description](#description-6)
    - [Steps](#steps-3)
  - [Migrating to Flatpak](#migrating-to-flatpak)
    - [Description](#description-7)
    - [References](#references-3)
    - [Steps](#steps-4)

## References

- [Flatpak](https://flatpak.org)

---

## Setup

### Description

This details how to install Flatpak and add the Flathub repository so we have access to Flatpak applications.

### Installation

1. [Install](yay.md#install) the `flatpak` package using `yay`.

### Add Flathub Repository

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

---

## Usage

### Description

This details how to use `flatpak` to search, install, update, or uninstall Flatpak packages.

### Steps

> [!TIP]  
> To install or update a package graphically, use the [Discover](plasma-discover.md#software-installation-and-update) app.

> [!NOTE]  
> Replace `<package>` with the actual name of the package you wish to search, install, or update.

#### Install

1. To install a package:

    ```sh
    flatpak install <package>
    ```

    Add the `--user` flag to install the package for the current user only instead of system-wide:

    ```sh
    flatpak install --user <package>
    ```

#### Update

1. To update a package:

    ```sh
    flatpak update <package>
    ```

2. To update all packages:

    ```sh
    flatpak update
    ```

#### Uninstall

1. To uninstall a package:

    ```sh
    flatpak uninstall <package>
    ```

2. To uninstall orphaned (unused) packages:

    ```sh
    flatpak uninstall --unused
    ```

    Add the `--delete-data` flag to also delete the app data.

#### Query

1. To search for a package:

    ```sh
    flatpak search <package>
    ```

---

## Respect KDE Theme

### Description

This solves the issue of (some) Flatpak apps not looking native in KDE, and defaulting to a GTK theme instead.

### References

- [Plasma consistent Flatpak theming](https://www.reddit.com/r/kde/comments/ujqih9/plasma_consistent_flatpak_theming)

### Steps

1. Install Breeze GTK theme as a Flatpak:

    ```sh
    flatpak install --user org.gtk.Gtk3theme.Breeze
    ```

2. Override permissions to use the Breeze theme for both System and User Flatpaks:

    ```sh
    sudo flatpak override --system --filesystem=xdg-config/gtk-3.0:ro --filesystem=xdg-config/gtkrc-2.0:ro --filesystem=xdg-config/gtk-4.0:ro --filesystem=xdg-config/gtkrc:ro --env "GTK_THEME=Breeze"
    flatpak override --user --filesystem=xdg-config/gtk-3.0:ro --filesystem=xdg-config/gtkrc-2.0:ro --filesystem=xdg-config/gtk-4.0:ro --filesystem=xdg-config/gtkrc:ro --env "GTK_THEME=Breeze"
    ```

---

## Make Flatpak Apps Use KDE File Picker

### Description

This makes Flatpak apps use Dolphin as the File Picker and not Nautilus (GTK).

### References

- [Make Flatpak Apps Use KDE File Picker](plasma-desktop.md#make-flatpak-apps-use-kde-file-picker)

---

## Add Permission Overrides

### Description

This details how to add permission overrides for Flatpaks using Flatseal.

> [!IMPORTANT]  
> The **Flatseal** Flatpak app is required for this guide.

### Steps

1. Launch the **Flatseal** app. [Install](./plasma-discover.md#software-installation-and-update) [Flatseal](https://flathub.org/apps/com.github.tchx84.Flatseal) if you haven't already.

2. Choose the Flatpak application you wish to add permission overrides for:

   - To add permission overrides for **all Flatpaks (Global)**, select the **All Applications** menu item.

   - To add permission overrides for **a specific Flatpak**, select the **specific Flatpak application** menu item.

3. In the selected Flatpak app's view, several sections of permissions are listed that could be overridden.

    These sections include:

   - **Share**: List of subsystems shared with the host system.

   - **Socket**: List of well-known sockets available in the sandbox.

   - **Device**: List of devices available in the sandbox.

   - **Allow**: List of features available to the application.

   - **Filesystem**: List of filesystem subsets available to the application.

   - **Persistent**: List of homedir-relative paths created in the sandbox.

   - **Environment**: List of variables exported to the application.

   - **System Bus**: List of well-known names on the system bus.

   - **Session Bus**: List of well-known names on the session bus.

    Most of these sections could easily be updated through simple toggles, some require adding in specific paths or values.

4. To expose additional, specific file or directory paths to the application:

   - Under **Other files**, click the **Add folder** icon.

   - Add in the path to the file or directory you want to expose to the application in the provided text field.

   - To remove a path, simply click the corresponding cross or **X** icon next to the path.

5. To add in specific environment variables:

   - Under **Variables** within the **Environment** section, click the **+** button.

   - Add in the environment variable (and value) you want to export to the application in the provided text field.

   - To remove an environment variable, simply click the corresponding cross or **X** icon next to the environment variable.

6. After updating the permissions, simply restart the (running) Flatpak app for the changes to apply.

---

## Recommended Global Permissions

### Description

This details how to set global permissions for Flatpak apps and the recommended permissions to set. This should fix issues such as custom cursor icons not being used, and files not being able to be read or written in Flatpak apps to/from a remote directory.

> [!IMPORTANT]  
> The **Flatseal** Flatpak app is required for this guide.

### Steps

1. Refer to the [Add Permission Overrides](#add-permission-overrides) section to set permission overrides for all of your installed Flatpak applications (globally).

2. Under **Other files** in the **Filesystem** section, expose the following paths to your Flatpak applications globally:

   - `xdg-videos:rw`
   - `xdg-music:rw`
   - `xdg-documents:rw`
   - `xdg-download:rw`
   - `xdg-pictures:rw`
   - `xdg-config/fontconfig:ro`
   - `~/.icons:ro`
   - `/mnt/mynas:rw`

    > [!WARNING]  
    > Replace `/mnt/mynas` with the path of your remote directory if you have one, else exclude it.

    > [!TIP]  
    > It is highly recommended to have all user fonts installed to the `~/.local/share/fonts` directory so our Flatpak apps can see/use them.

    > [!NOTE]  
    > The `xdg-config/fontconfig:ro` override allows Flatpak apps to utilise the font configurations we have made using the `~/.config/fontconfig/fonts.conf` file.

---

## Migrating to Flatpak

### Description

This details how to migrate your configurations and data from _standard_ packages to Flatpaks.

> [!NOTE]  
> The exact steps to do this for each app might vary, but they are largely the same. This guide will focus on **Mozilla Firefox** as an example.

### References

- [Back up and restore information in Firefox profiles](https://support.mozilla.org/en-US/kb/back-and-restore-information-firefox-profiles#w_restoring-to-a-different-location)

### Steps

> [!NOTE]  
> This guide assumes that you have been using the standard package of Firefox, and intend to migrate to the Flatpak version without losing your configurations and data.

1. [Install](./plasma-discover.md#software-installation-and-update) [Firefox](https://flathub.org/apps/details/org.mozilla.firefox) as a Flatpak if you haven't already.

2. Launch the **Firefox** Flatpak at least once so that a default (Firefox) profile gets created

3. Identify the folder of your **old**/existing default Firefox (the _standard_ version) profile in `~/.mozilla/firefox`. The name of the folder should end with `.default-release`.

    List the contents of the `~/.mozilla/firefox` directory:

    ```sh
    ls -la ~/.mozilla/firefox
    ```

    Sample output:

    ```
    drwx------   - myuser 21 Oct  2022 b89131cr.default
    drwx------   - myuser 23 Nov 20:17 'Crash Reports'
    drwx------   - myuser 11 Nov  2022 'Pending Pings'
    drwx------   - myuser 26 Nov 20:02 9h74n8km.dev-edition-default
    drwx------   - myuser 31 Jan 00:37 30y0vmjh.default-release
    .rw-r--r-- 128 myuser  1 Nov  2022 installs.ini
    .rw-r--r-- 416 myuser  1 Nov  2022 profiles.ini
    ```

    In this example, the folder of the old/existing default Firefox profile is `~/.mozilla/firefox/30y0vmjh.default-release`.

4. Identify the folder of your **new** default Firefox (Flatpak) profile in `~/.var/app/org.mozilla.firefox/.mozilla/firefox`. The name of the folder should end with `.default-release`.

    List the contents of the `~/.var/app/org.mozilla.firefox/.mozilla/firefox` directory:

    ```sh
    ls -la ~/.var/app/org.mozilla.firefox/.mozilla/firefox
    ```

    Sample output:

    ```
    drwx------   - myuser 31 Jan 00:37 .
    drwxr-xr-x   - myuser 31 Jan 00:37 ..
    drwx------   - myuser 21 Nov 23:25 'Crash Reports'
    drwx------   - myuser 31 Jan 00:37 7a4wff6q.default
    drwx------   - myuser 31 Jan 00:37 'Pending Pings'
    drwx------   - myuser 26 Nov 21:17 l43l38rr.default-release
    .rw-r--r--  62 myuser 31 Jan 00:37 installs.ini
    .rw-r--r-- 259 myuser 31 Jan 00:37 profiles.ini
    ```

    In this example, the folder of the new default Firefox profile is `~/.var/app/org.mozilla.firefox/.mozilla/firefox/l43l38rr.default-release`.

5. Copy the **contents** of the **old**/existing (standard) Firefox profile folder (i.e. `30y0vmjh.default-release`), into the **new** (Flatpak) Firefox profile folder (i.e. `l43l38rr.default-release`):

    > [!TIP]  
    > If you have a `cp` alias for `cp -i`, you can override the alias to skip prompts asking to overwrite files by adding `command` to the beginning of the command below (before `cp`).

    ```sh
    cp -rf ~/.mozilla/firefox/30y0vmjh.default-release/* ~/.var/app/org.mozilla.firefox/.mozilla/firefox/l43l38rr.default-release
    ```
