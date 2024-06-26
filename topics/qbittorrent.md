# qBittorrent

## Description

qBittorrent is a bittorrent client programmed in C++ / Qt that uses libtorrent (sometimes called libtorrent-rasterbar) by Arvid Norberg.

## Directory

- [qBittorrent](#qbittorrent)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Discover Torrents](#discover-torrents)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [qBittorrent](https://github.com/qbittorrent/qBittorrent)

---

## Discover Torrents

### Description

This guide details on how we could look for torrent files from qBittorrent directly using Jackett.

### References

- [Jackett](https://github.com/Jackett/Jackett)
- [How to configure Jackett plugin](https://github.com/qbittorrent/search-plugins/wiki/How-to-configure-Jackett-plugin)
- [Unofficial search plugins](https://github.com/qbittorrent/search-plugins/wiki/Unofficial-search-plugins)

### Steps

1. [Install](flatpak.md#install) the **qBittorrent** (`org.qbittorrent.qBittorrent`) app as a Flatpak.

2. Install the Jackett service using a `bash` script.

    Create the installer `bash` script:

    ```sh
    nano ~/install_jackett.sh
    ```

    Content of the script, `install_jackett.sh`:

    ```bash
    #!/bin/bash

    cd /opt \
    && f=Jackett.Binaries.LinuxAMDx64.tar.gz \
    && release=$(wget -q https://github.com/Jackett/Jackett/releases/latest -O - | grep "title>Release" | cut -d " " -f 4) \
    && sudo wget -Nc https://github.com/Jackett/Jackett/releases/download/$release/"$f" \
    && sudo tar -xzf "$f" \
    && sudo rm -f "$f" \
    && sudo chown -R $(whoami):$(whoami) Jackett* \
    && cd Jackett* \
    && sudo ./install_service_systemd.sh \
    && systemctl status jackett.service \
    && cd - \
    && echo -e "\nVisit http://127.0.0.1:9117"
    ```

3. Run the installer:

    ```sh
    bash ~/install_jackett.sh
    ```

4. Visit the local Jackett dashboard http://127.0.0.1:9117 and do some configurations:

   - Click **Add Indexer**.

   - In the **Select an indexer to setup** page, expand the **Type** dropdown, and select the **Public** option.

   - Select the checkboxes of all indexers or those that you wish to add.

   - Click the **Add Selected** button, and wait for it to finish adding all of your selected indexers.

   - **Close** the page if it does not close automatically.

   - Back at the dashboard homepage, in the **Configured Indexers** section, click the **Test All** button.

   - Click the **Delete** icon for each indexer that returns an error after the test.

   - Copy the **API Key** located at the top right of the dashboard.

5. Install the Jackett plugin on qBittorrent:

   - Launch the **qBittorrent** app.

   - Click **View** in the app's menu bar, and check the **Search Engine** option.

   - In the newly added **Search** tab (next to **Transfers**), click the **Search plugins...** button at the bottom right.

   - Click **Install a new one** and select **Web link**.

   - In the **URL** text box, paste in `https://raw.githubusercontent.com/qbittorrent/search-plugins/master/nova3/engines/jackett.py` to install the Jackett plugin.

   - Optionally, you can also add in links to other qBittorrent plugins.

   - Click **OK**.

6. Configure the Jackett qBittorrent plugin by adding your API key (i.e. `cg12d48faefqyaeafaefa3234214afgwrsthqep8fzp`) to the `~/.var/app/org.qbittorrent.qBittorrent/data/qBittorrent/nova3/engines/jackett.json` file:

    ```json
    {
        "api_key": "cg12d48faefqyaeafaefa3234214afgwrsthqep8fzp",
        "thread_count": 20,
        "tracker_first": false,
        "url": "http://127.0.0.1:9117"
    }
    ```

7. Search away for torrents in the **Search** section of qBittorrent.
