# Linux GPU Control Application (LACT)

## Description

This application allows you to control your AMD, Nvidia or Intel GPU on a Linux system.

## Directory

- [Linux GPU Control Application (LACT)](#linux-gpu-control-application-lact)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Fan Control](#fan-control)
    - [Description](#description-2)
    - [Steps](#steps-1)

## References

- [LACT](https://github.com/ilya-zlobintsev/LACT)

---

## Setup

### Description

This details the installation and setup process of LACT on your system.

### References

- [Installation](https://github.com/ilya-zlobintsev/LACT?tab=readme-ov-file#installation)

### Steps

1. [Install](yay.md#install) the `lact` package using your package manager (i.e. `yay`).

2. [Start and Enable](autostart.md#start-and-enable-service) the `lactd.service` service as required by the application.

---

## Fan Control

### Description

This details how to configure the default fan control profile for your GPU using LACT.

### Steps

1. Launch the **LACT** graphical application you had [installed and set up](#setup).

2. If you have multiple GPUs or profiles, within the application menu bar, ensure the dropdown is selecting the right combination (i.e. `GPU 0 | Default`).

3. Navigate to the **Thermals** tab.

4. Under **Fan control**, switch from the **Automatic** tab to the **Curve** tab.

5. With the provided **Fan Curve** sliders, configure your desired fan curve profile accordingly. For example:

   - Temperature: `40°C`, Fan Speed: `40%`
   - Temperature: `50°C`, Fan Speed: `60%`
   - Temperature: `60°C`, Fan Speed: `70%`
   - Temperature: `70°C`, Fan Speed: `85%`
   - Temperature: `80°C`, Fan Speed: `100%`

6. Click the **Apply** button to save the configuration.
