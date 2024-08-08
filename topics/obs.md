# OBS

## Description

OBS (Open Broadcaster Software) is free and open source software for video recording and live streaming.

## Directory

- [OBS](#obs)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [Installation](#installation)
    - [Configuration](#configuration)
  - [Add a Source](#add-a-source)
    - [Description](#description-2)
    - [Steps](#steps)
  - [Capturing Steam Games](#capturing-steam-games)
    - [Description](#description-3)
    - [References](#references-1)
    - [OBS Configuration](#obs-configuration)
    - [Steam Game Configuration](#steam-game-configuration)
  - [Separate Audio Tracks by Application](#separate-audio-tracks-by-application)
    - [Description](#description-4)
    - [References](#references-2)
    - [Installation](#installation-1)
    - [Usage](#usage)
  - [Magewell USB Capture HDMI 4K Plus](#magewell-usb-capture-hdmi-4k-plus)
    - [Description](#description-5)
    - [References](#references-3)
    - [Steps](#steps-1)

## References

- [OBS Studio](https://obsproject.com)

---

## Setup

> [!IMPORTANT]  
> A portion of this guide assumes that you are using an NVIDIA GPU. If this is not the case, make any required adjustments accordingly.

### Description

This details how to install and set up OBS.

### Installation

1. [Install](flatpak.md#install) the **OBS Studio** (`com.obsproject.Studio`) app as a Flatpak.

### Configuration

1. Launch the **OBS Studio** application.

2. Start and complete the initial setup wizard.

3. Click the **Settings** button in the bottom right corner.

4. In the **General** page, locate the **System Tray** section and configure the following:
   
   - [x] Enable
   - [x] Minimize to system tray when started

5. In the **Output** page, configure the following:

   - **Streaming**:
     - Output Mode: `Advanced`
     - Audio Encoder: `libfdk AAC`
     - Video Encoder: `NVIDIA NVENC H.264 (FFmpeg)`
     - Rescale Output: `Disabled`
     - Rate Control: `VBR`
     - Bitrate: `6000 Kbps`
     - Max Bitrate: `6000 Kbps`
     - Keyframe Interval: `2s`
     - Preset: `P5: Slow (Good Quality)`
     - Tuning: `High Quality`
     - Multipass Mode: `Two Passes (Quarter Resolution)`
     - Profile: `high`
     - Psycho Visual Tuning: `Enabled`
     - GPU: `0`
     - Max B-frames: `2`

   - **Recording**:
     - Type: `Standard`
     - Recording Path: `~/Videos/Screen Recording`
     - Generate File Name without Space: `Disabled`
     - Recording Format: `Matroska Video (.mkv)`
     - Video Encoder: `NVIDIA NVENC H.264 (FFmpeg)`
     - Audio Encoder: `libfdk AAC`
     - Audio Track: `1`
     - Rescale Output: `Disabled`
     - Automatic File Splitting: `Disabled`
     - Rate Control: `VBR`
     - Bitrate: `30000 Kbps`
     - Max Bitrate: `50000 Kbps`
     - Keyframe Interval: `0s`
     - Preset: `P5: Slow (Good Quality)`
     - Tuning: `High Quality`
     - Multipass Mode: `Two Passes (Quarter Resolution)`
     - Profile: `high`
     - Psycho Visual Tuning: `Disabled`
     - GPU: `0`
     - Max B-frames: `1`

   - **Audio**:
     - Audio Bitrate (All tracks): `160`

   - **Replay Buffer**:
     - Enable Replay Buffer: `Enabled`
     - Maximum Replay Time: `30s`

6. In the **Video** page, configure the following:

   - Base (Canvas) Resolution: `1920x1080` (Change to your monitor's resolution)
   - Output (Scaled) Resolution: `1920x1080` (Change to your monitor's resolution)
   - Common FPS Values: `60`

7. In the **Hotkeys** page, configure the following:

   - Start Replay Buffer: <kbd>Control + Shift + S</kbd>
   - Save Replay: <kbd>Home</kbd>

8. In the **Advanced** page, configure the following:

   - **Video**:
     - Color Format: `NV12`
     - Color Space: `Rec. 709`
     - Color Range: `Limited`
     - SDR White Level: `300 nits`
     - HDR Nominal Peak Level: `1000 nits`

   - **Recording**:
     - Filename Formatting: `%hh%mm%ss %DD-%MM-%CCYY`
     - Overwrite if file exists: `Disabled`
     - Automatically remux to MP4: `Disabled`
     - Replay Buffer Filename Prefix: `Replay`
     - Replay Buffer Filename Suffix: (Leave blank)

9.  Click the **Apply** button in the bottom right corner and then click **OK**.

---

## Add a Source

### Description

This details how to add a source in OBS.

### Steps

1. Launch the **OBS Studio** application.

2. In the **Scenes** section in the bottom left corner, select a scene (highlighted in blue) you wish to add a source to.

3. In the **Sources** section next to it, click the **+** button and select the desired source type (i.e. `Window Capture (Xcomposite)`).

4. Enter a unique name for the source and click the **OK** button.

5. Some sources may require further configuration. Configure the source as needed and click the **OK** button to finish.

---

## Capturing Steam Games

> [!NOTE]  
> This guide covers the Native version of Steam, and the Native/Flatpak version of OBS.

### Description

This details how to capture and record Steam games using OBS.

### References

- [obs-vkcapture](https://github.com/nowrep/obs-vkcapture)

### OBS Configuration

1. [Install](./yay.md#install) `obs-vkcapture-git` from the `AUR` using `yay`.

2. Additionally, if you are using the Flatpak version of OBS, [install](flatpak.md#install) the `com.obsproject.Studio.Plugin.OBSVkCapture` OBS plugin Flatpak.

3. Restart the system.

4. Launch the **OBS Studio** application.

5. [Add a source](#add-a-source) of type, `Game Capture`, and the name, `Game Capture`.

6. Configure the `Game Capture` source properties as follows:

    - Window: `Capture any window`
    - Capture Cursor: `Enabled`
    - Allow Transparency: `Disabled`

7. Click the **OK** button.

### Steam Game Configuration

1. Launch the **Steam** application.

2. Navigate to the **Library** tab.

3. Locate the game you wish to capture.

4. Right click the game and select **Properties...**.

5. In the **Launch Options** section within the **General** tab, add the following launch command/parameter:

    If the game runs on Vulkan:

    ```sh
    env OBS_VKCAPTURE=1 %command%
    ```

    Otherwise, if the game does not run on Vulkan (i.e. OpenGL):

    ```sh
    obs-gamecapture %command%
    ```

    Any other launch options (i.e. `gamemoderun`, `mangohud`) should placed after the above launch option, before the `%command%` parameter. Example:

    ```sh
    env OBS_VKCAPTURE=1 gamemoderun mangohud %command%
    ```

6. Click the **X** button in the top right corner to close the game **Properties** window.

7. Launch and run the game as per usual and it should now be captured in OBS.

---

## Separate Audio Tracks by Application

> [!IMPORTANT]  
> This guide requires PipeWire and WirePlumber to be installed and configured.

### Description

This details how to separate audio tracks by application virtually in OBS using PipeWire.

### References

- [obs-pipewire-audio-capture](https://github.com/dimtpap/obs-pipewire-audio-capture)

### Installation

> [!NOTE]  
> If you are using the native (non-Flatpak) version of OBS, you could potentially [install](./yay.md#install) the `obs-pipewire-audio-capture` package using `yay` and skip this section.

1. Download the latest release's `linux-pipewire-audio-<version-number>.tar.gz` file from obs-pipewire-audio-capture's [Releases](https://github.com/dimtpap/obs-pipewire-audio-capture/releases/latest) page.

2. Create a `plugins` folder for OBS.

    If you are using the Flatpak version of OBS:

    ```sh
    mkdir -p ~/.var/app/com.obsproject.Studio/config/obs-studio/plugins
    ```

    **Alternatively**, if you are using the native version of OBS:

    ```sh
    mkdir -p ~/.config/obs-studio/plugins
    ```

3. Extract the downloaded `linux-pipewire-audio-<version-number>.tar.gz` archive:

    ```sh
    tar -C "<plugins-path>" -xzf "~/Downloads/linux-pipewire-audio-<version-number>.tar.gz"
    ```

    Replace `<plugins-path>` with the path to the OBS plugins directory, and `<version-number>` with the version number of the downloaded release (i.e. `1.1.3`).

4. Restart the system.

### Usage

1. Launch the **OBS Studio** application.

2. [Add a source](#add-a-source) of type, `Application Audio Capture (PipeWire)`, and the name of the application you wish to add a separate audio track for, i.e. `Discord`.

3. In the source's **Properties**, configure as follows:

   - Match Priority: `Match by binary name, fallback to app name`

   - Application: Expand the dropdown and select the desired application (i.e. `discord`)

      > [!NOTE]  
      > If the desired application is not listed, try launching the application and then collapse/reopen the dropdown.

4. Click the **OK** button.

5. Now in the **Audio Mixer** section, you can enable said application's audio track and mute the other tracks by toggling the **Speaker** icon for each track.

---

## Magewell USB Capture HDMI 4K Plus

### Description

This details the recommended configuration for the Magewell USB Capture HDMI 4K Plus on OBS.

### References

- [GOING NUTS! What Color Format Should I be Using?](https://obsproject.com/forum/threads/going-nuts-what-color-format-should-i-be-using.110169)

### Steps

1. Launch the **OBS Studio** application.

2. [Add a source](#add-a-source) of type, `Video Capture Device (V4L2)`, and the name, `Magewell USB Capture HDMI 4K Plus`.

3. Configure the capture device as follows:

   - Device: `USB Capture HDMI 4K+`
   - Input: `Camera 1`
   - Video Format: `YUYV 4:2:2`
   - Resolution: `2560x1440` (Change to your desired capture resolution)
   - Frame Rate: `Leave Unchanged`
   - Color Range: `Limited`
   - Use Buffering: `Enabled`
   - Autoreset on Timeout: `Disabled`
   - Frames Until Timeout: `5`

4. Click the **OK** button.

5. [Add a source](#add-a-source) of type, `Audio Input Capture (PulseAudio)` (this works even if you're using Pipewire), and the name, `Magewell USB Capture HDMI 4K Plus Audio`.

6. Set the **Device** to `USB Capture HDMI 4K+ Analog Stereo`.

7. Click the **OK** button.

8. In the **Audio Mixer** section, click the **Gear** button at the bottom.

9. Locate the **Magewell USB Capture HDMI 4K Plus Audio** source.

10. Set its corresponding **Audio Monitoring** setting to `Monitor and Output`.

11. Click the **Close** button.

12. Lock both the **Magewell USB Capture HDMI 4K Plus** and **Magewell USB Capture HDMI 4K Plus Audio** sources by clicking each of their corresponding **Lock** buttons in the **Sources** section.
