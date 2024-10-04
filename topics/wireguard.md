# WireGuard

## Description

WireGuard is an extremely simple yet fast and modern VPN that utilises state-of-the-art cryptography.

## Directory

- [WireGuard](#wireguard)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Connecting to WireGuard](#connecting-to-wireguard)
    - [Description](#description-1)
    - [References](#references-1)
    - [Linux](#linux)
    - [macOS](#macos)
    - [iOS](#ios)

## References

- [WireGuard](https://www.wireguard.com)

---

## Connecting to WireGuard

> [!IMPORTANT]  
> You will need to have created and exported a WireGuard configuration file for the device you are setting up.

### Description

This guide details how to connect to an existing WireGuard VPN on various platforms.

### References

- [Long KFluff – Connecting to WireGuard VPN from Plasma NetworkManager (plasma-nm)](https://rabbitictranslator.com/wireguard-plasmanm/#plasma-gui)
- [Making WireGuard from Homebrew Work on an M1 Mac](https://blog.scottlowe.org/2021/06/22/making-wireguard-from-homebrew-work-on-an-m1-mac)
- [WireGuard not working on MacOS 13 Ventura?](https://redlib.pussthecat.org/r/WireGuard/comments/10a55y8/wireguard_not_working_on_macos_13_ventura)

### Linux

> [!NOTE]  
> Parts of this guide assumes that you are using the KDE Plasma desktop environment.

1. Launch the KDE Plasma **Settings** application.

2. Locate the **Network** section and click on the **Connections** menu item.

3. Click the **+** (Add new connection) button.

4. Choose the **Import VPN Connection...** connection type and click the **Create** button.

5. In the newly opened **Import VPN Connection** file manager window, select your WireGuard client configuration (`.conf`) file, and click the **Open** button.

    >[!TIP]  
    > If you receive an error stating, `Failed to import VPN connection: The file to import wasn’t a valid OpenVPN client configuration`, try and rename the file differently i.e. `myvpndomain.com.conf` and retry importing it.

6. If the client configuration has been imported successfully, you can now connect to it by right clicking the **WireGuard VPN** connection from the **Connections** list and click the **Connect** context menu option.

### macOS

> [!NOTE]  
> The steps to connect to an existing WireGuard VPN on macOS should be similar to [iOS](#ios), but due to a longstanding issue the macOS version of the WireGuard app suffers from, we recommend the folowing steps instead.

1. Install the `wireguard-tools` and `wireguard-go` packages using [Homebrew](https://brew.sh):

    ```sh
    brew install -v wireguard-tools wireguard-go
    ```

2. Export the intended WireGuard client configuration file to the device from your WireGuard VPN server.

3. Copy over the WireGuard client configuration file to where WireGuard expects it:

   - If you are doing this on an Apple Silicon Mac (i.e. M1 and newer):

        ```sh
        cp <wireguard-config> /opt/homebrew/etc/wireguard/<profile>.conf
        ```

        **Alternatively**, If you are doing this on an Intel Mac:

        ```sh
        cp <wireguard-config> /usr/local/etc/wireguard/<profile>.conf
        ```

   - Replace `<wireguard-config>` with the actual path to your WireGuard client configuration (`.conf`) file (i.e. `~/Downloads/myvpndomain.conf`).

   - Replace `<profile>` with a short and descriptive name for your WireGuard VPN connection (i.e. `profile-01`).

   - For example:

        ```sh
        cp ~/Downloads/myvpndomain.conf /opt/homebrew/etc/wireguard/profile-01.conf
        ```

4. To connect to the WireGuard VPN connection, run the following command:

    ```sh
    wg-quick up <profile>
    ```

    For example, if `<profile>` was set to `profile-01`:

    ```sh
    wg-quick up profile-01
    ```

5. Ending the VPN connection is similar but using the `down` command instead:

    ```sh
    wg-quick down <profile>
    ```

    For example, if `<profile>` was set to `profile-01`:

    ```sh
    wg-quick down profile-01
    ```

6. When prompted to enter your password, enter your user password accordingly.

7. **(Optional)** For an easier way of managing multiple WireGuard connections, check out the [**wg-quicker**](https://github.com/irfanhakim-as/wg-quicker) project.

### iOS

1. Launch the **App Store** application.

2. Search for the [**WireGuard**](https://apps.apple.com/us/app/wireguard/id1441195209) app and install it to your device.

3. Launch the **WireGuard** app.

4. Press the **+** button in the top right corner.

5. In the **Add a new WireGuard tunnel** menu, select the **Create from file or archive** option.

6. When prompted with the file manager app, locate and select your WireGuard client configuration (`.conf`) file.

7. Once the client configuration file has been imported, you may connect to it right from the **WireGuard** app by toggling the switch corresponding to the client connection you have set up.
