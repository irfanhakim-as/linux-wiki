# Distrobox

## Description

Use any Linux distribution inside your terminal. Enable both backward and forward compatibility with software and freedom to use whatever distribution you’re more comfortable with.

## Directory

- [Distrobox](#distrobox)
  - [Description](#description)
  - [Directory](#directory)
    - [References](#references)
  - [Software Installation](#software-installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

### References

- [Distrobox](https://github.com/89luca89/distrobox)

---

## Software Installation

### Description

This details how we can install certain applications or libraries not present in your system via Distrobox.

### References

- [Application and binary exporting](https://distrobox.it/usage/distrobox-export)

### Steps

> [!NOTE]  
> We recommend an Arch Linux based Distrobox container for maximum software availability, but any Distrobox container would do.

1. Create a home directory for our Distrobox container (i.e. `arch`):

    ```sh
    mkdir -p ~/distrobox/arch
    ```

2. Create an Arch Linux based Distrobox container:

    ```sh
    distrobox create --image archlinux --name arch --home ~/distrobox/arch
    ```

3. Enter our Distrobox container (i.e. `arch`):

    ```sh
    distrobox enter arch -nw
    ```

4. Install the application or library we desire. For example, we would like to install `unrar` using `yay` inside the container:

    ```sh
    yay -S unrar
    ```

5. Export the binary we had installed, `unrar` from the container so that we have access to it on our Bazzite desktop:

    ```sh
    distrobox-export --bin $(which unrar) --export-path /home/${USER}/.local/bin
    ```

    You can also change the `export-path` to where your preferred destination is, i.e. `/usr/local/bin`.

6. We could also do the same with a desktop application.

    For example, install `notable` using `yay` inside the container:

    ```sh
    yay -S notable
    ```

    Export the application, `notable`:

    ```sh
    distrobox-export --app notable
    ```

7. To remove an exported binary or application at some point in the future, simply use the same command we had used to export them with an additional flag `--delete` from the same container.

    For example:

    ```sh
    distrobox-export --bin $(which unrar) --export-path /home/${USER}/.local/bin --delete
    ```
