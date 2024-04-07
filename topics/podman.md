# Podman

## Description

Podman (the POD MANager) is a tool for managing containers and images, volumes mounted into those containers, and pods made from groups of containers.

## Directory

- [Podman](#podman)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Linux](#linux)
    - [macOS](#macos)

## References

- [Podman](https://github.com/containers/podman)

---

## Installation

### Description

This details the installation and setup of Podman on Linux and macOS.

### References

- [Install Podman in a static manner](https://github.com/89luca89/distrobox/blob/main/docs/posts/install_podman_static.md)
- [Installing on Mac & Windows](https://podman.io/docs/installation#installing-on-mac--windows)

### Linux

> [!IMPORTANT]  
> Ensure the path to `~/.local/bin` is in your `${PATH}` environment variable.

1. Ensure you have `/etc/subuid` and `/etc/subgid`, if you don't, create the files:

    ```sh
    sudo touch /etc/subuid /etc/subgid
    ```

    and add a `subuid` and `subgid`:

    ```sh
    sudo usermod --add-subuid 100000-165535 --add-subgid 100000-165535 ${USER}
    ```

2. Write a bash script that helps fetch and install the latest `podman` release:

    ```sh
    nano ~/get-podman-launcher.sh
    ```

    Add the following content to the `get-podman-launcher.sh` script:

    ```sh
    if ! [ -x "$(command -v podman)" ]; then
        curl -Lo "${HOME}/podman-launcher-amd64" "https://github.com/89luca89/podman-launcher/releases/latest/download/podman-launcher-amd64"
        chmod +x "${HOME}/podman-launcher-amd64"
        mkdir -p "${HOME}/.local/bin"
        mv "${HOME}/podman-launcher-amd64" "${HOME}/.local/bin/podman"
    else
        echo "podman is already installed"
    fi
    ```

3. Install `podman` by running the script:

    ```sh
    bash ~/get-podman-launcher.sh
    ```

### macOS

> [!IMPORTANT]  
> A small portion of this guide assumes you are using the Fish shell. If you are using a different shell, adjust the commands accordingly.

1. Install `podman` using Homebrew:

    ```sh
    brew install podman
    ```

2. To then use Podman, since `podman` only runs on Linux, you will need to create and start a Podman machine (VM).

    Create a Podman machine (do this only once):

    ```sh
    podman machine init
    ```

    Start the Podman machine:

    ```sh
    podman machine start
    ```

3. To automatically start the Podman machine each time you launch a shell session, add the following to your shell profile (i.e. `~/.config/fish/config.fish`):

    ```fish
    # start podman machine if not running
    if status is-interactive
        # check if podman is installed
        if command -v podman >/dev/null
            # check if podman machine is running
            set machine_info (podman machine info)
            if ! string match -q "*machinestate: Running*" $machine_info
                # start podman machine quietly
                podman machine start >/dev/null 2>&1
            end
        end
    end
    ```

    Reload the shell profile (i.e. `~/.config/fish/config.fish`) to apply the changes:

    ```sh
    source ~/.config/fish/config.fish
    ```

    This will start the default Podman machine if it is not already running.
