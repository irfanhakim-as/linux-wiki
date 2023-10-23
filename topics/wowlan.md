# Wake on Wireless

## Description

Wake on Wireless (WoWLAN) is a feature to switch on a computer via the network wirelessly.

## Directory

- [Wake on Wireless](#wake-on-wireless)
  - [Description](#description)
  - [Directory](#directory)
  - [Enable Wake on Wireless](#enable-wake-on-wireless)
    - [Description](#description-1)
    - [References](#references)
    - [Steps](#steps)
  - [Trigger a Wake on Wireless](#trigger-a-wake-on-wireless)
    - [Description](#description-2)
    - [Steps](#steps-1)

---

## Enable Wake on Wireless

### Description

This details how to enable WoWLAN on our system.

### References

- [How to enable WoW/WoWLAN](https://unix.stackexchange.com/a/553449)
- [Wowlan (Wake on Wireless Lan) trouble Intel 7260 Wireless Card](https://bbs.archlinux.org/viewtopic.php?id=215563)
- [Wake-on-LAN](https://wiki.archlinux.org/title/Wake-on-LAN)

### Steps

1. Check if WoWLAN is supported on your wireless interface using `iw`:

    ```sh
    iw list
    ```

    Sample entry showing that WoWLAN is supported:

    ```
            WoWLAN support:
                    * wake up on disconnect
                    * wake up on magic packet
                    * wake up on pattern match, up to 1 patterns of 1-128 bytes,
                    maximum packet offset 0 bytes
                    * can do GTK rekeying
                    * wake up on network detection, up to 10 match sets
    ```

    Do also note the first line of the output of `iw list`:

    ```
    Wiphy phy0
    ```

    The `phy0` in the output of `iw list` indicates the name of the wireless interface.

2. Check the status of WoWLAN on said interface (i.e. `phy0`):

    ```sh
    iw phy0 wowlan show
    ```

    Sample output:

    ```
    WoWLAN is disabled.
    ```

3. If WoWLAN is not enabled, enable **wake up on magic packet** on said interface (i.e. `phy0`):

    ```sh
    sudo iw phy0 wowlan enable magic-packet
    ```

    Check the status of WoWLAN again:

    ```sh
    iw phy0 wowlan show
    ```

    Sample output after WoWLAN enablement:

    ```
    WoWLAN is enabled:
     * wake up on magic packet
    ```

    To make it persistent, create a `wowlan@` `systemd` service:

    ```sh
    sudo nano /etc/systemd/system/wowlan@.service
    ```

    Content of the `wowlan@.service` file:

    ```
    [Unit]
    Description=Enable WoWLAN for %i
    Requires=network.target
    After=network.target

    [Service]
    ExecStart=/usr/sbin/iw %i wowlan enable magic-packet
    Type=oneshot

    [Install]
    WantedBy=multi-user.target
    ```

    Then, start and enable the `wowlan@` service for the wireless interface (i.e. `phy0`):

    ```sh
    sudo systemctl enable --now wowlan@phy0.service
    ```

4. You can use `iw` to get the MAC address of your wireless interface:

    ```sh
    iw dev
    ```

    Sample output:

    ```
    phy#0
            Interface wlp4s0
                    ifindex 3
                    wdev 0x1
                    addr 80:eg:f9:5f:06:28
                    type managed
                    channel 48 (5240 MHz), width: 80 MHz, center1: 5210 MHz
                    txpower 3.00 dBm
                    multicast TXQ:
                            qsz-byt qsz-pkt flows   drops   marks   overlmt hashcol tx-bytes        tx-packets
                            0       0       0       0       0       0       0       0               0
    ```

    From this example, the interface, `phy0`'s, name is `wlp4s0`, and the MAC address is `80:eg:f9:5f:06:28`.

---

## Trigger a Wake on Wireless

### Description

This details how to trigger WoWLAN on a system from another system.

> [!IMPORTANT]  
> This only works if the target system is connected to the same network wirelessly, and the target system's power is on (i.e. sleeping, not shutdown).

### Steps

1. Install the `wakeonlan` package from the `AUR` using `yay`:

    ```sh
    yay -S wakeonlan
    ```

    It is also available on `homebrew` for macOS:

    ```sh
    brew install wakeonlan
    ```

2. Run the `wakeonlan` command with the MAC address of the target system that you wish to wake (i.e. `80:eg:f9:5f:06:28`):

    ```sh
    wakeonlan 80:eg:f9:5f:06:28
    ```
