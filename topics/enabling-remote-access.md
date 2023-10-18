# Enabling Remote Access

## Description

This details how we can enable remote access into our system from other devices in the same network.

## Directory

- [Enabling Remote Access](#enabling-remote-access)
  - [Description](#description)
  - [Directory](#directory)
  - [Graphical Steps](#graphical-steps)

---

## Graphical Steps

> [!IMPORTANT]  
> This guide assumes that you are using KDE Plasma as your desktop environment.

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

3. Enable SSH access on our system:

    ```sh
    sudo systemctl enable --now sshd.service
    ```

4. Try accessing our system from another device (assuming our user is `deck` and its static IPv4 address is `192.168.0.25`):

    ```sh
    ssh deck@192.168.0.25
    ```

5. If the SSH connection was established successfully, we can also copy the other device's SSH public key to our system in order to enable passwordless access.

    Do so from the other device:

    ```sh
    ssh-copy-id deck@192.168.0.25
    ```
