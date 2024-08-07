# Toshy

## Description

Toshy is a config file for the `xwaykeyz` Python-based keymapper for Linux along with some commands and apps to more conveniently interact with and manage the keymapper. The purpose of Toshy is to match, as closely as possible, the behavior of keyboard shortcuts in macOS when working on similar applications in Linux.

## Directory

- [Toshy](#toshy)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references-1)
    - [Prerequisites](#prerequisites)
    - [Steps](#steps)
  - [Configuration](#configuration)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)
    - [Modifier and Click Combination](#modifier-and-click-combination)
    - [Emoji Picker](#emoji-picker)
    - [KDE Spectacle](#kde-spectacle)
  - [Additional Workarounds](#additional-workarounds)
    - [Description](#description-3)
    - [References](#references-3)
    - [Firefox](#firefox)

## References

- [toshy](https://github.com/RedBearAK/toshy)

---

## Setup

> [!IMPORTANT]  
> This guide assumes that you are using the KDE Plasma desktop environment.

### Description

This details the installation steps for Toshy.

### References

- [How to Install](https://github.com/RedBearAK/toshy?tab=readme-ov-file#how-to-install)

### Prerequisites

1. For Toshy to work as intended post-install, your Plasma system must be using the native, default set of shortcuts and keybindings.

    If you have modified the keybindings of certain applications or actions on your desktop, set them back to the default:

    1. Launch the **System Settings** application.

    2. Under the **Input & Output** section, select the **Keyboard** menu item.

    3. In the **Keyboard** page, select the **Shortcuts** tab.

    4. In the **Shortcuts** page, click the **Defaults** button found at the bottom left.

    5. Click the **Apply** button.

2. For Toshy to install successfully, [update](./yay.md#update) (and reboot) your system beforehand.

### Steps

1. Clone the Toshy Git repository to the home directory:

    ```sh
    git clone ~/toshy https://github.com/RedBearAK/toshy.git
    ```

2. Enter the cloned `toshy` repository:

    ```sh
    cd ~/toshy
    ```

3. Install Toshy:

    ```sh
    ./setup_toshy.py install
    ```

4. Reboot the system.

---

## Configuration

### Description

This details some recommended Toshy configuration options for an improved experience.

### References

- [Logitech MX Keys Mini F7 function changes when Toshy is enabled](https://github.com/RedBearAK/toshy/issues/357)
- [Mod+clicking blocked by keymapper Suspend Timeout](https://github.com/RedBearAK/toshy/wiki/FAQ-(Frequently-Asked-Questions)#modclicking-blocked-by-keymapper-suspend-timeout)

### Steps

1. Update the Toshy configuration supplied from the installation:

    ```sh
    nano ~/.config/toshy/toshy_config.py
    ```

    > [!TIP]  
    > Should you need it, a backup of the default config file can be found at `~/.config/toshy/default-toshy-config/toshy_config.py`

2. Save any changes made to the file.

3. Restart the Toshy services either graphically or through the terminal:

   - Graphical method:

     - Click the **Toshy Status Indicator** icon in the System Tray.
     - Select the **Re/Start Toshy Services** menu item.

   - **Alternatively**, run the following command in the Terminal:

        ```sh
        sudo systemctl restart toshy-config.service toshy-session-monitor.service toshy-kde-dbus.service
        ```

### Modifier and Click Combination

If <kbd>Modifier + Click</kbd> (i.e. <kbd>Cmd + Click</kbd>) isn't working reliably, try and update the timeout length:

1. In the Toshy config file, search for the `keymapper_api` slice.

2. Based on the default `timeouts` value:

    ```py
    timeouts(
        multipurpose        = 1,        # default: 1 sec
        suspend             = 1,        # default: 1 sec, try 0.1 sec for touchpads/trackpads
    )
    ```

    Update the `suspend` value to a lower value such as `0.1` for touchpads/trackpads or `0`:

    ```py
    suspend             = 0.1,        # default: 1 sec, try 0.1 sec for touchpads/trackpads
    ```

### Emoji Picker

If your keyboard has a dedicated F-Key (i.e. <kbd>F7</kbd>) that launches your system's emoji picker (i.e. **KDE Emoji Selector**) in stock mode (without Toshy running) and it's not working while using Toshy, add the following configuration:

1. Stop all Toshy services graphically or through the terminal, if they are running.

2. Run the `evtest` utility to identify what key is mapped to the particular F-Key:

    ```sh
    evtest
    ```

3. When prompted with a list of available devices, identify the particular keyboard device you are using:

    ```sh
    /dev/input/event3:      Logitech USB Receiver
    ```

    In the above example, the device name is `Logitech USB Receiver` and the device event number is `3`.

    Enter the device event number:

    ```sh
    3
    ```

4. When `evtest` is ready for testing, monitor the output and press only the F-Key that normally launches the emoji picker (i.e. <kbd>F7</kbd>) **ONCE**.

5. Take note of the key (combination) being sent from that one specific press.

    Example `evtest` output:

    ```sh
    Event: time 1723174507.132175, type 4 (EV_MSC), code 4 (MSC_SCAN), value 700e3
    Event: time 1723174507.132175, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), value 1
    Event: time 1723174507.132175, -------------- SYN_REPORT ------------
    Event: time 1723174507.139168, type 4 (EV_MSC), code 4 (MSC_SCAN), value 70037
    Event: time 1723174507.139168, type 1 (EV_KEY), code 52 (KEY_DOT), value 1
    Event: time 1723174507.139168, -------------- SYN_REPORT ------------
    Event: time 1723174507.237171, type 4 (EV_MSC), code 4 (MSC_SCAN), value 70037
    Event: time 1723174507.237171, type 1 (EV_KEY), code 52 (KEY_DOT), value 0
    Event: time 1723174507.237171, -------------- SYN_REPORT ------------
    Event: time 1723174507.244169, type 4 (EV_MSC), code 4 (MSC_SCAN), value 700e3
    Event: time 1723174507.244169, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), value 0
    Event: time 1723174507.244169, -------------- SYN_REPORT ------------
    ```

    In this sample, the key combination responsible for launching the emoji picker is <kbd>Super + .</kbd>.

6. Restart all Toshy services graphically or through the terminal and run the `evtest` utility again.

7. When prompted with a list of available devices, locate the virtual keyboard device Toshy uses:

    ```sh
    /dev/input/event20:     XWayKeyz (virtual) Keyboard
    ```

    In the above example, the device name is `XWayKeyz (virtual) Keyboard` and the device event number is `20`.

    Enter the device event number:

    ```sh
    20
    ```

8. When `evtest` is ready for testing, monitor the output and press only the same F-Key we had tested earlier **ONCE**.

9. Take note of the key (combination) being sent from that one specific press.

    Example `evtest` output:

    ```sh
    Event: time 1723174975.203438, type 1 (EV_KEY), code 56 (KEY_LEFTALT), value 1
    Event: time 1723174975.203438, -------------- SYN_REPORT ------------
    Event: time 1723174975.203451, type 1 (EV_KEY), code 52 (KEY_DOT), value 1
    Event: time 1723174975.203451, -------------- SYN_REPORT ------------
    ^[.Event: time 1723174975.285092, type 1 (EV_KEY), code 52 (KEY_DOT), value 0
    Event: time 1723174975.285092, -------------- SYN_REPORT ------------
    Event: time 1723174975.292853, type 1 (EV_KEY), code 56 (KEY_LEFTALT), value 0
    Event: time 1723174975.292853, -------------- SYN_REPORT ------------
    ```

    In this sample, the key combination being sent by the F-Key while Toshy is running is <kbd>Alt + .</kbd>.

10. With the information gathered, we are now ready to update our Toshy config to help regain the F-Key's functionality.

    In the Toshy config file, search for the `user_apps` slice.

11. Within the start and end of the `user_apps` slice, add the following:

    ```py
    if DESKTOP_ENV == 'kde':
        keymap("User overrides: Emoji Picker", {
            C("Alt-dot"):               C("Super-dot"),                 # Open emoji picker in Plasma
        }, when = matchProps(not_clas=remoteStr, devn="^Logitech USB Receiver$")
        )
    ```

    In this example, these values are assumed:

    - Desktop environment: `kde`

        > [!TIP]  
        > The `if` condition can be removed if you wish for the configuration to apply to all desktop environments.

    - Key (combination) being sent by the F-Key in Toshy mode: `Alt-dot` (<kbd>Alt + .</kbd>)

    - Key (combination) being sent by the F-Key in stock mode: `Super-dot` (<kbd>Super + .</kbd>)

    - Keyboard device name: `Logitech USB Receiver`

        > [!TIP]  
        > The `devn` argument can be removed if you wish for the configuration to apply to all keyboard devices.

        > [!TIP]  
        > If you would like this configuration to apply to multiple specific device names, update the `devn` argument like so: `devn="^One Device Name$|^Alternate Device Name$"`.

    Update these values according to your actual setup.

### KDE Spectacle

> [!IMPORTANT]  
> This part of the section assumes that you are using the KDE Plasma desktop environment or the Spectacle screenshot utility.

To mimic a more macOS-like experience using the Spectacle screenshot utility, add the following configuration:

1. In the Toshy config file, search for the `user_apps` slice.

2. Within the start and end of the `user_apps` slice, add the following:

    ```py
    if DESKTOP_ENV == 'kde':
        keymap("User overrides: KDE Spectacle", {
            C("RC-Shift-Key_3"):        C("Shift-Print"),               # Take a screenshot immediately (kde)
            C("RC-Shift-Key_4"):        C("Super-Shift-Print"),         # Take a screenshot interactively (kde)
            C("RC-Shift-Key_5"):        C("Super-Print"),               # Take a screenshot of a window (kde)
        }, when = lambda ctx:
            cnfg.screen_has_focus and
            matchProps(not_clas=remoteStr)(ctx)
        )
    ```

    In this example, these values are assumed:

    - Desktop environment: `kde`

        > [!TIP]  
        > The `if` condition can be removed if you wish for the configuration to apply to all desktop environments.

    - Key (combination) to take a screenshot immediately: `RC-Shift-Key_3` (<kbd>Shift + Cmd + 3</kbd>)

    - Key (combination) to take a screenshot interactively: `RC-Shift-Key_4` (<kbd>Shift + Cmd + 4</kbd>)

    - Key (combination) to take a screenshot of a window: `RC-Shift-Key_5` (<kbd>Shift + Cmd + 5</kbd>)

    Update these values accordingly.

---

## Additional Workarounds

### Description

This details some additional workarounds needed to fix certain unwanted side effects of using Toshy.

### References

- [VSCode(s) and Firefox menu stealing focus when hitting Option/Alt](https://github.com/RedBearAK/toshy/wiki/FAQ-(Frequently-Asked-Questions)#vscodes-and-firefox-menu-stealing-focus-when-hitting-optionalt)

### Firefox Menu Stealing Focus

By default, hitting the <kbd>Alt</kbd> or <kbd>Opt</kbd> key will cause Firefox to steal focus. This can be fixed with a simple configuration on Firefox:

1. Launch the **Firefox** application.

2. In the **Address bar**, type `about:config` and hit the <kbd>Enter</kbd> key.

3. When prompted by the **Proceed with Caution** warning, click the **Accept the Risk and Continue** button.

4. In the provided **Search bar**, search for the setting, `ui.key.menuAccessKeyFocuses`.

5. In the **ui.key.menuAccessKeyFocuses** entry, double click its default value, `true` to update it to `false`.

6. Restart the application.
