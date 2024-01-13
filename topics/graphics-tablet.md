# Graphics Tablet

## Description

A graphics tablet (also known as a digitiser, digital graphic tablet, pen tablet, drawing tablet, external drawing pad or digital art board) is a computer input device that enables a user to hand-draw images, animations and graphics, with a special pen-like stylus, similar to the way a person draws images with a pencil and paper.

## Directory

- [Graphics Tablet](#graphics-tablet)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [XP-Pen](#xp-pen)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [Graphics tablet](https://wiki.archlinux.org/title/Graphics_tablet)

---

## XP-Pen

### Description

This briefs how to set up an XP-Pen drawing tablet on Linux and addresses an issue with using it on a multi-monitor setup.

> [!IMPORTANT]  
> This guide is intended for Arch Linux based distributions.

> [!NOTE]  
> This guide was written based on tests done using an XP-Pen Star G640 drawing tablet on an Arch Linux based desktop on X11.

### References

- [xp-pen-tablet](https://aur.archlinux.org/packages/xp-pen-tablet)
- [XPPen SUPPORT](https://www.xp-pen.com/download)

### Steps

The XP-Pen drawing tablet works out of the box on Linux. However, the tablet's active area is mapped to the entire combination of screens, which is not ideal for multi-monitor setups. The following steps address this issue:

1. Install the `xp-pen-tablet` package from the AUR using `yay`.

    ```sh
    yay -S xp-pen-tablet
    ```

    > [!TIP]  
    > An alternative to the `xp-pen-tablet` driver is the `opentabletdriver` driver which is also available on the AUR. However, said driver has not been tested and might work differently.

2. Reboot the system.

3. The `xppentablet` utility should now run in the background by default upon boot. Open the application window.

4. From the left pane, select the **Work area** tab.

5. In the **Work area** view, select the **Screen** option.

6. From the **Screen** drop-down menu (which should be set to **All monitor** by default), select the monitor you want to use the tablet on.

7. Click the **Save** button and close the application window by clicking the **X** button.
