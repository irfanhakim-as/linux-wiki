# Plank

## Description

Plank is meant to be the simplest dock on the planet. The goal is to provide just what a dock needs and absolutely nothing more.

> [!NOTE]  
> Certain parts of this guide assumes that you are using the KDE Plasma desktop environment.

## Directory

- [Plank](#plank)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Dual Monitor Setup](#dual-monitor-setup)
    - [Description](#description-2)
    - [References](#references-1)
    - [Steps](#steps-1)

## References

- [Plank](https://github.com/ricotz/plank)

---

## Setup

### Description

This guides how to install and setup the Plank dock.

### Steps

1. [Install](yay.md#install) the **Plank** (`plank`) dock using `yay`.

2. Configure the Plank dock:

    - Run the Plank dock.

    - <kbd>Ctrl</kbd> + right click on the dock.

    - Click the **Preferences** option.

    - In the **Appearance** tab, set the following values:
      - **Theme**: `Default`
      - **Position**: `Bottom`
      - **Icon Size**: `48`
      - **Icon Zoom**: `130`

    - In the **Behaviour** section, set the following values:
      - **Hide Dock**: Disabled
      - **Pressure Reveal**: Disabled
      - **Show Unpinned**: Enabled
      - **Restrict to Workspace**: Enabled
      - **Lock Icons**: Disabled

    - Remove any **Docklets** from the Plank dock.

3. Set the Plank dock to [autostart](autostart.md#add-application-to-autostart) upon boot.

4. Add applications to the dock by launching the application while the Plank dock is running and right clicking the application's icon in the dock and selecting the **Keep in Dock** option.

---

## Dual Monitor Setup

### Description

This guide details how we could have a Plank dock for each of our 2 monitors.

> [!NOTE]  
> This guide assumes that you have already followed the [Setup](#setup) guide.

### References

- [Fun tip: Have plank run on multiple monitors!](https://www.reddit.com/r/elementaryos/comments/21nfw9/fun_tip_have_plank_run_on_multiple_monitors)
- [Plank - Configuration](https://wiki.archlinux.org/title/Plank#Configuration)

### Steps

> [!IMPORTANT]  
> Keep all the applications that we wish to keep to the dock before proceeding with the following steps.

1. Create a new dock named `dock2`:

    ```sh
    plank -n dock2
    ```

2. Get into our `plank` configuration directory:

    ```sh
    cd ${HOME}/.config/plank
    ```

3. Create a symbolic link to the `dock1` directory as `dock2`:

    ```sh
    ln -sf dock1 dock2
    ```

4. Create a dump of our Plank dock config as `docks.ini` using `dconf`:

    ```sh
    dconf dump /net/launchpad/plank/docks/ > ~/docks.ini
    ```

5. Edit the `docks.ini` file and add a new set of configuration for `dock2`.

    Edit the `docks.ini` file we had just dumped:

    ```sh
    nano ~/docks.ini
    ```

    Duplicate `dock1`'s configurations as `dock2`'s configurations. Change only the `monitor` value of `dock2` to be our secondary monitor:

    ```ini
    [dock1]
    alignment='center'
    auto-pinning=true
    current-workspace-only=true
    dock-items=['org.kde.dolphin.dockitem', 'org.mozilla.firefox.dockitem', 'firefoxdeveloperedition.dockitem', 'org.mozilla.Thunderbird.dockitem', 'org.kde.kalendar.dockitem', 'com.visualstudio.code.dockitem', 'org.telegram.desktop.dockitem', 'org.signal.Signal.dockitem', 'com.discordapp.Discord.dockitem', 'org.kde.kasts.dockitem', 'com.slack.Slack.dockitem', 'notable.dockitem', 'fr.handbrake.ghb.dockitem', 'tv.plex.PlexDesktop.dockitem', 'com.spotify.Client.dockitem', 'anydesk.dockitem', 'org.eduvpn.client.dockitem', 'steam.dockitem', 'com.obsproject.Studio.dockitem', 'Alacritty.dockitem', 'systemsettings.dockitem']
    hide-delay=0
    hide-mode='none'
    icon-size=48
    items-alignment='center'
    lock-items=false
    monitor='DP-4'
    offset=0
    pinned-only=false
    pressure-reveal=false
    show-dock-item=false
    theme='Default'
    tooltips-enabled=true
    unhide-delay=0
    zoom-enabled=true
    zoom-percent=130

    [dock2]
    alignment='center'
    auto-pinning=true
    current-workspace-only=true
    dock-items=['org.kde.dolphin.dockitem', 'org.mozilla.firefox.dockitem', 'firefoxdeveloperedition.dockitem', 'org.mozilla.Thunderbird.dockitem', 'org.kde.kalendar.dockitem', 'com.visualstudio.code.dockitem', 'org.telegram.desktop.dockitem', 'org.signal.Signal.dockitem', 'com.discordapp.Discord.dockitem', 'org.kde.kasts.dockitem', 'com.slack.Slack.dockitem', 'notable.dockitem', 'fr.handbrake.ghb.dockitem', 'tv.plex.PlexDesktop.dockitem', 'com.spotify.Client.dockitem', 'anydesk.dockitem', 'org.eduvpn.client.dockitem', 'steam.dockitem', 'com.obsproject.Studio.dockitem', 'Alacritty.dockitem', 'systemsettings.dockitem']
    hide-delay=0
    hide-mode='none'
    icon-size=48
    items-alignment='center'
    lock-items=false
    monitor='DP-2'
    offset=0
    pinned-only=false
    pressure-reveal=false
    show-dock-item=false
    theme='Default'
    tooltips-enabled=true
    unhide-delay=0
    zoom-enabled=true
    zoom-percent=130
    ```

    In this example, the primary monitor is `DP-4` while the secondary monitor is `DP-2`.

6. Load the new `docks.ini` configuration for Plank to use:

    ```sh
    cat ~/docks.ini | dconf load /net/launchpad/plank/docks/
    ```

7. Add Plank to **Autostart** in the **System Settings** app. Refer to **Step 3** from the [Setup](#setup) guide on how to do so.

8. In the same **Autostart** page, update the added Plank's **Properties**.

    - In Plank's **Properties**, click the **Application** tab.

    - In the **Arguments** field, add the following argument:

        ```sh
        -n dock1
        ```

    - Click the **OK** button.

9. Duplicate the created `plank.desktop` file in `~/.config/autostart` as `plank2.desktop`:

    ```sh
    cp ~/.config/autostart/plank.desktop ~/.config/autostart/plank2.desktop
    ```

10. Update the following attributes as such in the `plank2.desktop` file:

    ```desktop
    Exec=plank -n dock2
    Name[en_US]=Plank 2
    Name=Plank 2
    ```

    Now, we should have **Plank** and **Plank 2** in our **Autostart** page. This will launch `dock1` and `dock2` in their respective monitors upon boot.
