# Razer

## Description

Razer Inc., is an American-Singaporean multinational technology company that designs, develops, and sells consumer electronics, financial services, and gaming hardware.

## Directory

- [Razer](#razer)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Peripheral Support](#peripheral-support)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [Razer](https://www.razer.com)

---

## Peripheral Support

### Description

This details on how to setup and configure Razer Peripherals.

### References

- [Razer peripherals](https://wiki.archlinux.org/title/Razer_peripherals)
- [Polychromatic](https://polychromatic.app)

### Steps

1. Install the open-source driver, `openrazer-meta`, using `yay`:

2. Add the current user to the `plugdev` group:

    ```sh
    sudo gpasswd -a ${USER} plugdev
    ```

3. Restart the system or log out and log back into the desktop.

4. Install the graphical app, `polychromatic`, for using openrazer:

    ```sh
    yay -S polychromatic
    ```

5. Setup and configure the mouse:

   - Launch the **polychromatic** app.

   - Select your device in the **Devices** list.

   - Select the highest polling rate under the **Poll Rate** dropdown.

   - Under **DPI**, click the **Edit** button.

   - Change the DPI stages accordingly (i.e. `400`, `500`, `750`, etc.).

   - Click **Sync**.

   - Click **Save**.

   - Click the desired DPI.

   - Click **Close Application**.
