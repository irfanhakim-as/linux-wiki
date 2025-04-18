# Nvidia

## Description

Nvidia is a software and fabless company which designs graphics processing units (GPUs), application programming interface (APIs) for data science and high-performance computing as well as system on a chip units (SoCs) for the mobile computing and automotive market.

## Directory

- [Nvidia](#nvidia)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [GreenWithEnvy](#greenwithenvy)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [Nvidia](https://www.nvidia.com)

---

## GreenWithEnvy

> [!WARNING]  
> Efforts to bring [Wayland support](https://gitlab.com/leinardi/gwe/-/merge_requests/80) is still ongoing, you may switch to alternatives like [LACT](lact.md) in the meantime.

### Description

This details setting up GreenWithEnvy, a system utility for controlling NVIDIA GPUs.

### References

- [GreenWithEnvy](https://gitlab.com/leinardi/gwe)

### Steps

1. [Install](flatpak.md#install) the **GreenWithEnvy** (`com.leinardi.gwe`) app as a Flatpak.

2. Set it to autostart hidden in the system tray:

    - Add GreenWithEnvy to the list of [autostart](autostart.md#add-application-to-autostart) applications.

    - Update its **Arguments** as the following:

        ```sh
        run --branch=stable --arch=x86_64 --command=/app/bin/gwe --file-forwarding com.leinardi.gwe --hide-window @@u %U @@
        ```

        The `--hide-window` flag hides the main window on startup.

3. Configure a custom fan profile:

    - In the **Fan profile** section, expand the dropdown (currently defaults to **Auto**) and select **Custom**.

    - Click the corresponding **Pencil** icon to launch the **Speed Profile** editor window.

    - Use the editor to configure the fan speed and temperature curve as desired.

        Sample values:

        - Temperature: `40°C`, Duty: `40%`
        - Temperature: `50°C`, Duty: `60%`
        - Temperature: `60°C`, Duty: `70%`
        - Temperature: `70°C`, Duty: `85%`
        - Temperature: `75°C`, Duty: `100%`

    - Save each temperature and duty configuration and close the editor window.

    - Back in the **Fan profile** section, click **Apply** to use the custom fan profile.
