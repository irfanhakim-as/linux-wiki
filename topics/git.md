# Git

## Description

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

## Directory

- [Git](#git)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Git LFS](#git-lfs)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [Git](https://git-scm.com)

---

## Git LFS

### Description

Git LFS is needed to acquire files from git repositories that requires LFS. This details how we could set it up without root privileges.

### References

- [git-lfs](https://git-lfs.com)
- [Installing Git Large File Storage](https://docs.github.com/en/repositories/working-with-files/managing-large-files/installing-git-large-file-storage)

### Steps

1. Head to the https://git-lfs.com site and click the **Download** button for **Linux - x86-64**.

2. Extract the downloaded file, assuming that it's `git-lfs-linux-amd64-v3.4.0.tar.gz`:

   - Locate it in the **Discover** app.

   - Right click on the file.

   - Hover over the **Extract** option.

   - Select the **Extract archive here, autodetect subfolder**.

   - Delete the archive once finished.

4. Get into the `git-lfs` directory we have extracted, assuming the directory name being `git-lfs-3.4.0` and that it was downloaded to the `~/Downloads` directory:

    ```sh
    cd ~/Downloads/git-lfs-3.4.0
    ```

5. Run the installer while setting our prefix to `~/.local` to install `git-lfs`:

    ```sh
    PREFIX="~/.local" ./install.sh
    ```

    > [!IMPORTANT]  
    > This assumes that we have added `~/.local/bin` to our path. If not, please refer to the [Add to Path](path.md#add-to-path) guide.

6. Finish setting up `lfs` on our system:

    ```sh
    git lfs install
    ```
