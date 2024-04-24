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
  - [Autostart as a Service](#autostart-as-a-service)
    - [Description](#description-2)
    - [Start and Enable Service](#start-and-enable-service)
    - [Stop and Disable Service](#stop-and-disable-service)
    - [Status and Restart Service](#status-and-restart-service)
  - [Silent Startup Configurations](#silent-startup-configurations)
    - [Description](#description-3)
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

## Autostart as a Service

### Description

Some applications can be set to autostart as a service, this details how to do so.

### Start and Enable Service

1. First, identify the name of the service. In this example, we'll assume the name of the service is, `anydesk.service`.

2. To start the service once, run:

    ```sh
    sudo systemctl start anydesk.service
    ```

3. To enable the service to start on boot, run:

    ```sh
    sudo systemctl enable anydesk.service
    ```

4. To make it simpler, you could start and enable the service on boot at once:

    ```sh
    sudo systemctl enable --now anydesk.service
    ```

    In any of the command examples, be sure to replace `anydesk.service` with the name of the service you wish to start or enable.

### Stop and Disable Service

1. If you wish to stop the running service, run:

    ```sh
    sudo systemctl stop anydesk.service
    ```

2. To disable the service from starting on boot, run:

    ```sh
    sudo systemctl disable anydesk.service
    ```

    Again, replace `anydesk.service` with the name of the service you wish to stop or disable.

### Status and Restart Service

1. To check the status of the service, run:

    ```sh
    sudo systemctl status anydesk.service
    ```

2. To restart the service, run:

    ```sh
    sudo systemctl restart anydesk.service
    ```

    Replace `anydesk.service` with the name of the service you wish to check or restart.

---

## Silent Startup Configurations

### Description

This details known configurations for certain applications on how to have them autostart silently.

### Steam

- Argument:

    ```sh
    -silent %U
    ```

    Silent flag: `-silent`

### GWE (Flatpak)

- Argument:

    ```sh
    run --branch=stable --arch=x86_64 --command=/app/bin/gwe --file-forwarding com.leinardi.gwe --hide-window @@u %U @@
    ```

    Silent flag: `--hide-window`

### Anydesk

- [Start and Enable](#start-and-enable-service) the `anydesk.service` service:

### Discord (Flatpak)

- Argument:

    ```sh
    run --branch=stable --arch=x86_64 --command=discord com.discordapp.Discord --start-minimized
    ```

    Silent flag: `--start-minimized`

### Signal (Flatpak)

- Argument:

    ```sh
    run --branch=stable --arch=x86_64 --command=signal-desktop --file-forwarding org.signal.Signal --use-tray-icon --start-in-tray @@u %U @@
    ```

    Silent flag: `--use-tray-icon` and `--start-in-tray`

### Vorta (Flatpak)

- Argument:

    ```sh
    run com.borgbase.Vorta --daemonize
    ```

    Silent flag: `--daemonize`
