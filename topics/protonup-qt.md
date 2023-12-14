# ProtonUp-Qt

## Description

Install and manage GE-Proton and Luxtorpeda for Steam and Wine-GE for Lutris with this graphical user interface. Based on AUNaseef's ProtonUp, made with Python 3 and Qt 6.

## Directory

- [ProtonUp-Qt](#protonup-qt)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Update GE-Proton](#update-ge-proton)
    - [Description](#description-2)
    - [Steps](#steps-1)

## References

- [ProtonUp-Qt](https://github.com/DavidoTek/ProtonUp-Qt)

---

## Setup

### Description

This details the installation of ProtonUp-Qt and GE-Proton.

### Steps

1. Launch the **Discover** app and install the [**ProtonUp-Qt**](https://flathub.org/apps/net.davidotek.pupgui2) package.

2. Launch the **ProtonUp-Qt** app.

3. Click the **Add version** button.

4. Under **Compatibility tool**, select `GE-Proton`.

5. Under **Version**, select the latest version available.

6. Click the **Install** button and wait for the download and installation to complete.

7. Click the **Close** button to close the app.

---

## Update GE-Proton

### Description

This details the steps to update the GE-Proton version for your installed games.

### Steps

1. Launch the **ProtonUp-Qt** app.

2. Ensure the **Install for** dropdown is selected to the correct directory/application (i.e. Steam).

3. Under **Installed compatibility tools**, it is assumed that you have an older version of GE-Proton installed and currently used by one or several games. Install the latest version that will be used to replace the older version:

   - Click the **Add version** button.

   - Under **Compatibility tool**, select `GE-Proton`.

   - Under **Version**, select the latest version available.

   - Click the **Install** button and wait for the download and installation to complete.

4. Select the older version of GE-Proton that is currently in use and click the **Show info** button.

5. In the newly opened **About compatibility tool** window, click the **Batch update** button.

6. Under the **New version** dropdown, select the latest version of `GE-Proton` we just installed, and click the **Batch update** button.

7. Once the batch update is complete, click the **Close** button to close the **About compatibility tool** window.

8. Under the list of **Installed compatibility tools**, select the older version of GE-Proton we have just replaced and click the **Remove selected** button to uninstall it.

9. Click the **Close** button to close the app.
