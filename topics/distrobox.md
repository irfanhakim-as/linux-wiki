# Distrobox

## Description

Use any Linux distribution inside your terminal. Enable both backward and forward compatibility with software and freedom to use whatever distribution you’re more comfortable with.

## Directory

- [Distrobox](#distrobox)
  - [Description](#description)
  - [Directory](#directory)
    - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Usage](#usage)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)
  - [Software Installation](#software-installation)
    - [Description](#description-3)
    - [References](#references-3)
    - [Steps](#steps-2)
  - [VS Code Integration](#vs-code-integration)
    - [Description](#description-4)
    - [References](#references-4)
    - [Steps](#steps-3)

### References

- [Distrobox](https://github.com/89luca89/distrobox)

---

## Installation

### Description

This details how we can install and setup Distrobox.

### References

- [Install Podman in a static manner](https://github.com/89luca89/distrobox/blob/main/docs/posts/install_podman_static.md)
- [Install Distrobox on the Steamdeck](https://github.com/89luca89/distrobox/blob/main/docs/posts/steamdeck_guide.md)

### Steps

> [!IMPORTANT]  
> Ensure the path to `~/.local/bin` is in your `${PATH}` environment variable.

1. Ensure you have `/etc/subuid` and `/etc/subgid`, if you don't, create the files:

    ```sh
    sudo touch /etc/subuid /etc/subgid
    ```

    and add a `subuid` and `subgid`:

    ```sh
    sudo usermod --add-subuid 100000-165535 --add-subgid 100000-165535 $USER
    ```

2. Download and install the latest `podman` release as our container runtime of choice by creating the following script:

    ```sh
    nano ~/get-podman-launcher.sh
    ```

    Content of the `get-podman-launcher.sh` script:

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

    Run the script to install `podman`:

    ```sh
    bash ~/get-podman-launcher.sh
    ```

3. Install `distrobox`:

    ```sh
    curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/install | sh -s -- --prefix ~/.local
    ```

4. Make sure `$HOME/.local/podman/bin` is in your `$PATH`, and also `~/.distroboxrc`.

5. In order to have graphical applications working, set `~/.distroboxrc` up like so:

    ```
    xhost +si:localuser:$USER
    export PATH=$PATH:$HOME/.local/bin
    ```

    If setting this up on SteamOS (Steam Deck) an additional line is needed to force the use of `pulseaudio` in the container:

    ```
    xhost +si:localuser:$USER
    export PIPEWIRE_RUNTIME_DIR=/dev/null
    export PATH=$PATH:$HOME/.local/bin
    ```

---

## Usage

### Description

This details how we can use Distrobox by creating, entering, and managing containers.

### References

- [Useful tips](https://github.com/89luca89/distrobox/blob/main/docs/useful_tips.md)
- [distrobox-create](https://github.com/89luca89/distrobox/blob/main/docs/usage/distrobox-create.md)
- [Containers Distros](https://github.com/89luca89/distrobox/blob/main/docs/compatibility.md#containers-distros)

### Steps

1. Create a home directory for our Distrobox container (i.e. `ubuntu`):

    ```sh
    mkdir -p ~/distrobox/ubuntu
    ```

2. Create a Distrobox container based on i.e. Ubuntu 22.04, named `ubuntu`, with a custom `${HOME}` directory:

    ```sh
    distrobox create --image docker.io/library/ubuntu:22.04 --name ubuntu --home ~/distrobox/ubuntu
    ```

3.  Enter a Distrobox container named i.e. `ubuntu`:

    ```sh
    distrobox enter ubuntu -nw
    ```

    > [!NOTE]  
    > The `-nw` flag is optional and is used to send the user directly to the container's home directory.

    You may exit the container by using the <kbd>Ctrl + D</kbd> key combination or running the following command:

    ```sh
    exit
    ```

4.  To stop and delete a Distrobox container named i.e. `ubuntu` from the host system:

    ```sh
    distrobox stop ubuntu && distrobox rm ubuntu
    ```

5. To run commands on the host system from inside a Distrobox container, use the `distrobox-host-exec` command:

    ```sh
    distrobox-host-exec flatpak run com.google.Chrome
    ```

    This example runs the `flatpak` command on the host system from inside the Distrobox container.

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
    distrobox create --image docker.io/library/archlinux --name arch --home ~/distrobox/arch
    ```

3. Enter our Distrobox container (i.e. `arch`):

    ```sh
    distrobox enter arch -nw
    ```

4. Install the application or library we desire. For example, we would like to install `unrar` using `yay` inside the container:

    ```sh
    yay -S unrar
    ```

5. Export the binary we had installed, `unrar` from the container so that we have access to it on our desktop:

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

---

## VS Code Integration

### Description

This allows attaching to a Distrobox Container from within VS Code (on the host system) like you would on Windows with WSL.

> [!NOTE]  
> This guide assumes that you are using the Flatpak version of VS Code.

### References

- [Integrate VSCode and Distrobox](https://github.com/89luca89/distrobox/blob/main/docs/posts/integrate_vscode_distrobox.md)

### Steps

1. Install the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension on VS Code.

2. Create a `podman` wrapper from within the Distrobox container to access the host's `podman` (or `docker`) in `~/.local/bin/podman-host`:

    ```sh
    nano ~/.local/bin/podman-host
    ```

    Content of `podman-host`:

    ```sh
    #!/bin/bash
    set -x
    if [ "$1" == "exec" ]; then
        # Remove 'exec' from $@
        shift
        script='
            result_command="podman exec"
            for i in $(printenv | grep "=" | grep -Ev " |\"" |
                grep -Ev "^(HOST|HOSTNAME|HOME|PATH|SHELL|USER|_)"); do

                result_command=$result_command --env="$i"
            done

            exec ${result_command} "$@"
            '
        exec flatpak-spawn --host sh -c "$script" - "$@"
    else
        exec flatpak-spawn --host podman "$@"
    fi
    ```

3. Make the `podman-host` script executable:

    ```sh
    chmod +x ~/.local/bin/podman-host
    ```

4. Open up VS Code and head to **Settings** by pressing <kbd>Ctrl + ,</kbd>.

5. Add the `podman-host` script as the Docker Path under the **Dev > Containers: Docker Path** setting.

    ```
    /home/<container-user>/.local/bin/podman-host
    ```

    Replace `<container-user>` with the user of your container.

6. From the host system, make the container findable/recognisable from within VS Code by creating a `json` file with the name of your container.

    Create the `json` file at `~/.var/app/com.visualstudio.code/config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin/<container-name>.json`:

    ```sh
    nano ~/.var/app/com.visualstudio.code/config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin/<container-name>.json
    ```

    Replace `<container-name>` with the name of your container (i.e. `arch`).

    Content of the `<container-name>.json` file:

    ```json
    {
        "name" : "", // PUT YOUR DISTROBOX NAME HERE
        "remoteUser": "${localEnv:USER}",
        "settings": {
            "remote.containers.copyGitConfig": false,
            "remote.containers.gitCredentialHelperConfigLocation": "none",
            "terminal.integrated.profiles.linux": {
            "shell": {
                "path": "${localEnv:SHELL}",
                "args": [
                "-l"
                ]
            }
            },
            "terminal.integrated.defaultProfile.linux": "shell"
        },
        "remoteEnv": {
            "COLORTERM": "${localEnv:COLORTERM}",
            "DBUS_SESSION_BUS_ADDRESS": "${localEnv:DBUS_SESSION_BUS_ADDRESS}",
            "DESKTOP_SESSION": "${localEnv:DESKTOP_SESSION}",
            "DISPLAY": "${localEnv:DISPLAY}",
            "LANG": "${localEnv:LANG}",
            "SHELL": "${localEnv:SHELL}",
            "SSH_AUTH_SOCK": "${localEnv:SSH_AUTH_SOCK}",
            "TERM": "${localEnv:TERM}",
            "VTE_VERSION": "${localEnv:VTE_VERSION}",
            "XDG_CURRENT_DESKTOP": "${localEnv:XDG_CURRENT_DESKTOP}",
            "XDG_DATA_DIRS": "${localEnv:XDG_DATA_DIRS}",
            "XDG_MENU_PREFIX": "${localEnv:XDG_MENU_PREFIX}",
            "XDG_RUNTIME_DIR": "${localEnv:XDG_RUNTIME_DIR}",
            "XDG_SESSION_DESKTOP": "${localEnv:XDG_SESSION_DESKTOP}",
            "XDG_SESSION_TYPE": "${localEnv:XDG_SESSION_TYPE}"
        }
    }
    ```

    Be sure to add the name of your container to the `name` field.

7. To attach the container from within VS Code in the host system, open the Command Palette by pressing <kbd>Ctrl + Shift + P</kbd>.

8. Search and click the **Attach to Running Container** option.

9. Click the name of the container we have configured (i.e. `arch`).
