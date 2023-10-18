# Mounting Remote Directory

## Description

This details on how we can mount a remote directory.

## Directory

- [Mounting Remote Directory](#mounting-remote-directory)
  - [Description](#description)
  - [Directory](#directory)
  - [Steps](#steps)

---

## Steps

1. Create the directory that will be used as the mounting point (i.e. `/mnt/mynas`):

    ```sh
    sudo mkdir /mnt/mynas
    ```

2. Change ownership of the mounting point to our user:

    ```sh
    sudo chown ${USER}: /mnt/mynas
    ```

3. Create our credentials file that will be used to access the remote directory (i.e. `.smbcreds`):

    ```sh
    mkdir -p ~/.config/smb
    ```

    ```sh
    nano ~/.config/smb/.smbcreds
    ```

    Content of the credentials file:

    ```
    username=mynasuser
    password=mynaspassword
    ```

4. Add the IP address of our remote server to our `/etc/hosts` file:

    ```sh
    sudo nano /etc/hosts
    ```

    Sample IP address entry:

    ```sh
    # example.org
    192.168.0.120      mynas
    ```

5. Add the line to mount our remote directory to the `/etc/fstab` file:

    ```sh
    sudo nano /etc/fstab
    ```

    > [!IMPORTANT]  
    > This assumes that your remote server's hostname is `mynas` and has a directory named `mydir`, and that your username is `deck`.  
    > Change `mynas/mydir` and `/home/deck` to `${NAS_SERVER}/${NAS_DIR}` and `/home/${USER}` respectively.

    ```sh
    # example.org
    //mynas/mydir                      /mnt/mynas    cifs    _netdev,nofail,mfsymlinks,credentials=/home/deck/.config/smb/.smbcreds,vers=3.0,uid=1000,gid=1000,iocharset=utf8   0 0
    ```

6. Reload the `daemon` for it to recognise the changes made to our `fstab` file:

    ```sh
    sudo systemctl daemon-reload
    ```

7. Mount the remote directory to our new mounting point:

    ```sh
    sudo mount /mnt/mynas
    ```
