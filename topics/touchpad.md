# Touchpad

## Description

This details how we could configure and setup a touchpad for use on desktop Linux.

> [!IMPORTANT]  
> This guide focuses on a specific system comprised of an Arch Linux based PC using KDE Plasma on X11, and the Apple Magic Trackpad 2.

## Directory

- [Touchpad](#touchpad)
  - [Description](#description)
  - [Directory](#directory)
  - [Touchpad Configuration](#touchpad-configuration)
    - [Description](#description-1)
    - [Steps](#steps)
  - [macOS-like Gestures](#macos-like-gestures)
    - [Description](#description-2)
    - [References](#references)
    - [Steps](#steps-1)
  - [Smooth Scrolling in Mozilla Applications](#smooth-scrolling-in-mozilla-applications)
    - [Description](#description-3)
    - [References](#references-1)
    - [Steps](#steps-2)

---

## Touchpad Configuration

### Description

This details optional configurations for the trackpad.

### Steps

1. Launch the **System Settings** application.

2. Under **Hardware**, expand the **Input Devices** section.

3. Select the **Touchpad** menu item.

4. Configure the touchpad like so (make changes to your liking):

   - Device enabled: `Enabled`
   - Pointer acceleration: `0.10`
   - Acceleration profile: `Adaptive`
   - Tapping: `Tap-to-click` and `Tap-and-drag`
   - Two-finger tap: `Right-click`
   - Scrolling: `Two fingers` and `Invert scroll direction (Natural scrolling)`
   - Right click: `Press anywhere with two fingers`

5. Click **Apply**.

---

## macOS-like Gestures

### Description

This details how we could configure our trackpad to behave more like it would on macOS, on X11.

### References

- [Touchégg](https://github.com/JoseExposito/touchegg)
- [Touché](https://github.com/JoseExposito/touche)
- [ToucheggKDE](https://github.com/NayamAmarshe/ToucheggKDE)

### Steps

1. Install the `touchegg` package using `yay`:

    ```sh
    yay -S touchegg
    ```

2. Start and enable the `touchegg` service:

    ```sh
    sudo systemctl enable --now touchegg.service
    ```

3. Restart the system or run the `touchegg` command manually i.e. through **KRunner** for the first time.

4. Edit the Touchégg configuration file:

    ```sh
    nano ~/.config/touchegg/touchegg.conf
    ```

    Content of the configuration file:

    ```conf
    <touchégg>
      <settings>
        <property name="animation_delay">150</property>
        <property name="action_execute_threshold">10</property>
        <property name="color">auto</property>
        <property name="borderColor">auto</property>
      </settings>
      <application name="All">
        <gesture type="SWIPE" fingers="3" direction="UP">
          <action type="RUN_COMMAND">
            <repeat>false</repeat>
            <command>qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'Overview'</command>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="3" direction="DOWN">
          <action type="RUN_COMMAND">
            <repeat>false</repeat>
            <command>qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'ExposeClass'</command>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="3" direction="RIGHT">
          <action type="CHANGE_DESKTOP">
            <direction>previous</direction>
            <animate>true</animate>
            <animationPosition>left</animationPosition>
            <color>000000</color>
            <borderColor>000000</borderColor>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="3" direction="LEFT">
          <action type="CHANGE_DESKTOP">
            <direction>next</direction>
            <animate>true</animate>
            <animationPosition>right</animationPosition>
            <color>000000</color>
            <borderColor>000000</borderColor>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="3" direction="IN">
          <action type="RUN_COMMAND">
            <repeat>false</repeat>
            <command>qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'ShowDesktopGrid'</command>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="3" direction="OUT">
          <action type="RUN_COMMAND">
            <repeat>false</repeat>
            <command>qdbus org.kde.kglobalaccel /component/kwin invokeShortcut 'ShowDesktopGrid'</command>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="4" direction="UP">
          <action type="RUN_COMMAND">
            <repeat>true</repeat>
            <command>qdbus org.kde.kglobalaccel /component/kmix invokeShortcut 'increase_volume'</command>
            <decreaseCommand>qdbus org.kde.kglobalaccel /component/kmix invokeShortcut 'decrease_volume'</decreaseCommand>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="4" direction="DOWN">
          <action type="RUN_COMMAND">
            <repeat>true</repeat>
            <command>qdbus org.kde.kglobalaccel /component/kmix invokeShortcut 'decrease_volume'</command>
            <decreaseCommand>qdbus org.kde.kglobalaccel /component/kmix invokeShortcut 'increase_volume'</decreaseCommand>
            <on>begin</on>
          </action>
        </gesture>
      </application>
      <application name="brave-browser">
        <gesture type="PINCH" fingers="2" direction="IN">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>KP_Subtract</keys>
            <decreaseKeys>KP_Add</decreaseKeys>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="2" direction="OUT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>KP_Add</keys>
            <decreaseKeys>KP_Subtract</decreaseKeys>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="4" direction="RIGHT">
          <action type="SEND_KEYS">
            <repeat>false</repeat>
            <modifiers>Alt_L</modifiers>
            <keys>KP_Left</keys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="4" direction="LEFT">
          <action type="SEND_KEYS">
            <repeat>false</repeat>
            <modifiers>Alt_L</modifiers>
            <keys>KP_Right</keys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="4" direction="IN">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>Shift_L+Tab</keys>
            <decreaseKeys>Shift_L+Tab</decreaseKeys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="4" direction="OUT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>Tab</keys>
            <decreaseKeys>Shift_L+Tab</decreaseKeys>
            <on>begin</on>
          </action>
        </gesture>
      </application>
      <application name="chromium">
        <gesture type="PINCH" fingers="2" direction="IN">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>KP_Subtract</keys>
            <decreaseKeys>KP_Add</decreaseKeys>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="2" direction="OUT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>KP_Add</keys>
            <decreaseKeys>KP_Subtract</decreaseKeys>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="4" direction="RIGHT">
          <action type="SEND_KEYS">
            <repeat>false</repeat>
            <modifiers>Alt_L</modifiers>
            <keys>KP_Left</keys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="4" direction="LEFT">
          <action type="SEND_KEYS">
            <repeat>false</repeat>
            <modifiers>Alt_L</modifiers>
            <keys>KP_Right</keys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="4" direction="IN">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>Shift_L+Tab</keys>
            <decreaseKeys>Shift_L+Tab</decreaseKeys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="4" direction="OUT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>Tab</keys>
            <decreaseKeys>Shift_L+Tab</decreaseKeys>
            <on>begin</on>
          </action>
        </gesture>
      </application>
      <application name="firefox">
        <gesture type="PINCH" fingers="2" direction="IN">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>KP_Subtract</keys>
            <decreaseKeys>KP_Add</decreaseKeys>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="2" direction="OUT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>KP_Add</keys>
            <decreaseKeys>KP_Subtract</decreaseKeys>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="4" direction="RIGHT">
          <action type="SEND_KEYS">
            <repeat>false</repeat>
            <modifiers>Alt_L</modifiers>
            <keys>KP_Left</keys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="4" direction="LEFT">
          <action type="SEND_KEYS">
            <repeat>false</repeat>
            <modifiers>Alt_L</modifiers>
            <keys>KP_Right</keys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="4" direction="IN">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>Shift_L+Tab</keys>
            <decreaseKeys>Shift_L+Tab</decreaseKeys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="4" direction="OUT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>Tab</keys>
            <decreaseKeys>Shift_L+Tab</decreaseKeys>
            <on>begin</on>
          </action>
        </gesture>
      </application>
      <application name="google-chrome">
        <gesture type="PINCH" fingers="2" direction="IN">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>KP_Subtract</keys>
            <decreaseKeys>KP_Add</decreaseKeys>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="2" direction="OUT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>KP_Add</keys>
            <decreaseKeys>KP_Subtract</decreaseKeys>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="4" direction="RIGHT">
          <action type="SEND_KEYS">
            <repeat>false</repeat>
            <modifiers>Alt_L</modifiers>
            <keys>KP_Left</keys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="4" direction="LEFT">
          <action type="SEND_KEYS">
            <repeat>false</repeat>
            <modifiers>Alt_L</modifiers>
            <keys>KP_Right</keys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="4" direction="IN">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>Shift_L+Tab</keys>
            <decreaseKeys>Shift_L+Tab</decreaseKeys>
            <on>begin</on>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="4" direction="OUT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>Tab</keys>
            <decreaseKeys>Shift_L+Tab</decreaseKeys>
            <on>begin</on>
          </action>
        </gesture>
      </application>
      <application name="gwenview">
        <gesture type="PINCH" fingers="2" direction="IN">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>KP_Subtract</keys>
            <decreaseKeys>KP_Add</decreaseKeys>
          </action>
        </gesture>
        <gesture type="PINCH" fingers="2" direction="OUT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <modifiers>Control_L</modifiers>
            <keys>KP_Add</keys>
            <decreaseKeys>KP_Subtract</decreaseKeys>
          </action>
        </gesture>
      </application>
    </touchégg>
    ```

5. Install the Touché Flatpak from Flathub graphically through the [Discover](../topics/plasma-discover.md#software-installation-and-update) app or using the following command:

    ```sh
    flatpak install --user com.github.joseexposito.touche
    ```

6. To further configure the Touchégg gestures, you can do so graphically through the Touché app.

---

## Smooth Scrolling in Mozilla Applications

### Description

This details how to enable smooth scrolling in Mozilla applications including Firefox and Thunderbird on X11.

### References

- [Kinetic Scrolling on Linux?](https://community.frame.work/t/solved-kinetic-scrolling-on-linux/17564)
- [PSA for Firefox users: set MOZ_USE_XINPUT2=1 to enable macOS-like smooth scrolling](https://www.reddit.com/r/linux/comments/72mfv8/psa_for_firefox_users_set_moz_use_xinput21_to)

### Steps

> [!NOTE]  
> This is intended for the Mozilla Firefox and Mozilla Thunderbird Flatpak and the X11 graphics platform.

1. Launch the **Flatseal** application. [Install](./plasma-discover.md#software-installation-and-update) [Flatseal](https://flathub.org/apps/com.github.tchx84.Flatseal) if you haven't already.

2. From the **Applications** list, select **org.mozilla.firefox**.

3. In Firefox's details view, get to the **Environment** section.

4. Click the **+** button to add a new environment variable.

5. In the new provided text field, enter the following parameter and value:

    ```sh
    MOZ_USE_XINPUT2=1
    ```

6. Close the **Flatseal** application.

> [!TIP]  
> The **Use smooth scrolling** option in Firefox's **Preferences** > **General** > **Browsing** section should be enabled.

7. Close Firefox if it's running, and launch it again.

8. Repeat the same steps but for the Thunderbird (**org.mozilla.Thunderbird**) Flatpak. Its **Smooth scrolling** option is located under **Settings** > **General** > **Scrolling**.
