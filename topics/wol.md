# Wake on LAN

## Description

Wake-on-LAN (WoL) is a feature to switch on a computer via the network.

## Directory

- [Wake on LAN](#wake-on-lan)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Enable Wake on LAN](#enable-wake-on-lan)
    - [Description](#description-1)
    - [References](#references-1)
    - [Hardware Preparation](#hardware-preparation)
    - [Software](#software)
  - [Trigger a Wake on LAN](#trigger-a-wake-on-lan)
    - [Description](#description-2)
    - [Steps](#steps)

## References

- [Wake-on-LAN](https://wiki.archlinux.org/title/Wake-on-LAN)

---

## Enable Wake on LAN

### Description

This details how to enable WoL on our system.

### References

- [Turn on your Server from anywhere!](https://youtu.be/6QhA_mKHINc)
- [[Motherboard]How to set and enable WOL(Wake On Lan) function in BIOS](https://www.asus.com/support/FAQ/1045950)

### Hardware Preparation

1. Check if your motherboard supports WoL and how to enable it.

2. In general, head to the motherboard's BIOS and enable WoL:
   - Click the **Advanced** tab.

   - Select **APM Configuration**.

   - Under **Power On By PCIE**, select **Enabled**.

   - Press the <kbd>F10</kbd> key to save and exit the BIOS.

> [!NOTE]  
> In some cases, you may need to also disable **ERP** if it was enabled by default by the motherboard.

### Software

1. Get the name of your network interface and its MAC address:

    ```sh
    ip addr show
    ```

    This will return several results/interfaces on our system, including virtual ones. We are interested in the physical interface which connects us to the network.

    In most cases, it is the second interface returned. For example:

    ```
    2: enp7s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 80:eg:f9:5f:06:28 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.125/24 brd 192.168.0.255 scope global noprefixroute enp7s0
       valid_lft forever preferred_lft forever
    ```

    From this example, the interface name is `enp7s0`, and the MAC address is `80:eg:f9:5f:06:28`.

2. Use `ethtool` to check if WoL is supported/enabled:

    ```sh
    sudo ethtool enp7s0 | grep "Wake-on"
    ```

    Sample output:

    ```
            Supports Wake-on: pumbg
            Wake-on: g
    ```

    The `g` in the output of **Supports Wake-on** indicates that WoL is supported, and the `g` in the output of **Wake-on** indicates that WoL is enabled.

3. If WoL is not enabled, enable it on said interface (i.e. `enp7s0`):

    ```sh
    ethtool -s enp7s0 wol g
    ```

    To make it persistent, either create a `systemd.link` configuration or use `wol-systemd` on Arch Linux based systems.

    Create a `systemd.link` configuration file:

    ```sh
    sudo nano /etc/systemd/network/50-wired.link
    ```

    Content of the `50-wired.link` file:

    ```
    [Match]
    MACAddress=aa:bb:cc:dd:ee:ff

    [Link]
    NamePolicy=kernel database onboard slot path
    MACAddressPolicy=persistent
    WakeOnLan=magic
    ```

    > [!IMPORTANT]  
    > Replace `aa:bb:cc:dd:ee:ff` with the actual MAC address of your network interface (i.e. `80:eg:f9:5f:06:28`).

    Alternatively, install the `wol-systemd` package from the `AUR` using `yay`:

    ```sh
    yay -S wol-systemd
    ```

    Then, start and enable the `wol-systemd` service for the network interface (i.e. `enp7s0`):

    ```sh
    sudo systemctl enable --now wol@enp7s0.service
    ```

---

## Trigger a Wake on LAN

### Description

This details how to trigger WoL on a system from another system.

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

> [!IMPORTANT]  
> This only works if the target system is connected to the same network (via Ethernet) as the system you are triggering the WoL from.
