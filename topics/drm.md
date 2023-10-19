# DRM

## Description

Digital rights management (DRM) is the management of legal access to digital content.

## Directory

- [DRM](#drm)
  - [Description](#description)
  - [Directory](#directory)
  - [Fixing DRM Issues with Google Chrome](#fixing-drm-issues-with-google-chrome)
    - [Description](#description-1)
    - [References](#references)
    - [Steps](#steps)

---

## Fixing DRM Issues with Google Chrome

### Description

At the time of writing, there's a bug with Google Chrome that prevents streaming services like Netflix, and Spotify from working due to DRM. This guide details a workaround to fix the issue.

> [!IMPORTANT]  
> It's likely that if the issue gets fixed, we can either ignore this workaround or revert it as it might disrupt or cause issues when attempting to update Google Chrome in the future.

### References

- [Fix for Netflix, HBO Max, Prime TV and other streaming service not working in Chrome on Steam Deck desktop mode](https://sassykrunchysweet.com/2023/05/17/fix-for-netflix-hbo-max-prime-tv-and-other-streaming-service-not-working-on-chrome-on-steam-deck)
- [DRM (Widevine) issue on Chrome update || Playback of protected content is not enabled](https://support.google.com/chrome/thread/216603047/drm-widevine-issue-on-chrome-update-playback-of-protected-content-is-not-enabled)

### Steps

1. Check the user and group that owns the latest version of `WidevineCdm` (at the time of writing, `4.10.2652.1`):

    ```sh
    ls -la /home/deck/.var/app/com.google.Chrome/config/google-chrome/WidevineCdm
    ```

    > [!NOTE]  
    > This assumes that your user is `deck`. Replace `deck` with your actual username.

    The output we get:

    ```sh
    drwx------  - deck 20 May 01:00 4.10.2652.1
    ```

2. To fix the issue, we'll need to change the user and group of the `4.10.2652.1` folder (recursively) to `root`:

    ```sh
    sudo chown -R root:root /home/deck/.var/app/com.google.Chrome/config/google-chrome/WidevineCdm/4.10.2652.1
    ```

    The output of running the workaround:

    ```sh
    drwx------  - root 20 May 01:00 4.10.2652.1
    ```

3. Restart Google Chrome and the issue should be fixed.

If the bug has been fixed for good by Google, or if you encounter issues updating Google Chrome after this workaround was implemented, you can revert the workaround by running:

```sh
sudo chown -R $USER:$USER /home/deck/.var/app/com.google.Chrome/config/google-chrome/WidevineCdm/4.10.2652.1
```

This will change the user and group of the `4.10.2652.1` folder (recursively) back to your user.
