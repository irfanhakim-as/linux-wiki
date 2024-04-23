# Docker

## Description

Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly.

## Directory

- [Docker](#docker)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
    - [Troubleshooting](#troubleshooting)
      - [IP Range Conflict](#ip-range-conflict)

## References

- [Docker](https://www.docker.com)

---

## Setup

### Description

This details how to install and set up Docker for use by `${USER}` without needing `sudo` (not rootless).

### References

- [Docker](https://wiki.archlinux.org/title/docker)
- [How does compose chooses subnet for default network?](https://github.com/docker/compose/issues/4336#issuecomment-457326123)

### Steps

1. [Install](yay.md#install) the **Docker** (`docker`) package using `yay`.

2. Add our user to the `docker` group:

    ```sh
    newgrp docker
    sudo usermod -aG docker ${USER}
    ```

3. Start and enable the `docker` service:

    ```sh
    sudo systemctl enable --now docker
    ```

### Troubleshooting

#### IP Range Conflict

1. Should an IP range conflict occur, check IP range used by the `docker` daemon:

    ```sh
    ip route | grep docker
    ```

2. Fix by creating an `/etc/docker/daemon.json` file and change the `base` IP to a non-conflicting IP (i.e. `172.18.0.0/16`):

    ```sh
    {
        "debug" : true,
        "default-address-pools" : [
            {
                "base" : "172.18.0.0/16",
                "size" : 24
            }
        ]
    }
    ```

3. Restart the docker service accordingly

    ```sh
    sudo systemctl restart docker
    ```
