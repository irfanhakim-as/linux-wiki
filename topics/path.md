# PATH

## Description

PATH is an environment variable on Unix-like operating systems, DOS, OS/2, and Microsoft Windows, specifying a set of directories where executable programmes are located.

## Directory

- [PATH](#path)
  - [Description](#description)
  - [Directory](#directory)
  - [Add to Path](#add-to-path)
    - [Description](#description-1)
    - [Steps](#steps)
      - [Bash](#bash)

---

## Add to Path

### Description

This details how to add a directory to the `PATH` environment variable.

### Steps

To add a directory (i.e. `~/.local/bin`) to the `PATH` environment variable:

#### Bash

1. Edit the `~/.bashrc` file:

    ```sh
    nano ~/.bashrc
    ```

2. Add the `export PATH` line:

    ```sh
    export PATH="${PATH}:${HOME}/.local/bin"
    ```

    Sample `~/.bashrc` file:

    ```sh
    #
    # ~/.bashrc
    #

    # Customise path
    export PATH="${PATH}:${HOME}/.local/bin"

    # If not running interactively, don't do anything
    [[ $- != *i* ]] && return
    ```

3. Reload our `bash` shell with the updated profile.

    ```sh
    source ~/.bashrc
    ```
