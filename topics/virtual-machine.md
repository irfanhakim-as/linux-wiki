# Virtual Machine (VM)

## Description

This is a brief description of the topic.

## Directory

- [Virtual Machine (VM)](#virtual-machine-vm)
  - [Description](#description)
  - [Directory](#directory)
  - [VM Software Setup](#vm-software-setup)
    - [Description](#description-1)
    - [References](#references)
    - [Steps](#steps)
    - [Troubleshooting](#troubleshooting)
  - [Optimising Windows VM](#optimising-windows-vm)
    - [Description](#description-2)
    - [References](#references-1)
    - [Steps](#steps-1)

---

## VM Software Setup

### Description

This details how to setup Virt-manager, a software that allows creating and managing VMs.

### References

- [Virt-Manager](https://wiki.archlinux.org/title/Virt-Manager)
- [Creating Virtual Machines in QEMU | Virt-manager | KVM](https://youtu.be/jLRmVNWOrgo)

### Steps

1. Install `virt-manager` and its dependencies:

    ```sh
    yay -S virt-manager
    yay -S qemu-desktop libvirt edk2-ovmf dnsmasq iptables-nft
    ```

2. Start and enable the `libvirtd` service:

    ```sh
    sudo systemctl enable --now libvirtd.service
    ```

3. To not need `sudo` to run the software, add our user to the `libvirt` group:

    ```sh
    sudo usermod -aG libvirt ${USER}
    ```

4. Edit our `qemu.conf` config:

    ```sh
    sudo nano /etc/libvirt/qemu.conf
    ```

    Uncomment these lines and replace the values with your username:

    ```conf
    # user = "libvirt-qemu"
    # group = "libvirt-qemu"
    ```

    Sample value assuming our username is `myuser`:

    ```conf
    user = "myuser"
    group = "myuser"
    ```

### Troubleshooting

- If Virt-Manager QEMU/KVM is stuck at connecting, restart the `libvirtd` service:

    ```sh
    sudo systemctl restart libvirtd.service
    ```

- To find the cause of the issue, check the status of the `libvirtd` service:

    ```sh
    sudo systemctl status libvirtd.service
    ```

    More often than not, it's likely a configuration issue with a VM. Fixing the configuration should fix the issue.

---

## Optimising Windows VM

### Description

This details some steps that can be done on a Windows VM through VirtManager in order to make the experience a little better.

### References

- [Windows Inside of Linux](https://youtu.be/6KqqNsnkDlQ)

### Steps

1. Install Windows VM on an actual disk would make it a lot faster:

   - While creating a new VM on VirtManager, In Step 4 of 5, choose **Select or create custom storage**.

   - In that field, put in the location of the destination disk (check using `sudo blkid`).

   - Proceed with installation.

2. Once Windows has been installed, install [VirtIO](https://pve.proxmox.com/wiki/Windows_VirtIO_Drivers#Using_the_ISO) drivers from Proxmox:

   - Download the latest stable ISO on your Host machine from this link (https://pve.proxmox.com/wiki/Windows_VirtIO_Drivers#Using_the_ISO).

   - Mount the ISO to the Windows VM.

   - Boot the Windows VM.

   - Open the mounted ISO and run the 64-bit installer.

   - Once the drivers have installed, shut down the VM.

3. Add a channel for "better" communication between your Host machine to the VM:

   - In the info tab of the VM, click **Add Hardware**.

   - Click **Channel**, and pick `qemu.guest_agent` from the **Name** dropdown.

   - Click **Finish**.

4. **(Optional)** Set Video model to `VirtIO` (in some cases, the default `QXL` model might be better):

   - In the info tab of the VM, locate **Video QXL**.

   - In the **Video QXL** section, change the **Model** to `Virtio`.

   - Click **Apply**.

5. Set CPU cores to a minimum of 4, and ensure that the Windows VM sees all 4 cores:

   - In the **Details** tab of the VM, get to the **CPUs** section.

   - Under **Topology**, select the **Manually set CPU topology** option.

   - Fill in the following values:
     - Sockets: 1
     - Cores: 4
     - Threads: 1

   - Click **Apply**.
