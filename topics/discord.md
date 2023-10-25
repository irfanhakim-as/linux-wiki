# Discord

## Description

Discord is an instant messaging and VoIP social platform. Users have the ability to communicate with voice calls, video calls, text messaging, media and files in private chats or as part of communities called "servers".

## Directory

- [Discord](#discord)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Screen Sharing with Audio](#screen-sharing-with-audio)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Troubleshooting](#troubleshooting)
    - [Description](#description-2)
    - [Lucky Day Issue](#lucky-day-issue)

## References

- [Discord](https://discord.com)

---

## Screen Sharing with Audio

### Description

The official Discord client does not support screen sharing with audio on Linux. This is a workaround to enable screen sharing with audio in Discord on Linux.

### References

- [discord-screenaudio](https://github.com/maltejur/discord-screenaudio)

### Steps

1. Install `discord-screenaudio` as a Flatpak:

    ```sh
    flatpak install --user de.shorsh.discord-screenaudio
    ```

2. Launch and use the app as you normally would with the official Discord client.

3. When you attempt to share your screen, you will be prompted with a dropdown to select the specific application audio to share. The only caveat is that you will only have the option to share the entire screen.

---

## Troubleshooting

### Description

This details several troubleshooting steps and workarounds for specific issues with the official Discord client on Linux.

### Lucky Day Issue

This is workaround for when Discord forces an update to a new version, before it becomes available on Linux.

1. Update Discord's `build_info.json` file.

    If you are using the Flatpak version of the Discord client:

    ```sh
    sudo nano /var/lib/flatpak/app/com.discordapp.Discord/current/active/files/discord/resources/build_info.json
    ```

    If you are using the Pacman (`yay`) version of the Discord client:

    ```sh
    sudo nano /opt/discord/resources/build_info.json
    ```

2. Update the `version` number to the latest version Discord expects you to update to (i.e. `0.0.22`):

    ```json
    {
      "releaseChannel": "stable",
      "version": "0.0.22"
    }
    ```

3. Save the file and restart Discord.
