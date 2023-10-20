# Autostart

## Description

This topic focuses on autostart applications.

> [!NOTE]  
> This guide assumes that you are using the KDE Plasma desktop environment.

## Directory

- [Autostart](#autostart)
  - [Description](#description)
  - [Directory](#directory)
  - [Add Application to Autostart](#add-application-to-autostart)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Silent Startup Configurations](#silent-startup-configurations)
    - [Description](#description-2)
    - [Steam](#steam)
    - [GWE (Flatpak)](#gwe-flatpak)
    - [Anydesk](#anydesk)
    - [Discord (Flatpak)](#discord-flatpak)
    - [Signal (Flatpak)](#signal-flatpak)
    - [Vorta (Flatpak)](#vorta-flatpak)

---

## Add Application to Autostart

### Description

This details how to add an application to autostart (on boot) and optionally configure the autostart configuration.

### Steps

1. Open the **System Settings** app.

2. Click the **Startup and Shutdown** section.

3. Click the **Autostart** tab.

4. Click the **Add...** button.

5. Click the **Add Application...** option.

6. Select the application you wish to have started upon boot.

7. **(Optional)** Configure the application's autostart options:

   - Click the app's corresponding **Properties** button.

   - Make your updates (i.e. Add a custom argument in **Application** > **Arguments**).

   - Click the **OK** button.

---

## Silent Startup Configurations

### Description

This details known configurations for certain applications on how to have them autostart silently.

### Steam

- Silent flag: `-silent`

- Argument:

    ```sh
    -silent %U
    ```

### GWE (Flatpak)

- Silent flag: `--hide-window`

- Argument:

    ```sh
    run --branch=stable --arch=x86_64 --command=/app/bin/gwe --file-forwarding com.leinardi.gwe --hide-window @@u %U @@
    ```

### Anydesk

Start and enable the `anydesk` service:

```sh
sudo systemctl enable --now anydesk
```

### Discord (Flatpak)

- Silent flag: `--start-minimized`

- Argument:

    ```sh
    run --branch=stable --arch=x86_64 --command=discord com.discordapp.Discord --start-minimized
    ```

### Signal (Flatpak)

- Silent flag: `--use-tray-icon` and `--start-in-tray`

- Argument:

    ```sh
    run --branch=stable --arch=x86_64 --command=signal-desktop --file-forwarding org.signal.Signal --use-tray-icon --start-in-tray @@u %U @@
    ```

### Vorta (Flatpak)

- Silent flag: `--daemonize`

- Argument:

    ```sh
    run com.borgbase.Vorta --daemonize
    ```
