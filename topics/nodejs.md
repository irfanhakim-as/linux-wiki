# Node.js

## Description

Node.js is a cross-platform, open-source JavaScript runtime environment that can run on Windows, Linux, Unix, macOS, and more. Node.js runs on the V8 JavaScript engine, and executes JavaScript code outside a web browser.

## Directory

- [Node.js](#nodejs)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Node Version Manager (nvm)](#node-version-manager-nvm)
    - [Description](#description-2)
    - [References](#references-2)
    - [Install nvm](#install-nvm)
    - [Installing a Node.js Version](#installing-a-nodejs-version)
    - [Setting a Default Node.js Version](#setting-a-default-nodejs-version)

## References

- [Node.js](https://nodejs.org/en)
- [Wikipedia](https://en.wikipedia.org/wiki/Node.js)

---

## Installation

### Description

This details a basic installation setup for Node.js (and npm) on your system.

### References

- [ArchWiki](https://wiki.archlinux.org/title/Node.js#Installation)

### Steps

1. [Install](yay.md#install) the `node` package using your package manager (i.e. `yay`).

    **Alternatively**, you may also install the LTS version of Node.js through any of the following packages:

   - `nodejs-lts-jod` - version 22.x
   - `nodejs-lts-iron` - version 20.x
   - `nodejs-lts-hydrogen` - version 18.x

2. [Install](yay.md#install) the `npm` package using your package manager (i.e. `yay`).

---

## Node Version Manager (nvm)

### Description

This details a more advanced Node.js installation setup using Node Version Manager (nvm) which allows managing multiple versions of Node.js.

### References

- [ArchWiki](https://wiki.archlinux.org/title/Node.js#Node_Version_Manager)
- [Node Version Manager](https://github.com/nvm-sh/nvm)
- [nvm.fish](https://github.com/jorgebucaran/nvm.fish)

### Install nvm

1. If you have previously [installed](#installation) Node.js and the `npm` package manager, [uninstall](yay.md#uninstall) them accordingly using your package manager (i.e. `yay`).

    > [!NOTE]  
    > Depending on your setup, if your installed Node.js package is required by other packages on your system, you may need to either uninstall the packages that depend on them, or uninstall the Node.js package with an additional flag (i.e. `ignore-dependencies` for Homebrew).

2. If your default shell is either `bash`, `zsh`, or `ksh`:

   - [Install](yay.md#install) the `nvm` package using your package manager (i.e. `yay`).

   - Add the following line to your shell profile (i.e. `~/.bash_profile` or `~/.zshrc`):

      ```sh
      . /usr/share/nvm/init-nvm.sh
      ```

3. **Alternatively**, if your default shell is `fish`: [install the Fisher plugin manager](fish.md#install-fisher), then [install](fish.md#install-plugins) the `nvm.fish` Fisher plugin.

4. Reload your shell profile using `source`:

    ```sh
    source <shell-profile>
    ```

    Replace `<shell-profile>` with the path to your shell profile (i.e. `~/.bash_profile` or `~/.config/fish/config.fish`).

### Installing a Node.js Version

> [!IMPORTANT]  
> This part of the guide assumes that you have already [installed](#install-nvm) nvm.

1. Run the following command to install a specific version of Node.js:

    ```sh
    nvm install <version>
    ```

    Replace `<version>` with the version of Node.js you wish to install using its version number (i.e. `22.14.0`) or alias (i.e. `lts`).

2. Verify that the specified Node.js version has been installed by listing down all installed versions:

    ```sh
    nvm list
    ```

    Sample output:

    ```
      ▶ v22.2.0
    ```

### Setting a Default Node.js Version

> [!IMPORTANT]  
> This part of the guide assumes that you have already [installed](#installing-a-nodejs-version) a Node.js version using nvm.

1. If you have [installed nvm](#install-nvm) using its official `nvm` package:

    ```sh
    nvm alias default <version>
    ```

    Replace `<version>` with the version of Node.js you wish to set as the default using its version number (i.e. `22.14.0`).

2. **Alternatively**, if you have [installed nvm](#install-nvm) using the `nvm.fish` Fisher plugin:

    ```sh
    set --universal nvm_default_version <version>
    ```

    Replace `<version>` with the version of Node.js you wish to set as the default using its version number (i.e. `22.14.0`) or alias (i.e. `lts/jod`).

3. Launch a new shell session and verify that it is using the specified default Node.js version:

    ```sh
    node --version
    ```

    Sample output:

    ```
    v22.14.0
    ```
