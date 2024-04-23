# Remote Access

## Description

This details how we can enable remote access into our system from other devices in the same network or externally.

## Directory

- [Remote Access](#remote-access)
  - [Description](#description)
  - [Directory](#directory)
  - [Remote Shell](#remote-shell)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Remote Desktop](#remote-desktop)
    - [Description](#description-2)
    - [Steps](#steps-1)

---

## Remote Shell

### Description

This details how we can enable remote access into our system from other devices in the same network via SSH.

> [!IMPORTANT]  
> This guide assumes that you are using KDE Plasma as your desktop environment.

### Steps

1. Set a static IPv4 address:

   - Click the Wi-Fi/Ethernet icon on our taskbar.

   - Click the **Settings** icon in the **Networks** panel that says **Configure Network Connections...**.

   - Select the Wi-Fi or Wired Ethernet connection we're using if it's not been selected already.

   - Click the **IPv4** tab.

   - Click the **Method** dropdown and select **Manual**.

   - In the **DNS Servers** box, add in our DNS servers of choice (i.e. `1.1.1.1,8.8.8.8`).

   - Next to the provided table below, click the **Add** button.

   - In the **Address** field, add our desired static IPv4 address (i.e. `192.168.0.25`).

   - In the **Netmask** field, add our home network's Netmask (i.e. `255.255.255.0`).

   - In the **Gateway** field, add our home network's Gateway (i.e. `192.168.0.1`).

   - At the bottom right, click the **Apply** button.

   - Restart our computer and boot back into our desktop.

2. Verify that we're now using the new static IPv4 address (assuming it was set to `192.168.0.25`):

    ```sh
    ip addr | grep 192.168.0.25
    ```

    Sample result which indicates that we're successfully using the new static IPv4 address:

    ```sh
    inet 192.168.0.25/24 brd 192.168.0.255 scope global noprefixroute wlp4s0
    ```

3. Ensure that the `openssh` package is installed. If not, install it using `yay`:

    ```sh
    yay -S openssh
    ```

4. Enable SSH access on our system:

    ```sh
    sudo systemctl enable --now sshd.service
    ```

5. Try accessing our system from another device (assuming our user is `deck` and its static IPv4 address is `192.168.0.25`):

    ```sh
    ssh deck@192.168.0.25
    ```

6. If the SSH connection was established successfully, we can also copy the other device's SSH public key to our system in order to enable passwordless access.

    Do so from the other device:

    ```sh
    ssh-copy-id deck@192.168.0.25
    ```

---

## Remote Desktop

### Description

This details how we can enable remote desktop into our system from other devices via AnyDesk.

> [!WARNING]  
> This method only works for the `X11` graphics platform, and not compatible with `Wayland` as of writing.

### Steps

1. [Install](flatpak.md#install) the **AnyDesk** (`com.anydesk.Anydesk`) app as a Flatpak.

2. Once installed, click the **Launch** button in the top right.

3. In the **AnyDesk** app, open the **General** hamburger menu in the top right.

4. Click **Settings**.

5.  Go to the **Security** section.

6.  Check the **Enable unattended access** option.

7.  Click the **Set password...** button, add a secure password accordingly, and click **OK**.

8.  Close the **Settings** tab and take note of your system's AnyDesk address under **Your Address**. You can now remote into your system from other devices using the AnyDesk app using this address and the password you had set.

9.  Set the AnyDesk app to [autostart](../topics/autostart.md#add-application-to-autostart) each time you boot into the desktop.
