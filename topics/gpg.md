# GnuPG

## Description

GnuPG is a complete and free implementation of the OpenPGP standard as defined by RFC 4880 (also known as PGP). GnuPG allows you to encrypt and sign your data and communications; it features a versatile key management system, along with access modules for all kinds of public key directories.

## Directory

- [GnuPG](#gnupg)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Generate GPG Key](#generate-gpg-key)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)
  - [Getting GPG Key Values](#getting-gpg-key-values)
    - [Description](#description-3)
    - [References](#references-3)
    - [GPG Key ID](#gpg-key-id)
    - [GPG Public Key](#gpg-public-key)
  - [Sign Git Commits](#sign-git-commits)
    - [Description](#description-4)
    - [References](#references-4)
    - [Steps](#steps-2)
  - [Update Config](#update-config)
    - [Description](#description-5)
    - [References](#references-5)
    - [Steps](#steps-3)
  - [Update GPG Key Passphrase](#update-gpg-key-passphrase)
    - [Description](#description-6)
    - [References](#references-6)
    - [Steps](#steps-4)
  - [Add Additional Identity to GPG Key](#add-additional-identity-to-gpg-key)
    - [Description](#description-7)
    - [References](#references-7)
    - [Steps](#steps-5)
  - [Renewing Expired GPG Keys](#renewing-expired-gpg-keys)
    - [Description](#description-8)
    - [References](#references-8)
    - [Steps](#steps-6)

## References

- [GnuPG](https://wiki.archlinux.org/title/GnuPG)

---

## Setup

### Description

This details how to install and setup GnuPG and Pinentry.

### References

- [GnuPG Installation](https://wiki.archlinux.org/title/GnuPG#Installation)
- [GnuPG Pinentry](https://wiki.archlinux.org/title/GnuPG#pinentry)

### Steps

1. [Install](yay.md#install) the `gnupg` package (should come preinstalled by default in most cases) using `yay`.

2. [Install](yay.md#install) the `pinentry` package (should come preinstalled by default in most cases) using `yay`.

3. **(Optional)** If you use KDE Wallet, you can also use it to [store GPG key passphrases](kwallet.md#gpg-passphrase).

---

## Generate GPG Key

### Description

This details how to generate a GPG key.

### References

- [GPG Usage](https://wiki.archlinux.org/title/GnuPG#Usage)
- [Generating a new GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

### Steps

1. Launch a Terminal application (i.e. **Konsole**).

2. Generate a GPG key using the `gpg` command:

    ```sh
    gpg --full-gen-key
    ```

3. Add the following values when prompted:

   - What kind of key: `9` (`ECC (sign and encrypt) *default*`)
   - Which elliptic curve you want: `1` (`Curve 25519 *default*`)
   - Key is valid for: `1y`
   - Is this correct: `y`
   - Real name: `My Name` (Add your real name here)
   - Email address: `user@example.com` (Add your email address here)
   - Comment: (Leave this blank or add a comment)
   - Change name, comment, email, or okay/quit: `o`

    Make any of your own adjustments to the above values as desired.

4. Enter a passphrase when prompted or leave it empty. Save to the system's password manager if given the option.

---

## Getting GPG Key Values

### Description

This details how to get certain values relating to our GPG key.

### References

- [Checking for existing GPG keys](https://docs.github.com/en/authentication/managing-commit-signature-verification/checking-for-existing-gpg-keys)

### GPG Key ID

This details how to acquire the unique identifier (long key ID) that is used to identify our GPG key:

1. List the system's GPG secret keys:

    ```sh
    gpg --list-secret-keys --keyid-format long
    ```

    Sample output:

    ```
        /home/user/.gnupg/pubring.kbx
        ------------------------------
        sec   ed25519/1H89FHO4MGAJTJ9Z 2024-01-15 [SC] [expires: 2026-01-15]
            0A41C9F6335DBF47A1A186FAC82F22229FCCE1BF
        uid                 [ultimate] My Name <user@example.com>
        ssb   cv25519/A1B2C3D4E5F6G7H8 2024-01-15 [E] [expires: 2026-01-15]
    ```

2. From this output, locate our GPG key and take note of the value of the second column from the row that says `sec` (Secret key) in the first column:

    ```
        sec   ed25519/1H89FHO4MGAJTJ9Z
    ```

    From this example, such value is `ed25519/1H89FHO4MGAJTJ9Z`.

3. Copy the value trailing the `/` character (i.e. `1H89FHO4MGAJTJ9Z`), which is our GPG key ID:

    ```
        1H89FHO4MGAJTJ9Z
    ```

### GPG Public Key

This details how to get the public key of our GPG key:

1. After acquiring our [GPG key ID](#gpg-key-id) (i.e. `1H89FHO4MGAJTJ9Z`), use it to export our GPG public key:

    ```sh
    gpg --armor --export 1H89FHO4MGAJTJ9Z
    ```

2. Copy the GPG public key from the output accordingly.

    Sample output:

    ```
        -----BEGIN PGP PUBLIC KEY BLOCK-----

        7Ze49bA33Xzun7SbusOQspoUIYsgPny2eitPOKRvavumM+397nTftVhHia/eI410
        ...
        Lz8/MGzO2FgC33XdFwhyyp3yQH18XCnV4IMUgrFNrG==
        =iT48
        -----END PGP PUBLIC KEY BLOCK-----
    ```

---

## Sign Git Commits

### Description

This details how we can enforce automatic signing for all our commits and tags in Git and GitHub/GitLab.

### References

- [How to sign your commits](https://binx.io/2021/12/06/why-you-should-start-signing-your-git-commits-today)

### Steps

1. Copy the [public key](#gpg-public-key) of our GPG key.

2. Register the public key to GitHub:

   - Go to GitHub's [SSH and GPG keys](https://github.com/settings/keys) page.
   - Under the **GPG keys** section, click the **New GPG key** button.
   - Add a title for the GPG key (i.e. your system's user and hostname).
   - Paste our GPG public key into the **Key** text field.
   - Click the **Add GPG key** button.

3. Register the public key to GitLab:

   - Go to GitLab's [GPG Keys](https://gitlab.com/-/user_settings/gpg_keys) page.
   - Click the **Add new key** button.
   - Paste our GPG public key into the **Key** text field.
   - Click the **Add key** button.

4. Configure Git to use our GPG key and enforce automatic signing for all our commits and tags.

   - Register our [GPG key ID](#gpg-key-id) (i.e. `1H89FHO4MGAJTJ9Z`) to Git:

        ```sh
        git config --global user.signingkey 1H89FHO4MGAJTJ9Z
        ```

   - Set automatic commit signing:

        ```sh
        git config --global commit.gpgSign true
        ```

   - Set automatic tag signing:

        ```sh
        git config --global tag.gpgSign true
        ```

5.  To ensure that GPG uses the correct terminal for user interaction when performing cryptographic operations, set `GPG_TTY` to the value of `tty` in your default shell profile.

    - Update the profile of your default shell (i.e. [`fish`](fish.md#configuration)) with the following variable assignment:

        ```sh
        set -x GPG_TTY (tty)
        ```

        If your default shell is `bash`, add the following line instead to its shell profile:

        ```sh
        export GPG_TTY=$(tty)
        ```

    - Reload the updated shell profile (i.e. `~/.config/fish/config.fish`) to apply the changes:

        ```sh
        source ~/.config/fish/config.fish
        ```

---

## Update Config

### Description

This details how to update the GnuPG agent configuration.

### References

- [GnuPG Configuration](https://wiki.archlinux.org/title/GnuPG#Configuration_2)

### Steps

1. Create or update an existing `gpg-agent.conf` config file:

    ```sh
    nano ~/.gnupg/gpg-agent.conf
    ```

2. Write and save any necessary changes to the config file.

3. Reload the updated config:

    ```sh
    gpg-connect-agent reloadagent /bye
    ```

---

## Update GPG Key Passphrase

### Description

This details how to update the passphrase of a GPG key.

### References

- [GPG Change Passphrase Secret Key Password Command](https://www.cyberciti.biz/faq/linux-unix-gpg-change-passphrase-command)

### Steps

1. Get our [GPG key ID](#gpg-key-id) (i.e. `1H89FHO4MGAJTJ9Z`).

2. Edit the GPG key using the following command:

    ```sh
    gpg --edit-key <gpg-key-id>
    ```

    Replace `<gpg-key-id>` with the value of our GPG key ID (i.e. `1H89FHO4MGAJTJ9Z`) accordingly.

3. In the `gpg>` prompt, enter the `passwd` subcommand to change the passphrase:

    ```sh
    passwd
    ```

4. Enter the current passphrase of the GPG key when prompted.

5. Enter the new passphrase and confirm it when prompted.

    You **may** need to enter the `save` subcommand in the `gpg>` prompt to save changes made to the GPG key.

---

## Add Additional Identity to GPG Key

### Description

This details how to add additional identity including name and email addresses (UIDs) to an existing GPG key.

### References

- [Edit your key](https://wiki.archlinux.org/title/GnuPG#Edit_your_key)

### Steps

1. Get our [GPG key ID](#gpg-key-id) (i.e. `1H89FHO4MGAJTJ9Z`).

2. Edit the GPG key using the following command:

    ```sh
    gpg --edit-key <gpg-key-id>
    ```

    Replace `<gpg-key-id>` with the value of our GPG key ID (i.e. `1H89FHO4MGAJTJ9Z`) accordingly.

3. In the `gpg>` prompt, enter the `adduid` subcommand to add a new email address:

    ```sh
    adduid
    ```

4. Add the following values when prompted:

   - Real name: `My Name` (Add your real name here)
   - Email address: `work@example.com` (Add your email address here)
   - Comment: (Leave this blank or add a comment)
   - Change name, comment, email, or okay/quit: `o`

5. After adding the new email, enter the `save` subcommand to save changes:

    ```sh
    save
    ```

6. If you have previously registered the public key of your GPG key with any services such as GitHub or GitLab, you will need to replace them with your new [public key](#gpg-public-key) accordingly.

---

## Renewing Expired GPG Keys

### Description

This details how to renew expired GPG keys.

### References

- [Updating expired GPG keys and their backup](https://gist.github.com/TheSherlockHomie/a91d3ecdce8d0ea2bfa38b67c0355d00)
- [Renew GPG key](https://gist.github.com/krisleech/760213ed287ea9da85521c7c9aac1df0)
- [Extending expiration date](https://wiki.archlinux.org/title/GnuPG#Extending_expiration_date)

### Steps

1. Get our [GPG key ID](#gpg-key-id) (i.e. `1H89FHO4MGAJTJ9Z`).

2. Edit the GPG key using the following command:

    ```sh
    gpg --edit-key <gpg-key-id>
    ```

    Replace `<gpg-key-id>` with the value of our GPG key ID (i.e. `1H89FHO4MGAJTJ9Z`) accordingly.

3. In the `gpg>` prompt, enter the `expire` subcommand to update the GPG key's expiration date:

    ```sh
    expire
    ```

4. When prompted, submit the following values to renew the secret key:

   - Key is valid for? (0): `1y` for one year
   - Is this correct? (y/N): `y` to accept the key's new expiration date

    Sample output:

    ```
        sec  ed25519/1H89FHO4MGAJTJ9Z
            created: 2024-01-15  expires: 2026-01-15  usage: SC
            trust: ultimate      validity: ultimate
        ssb  cv25519/A1B2C3D4E5F6G7H8
            created: 2024-01-15  expired: 2025-01-14  usage: E
        [ultimate] (1). My Name <user@example.com>
    ```

5. After renewing the GPG key's secret key, you may need to renew the GPG key's subkey(s) as well if you have received a warning like the following:

    ```
        gpg: WARNING: Your encryption subkey expires soon.
        gpg: You may want to change its expiration date too.
        gpg: WARNING: No valid encryption subkey left over.
    ```

   - In the same `gpg>` session, enter the `list` subcommand to show your GPG key:

        ```sh
        list
        ```

        Sample output:

        ```
            sec  ed25519/1H89FHO4MGAJTJ9Z
                created: 2024-01-15  expires: 2026-01-15  usage: SC
                trust: ultimate      validity: ultimate
            ssb  cv25519/A1B2C3D4E5F6G7H8
                created: 2024-01-15  expired: 2025-01-14  usage: E
            [ultimate] (1). My Name <user@example.com>
        ```

        You will need to renew every subkey(s) (denoted by the `ssb` prefix) that has expired.

   - To select the first subkey (i.e. `1`), enter the following command:

        ```sh
        key 1
        ```

        Sample output:

        ```
            ssb* cv25519/A1B2C3D4E5F6G7H8
        ```

        The asterisk (`*`) indicates that the subkey has been selected.

   - Enter the `expire` subcommand to update the selected subkey's expiration date:

        ```sh
        expire
        ```

        Enter the same values you have submitted to renew the secret key earlier when prompted. Sample output:

        ```
            sec  ed25519/1H89FHO4MGAJTJ9Z
                created: 2024-01-15  expires: 2026-01-15  usage: SC
                trust: ultimate      validity: ultimate
            ssb* cv25519/A1B2C3D4E5F6G7H8
                created: 2024-01-15  expires: 2026-01-15  usage: E
            [ultimate] (1). My Name <user@example.com>
        ```

        The expiration date of each of your GPG key's subkey(s) should be updated accordingly.

6. After the GPG key's secret key and subkey(s) expiration date have been updated, enter the `trust` subcommand to update the GPG key's trust level:

    ```sh
    trust
    ```

    When prompted, select the `ultimate` trust level (i.e. `5`):

    ```sh
    5
    ```

    Confirm the selected trust level:

    ```sh
    y
    ```

7. After the GPG key's secret key and subkey(s) expiration date have been updated, enter the `save` subcommand (in the `gpg>` prompt) to save changes made to the GPG key:

    ```sh
    save
    ```

8. If you have previously registered the public key of your GPG key with any services such as GitHub or GitLab, you **may** need to update them with your new [public key](#gpg-public-key) accordingly.
