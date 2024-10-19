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
  - [Sign Git Commits](#sign-git-commits)
    - [Description](#description-3)
    - [References](#references-3)
    - [Steps](#steps-2)
  - [Update Config](#update-config)
    - [Description](#description-4)
    - [References](#references-4)
    - [Steps](#steps-3)
  - [Update GPG Key Passphrase](#update-gpg-key-passphrase)
    - [Description](#description-5)
    - [References](#references-5)
    - [Steps](#steps-4)

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

### Steps

1. Launch a Terminal app (i.e. **Konsole**).

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
   - Email address: `user@example.org` (Add your email address here)
   - Comment: (Leave this blank or add a comment)
   - Change name, comment, email, or okay/quit: `o`

4. Enter a passphrase when prompted or leave it empty. Save to the system's password manager if given the option.

---

## Sign Git Commits

> [!IMPORTANT]  
> A portion of this guide assumes you are using the [**Fish**](fish.md) shell. If you are using a different shell, make any required adjustments accordingly.

### Description

This details how we can enforce automatic signing for all our commits and tags in Git and GitHub/GitLab.

### References

- [How to sign your commits](https://binx.io/2021/12/06/why-you-should-start-signing-your-git-commits-today)

### Steps

1. [Create a GPG key](#generate-gpg-key) if you have not already.

2. List our GPG keys:

    ```sh
    gpg --list-secret-keys --keyid-format long
    ```

3. From this output, locate our GPG key and take note of the value of the second column from the row that has `sec` in the first column:

    ```
    sec   ed25519/1H89FHO4MGAJTJ9Z
    ```

4. Copy the value trailing the `/` (i.e. `1H89FHO4MGAJTJ9Z`), and get our GPG public key using the following command:

    ```sh
    gpg --armor --export 1H89FHO4MGAJTJ9Z
    ```

5. The GPG public key we require looks something like this:

    ```
    -----BEGIN PGP PUBLIC KEY BLOCK-----

    7Ze49bA33Xzun7SbusOQspoUIYsgPny2eitPOKRvavumM+397nTftVhHia/eI410
    ...
    Lz8/MGzO2FgC33XdFwhyyp3yQH18XCnV4IMUgrFNrG==
    =iT48
    -----END PGP PUBLIC KEY BLOCK-----
    ```

    Copy the entire public key.

6. Register the public key to GitHub:

   - Go to GitHub's [SSH and GPG keys](https://github.com/settings/keys) page.
   - Under the **GPG keys** section, click the **New GPG key** button.
   - Add a title for the GPG key (i.e. your system's hostname).
   - Paste our GPG public key into the **Key** text field.
   - Click the **Add GPG key** button.

7. Register the public key to GitLab:

   - Go to GitLab's [GPG Keys](https://gitlab.com/-/user_settings/gpg_keys) page.
   - Click the **Add new key** button.
   - Paste our GPG public key into the **Key** text field.
   - Click the **Add key** button.

8. Configure Git to use our GPG key and enforce automatic signing for all our commits and tags.

    Register our GPG key to Git:

    ```sh
    git config --global user.signingkey 1H89FHO4MGAJTJ9Z
    ```

    > [!WARNING]  
    > Replace `1H89FHO4MGAJTJ9Z` with the value you used in step 3.

    Set automatic commit signing:

    ```sh
    git config --global commit.gpgSign true
    ```

    Set automatic tag signing:

    ```sh
    git config --global tag.gpgSign true
    ```

9.  To ensure that GPG uses the correct terminal for user interaction when performing cryptographic operations, add `GPG_TTY` as a global environment variable to your shell profile (i.e. `fish`).

    > [!WARNING]
    > This step assumes that your default shell is `fish`.

    Edit the shell profile (i.e. `config.fish`):

    ```sh
    nano ~/.config/fish/config.fish
    ```

    Add the following line to the shell profile:

    ```sh
    set -x GPG_TTY (tty)
    ```

    Reload the shell profile we have updated:

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

1. List our GPG keys:

    ```sh
    gpg --list-secret-keys --keyid-format long
    ```

2. From this output, locate our GPG key and take note of the value of the second column from the row that has `sec` in the first column:

    ```
    sec   ed25519/1H89FHO4MGAJTJ9Z
    ```

3. Copy the value trailing the `/` (i.e. `1H89FHO4MGAJTJ9Z`), and edit the GPG key using the following command:

    ```sh
    gpg --edit-key 1H89FHO4MGAJTJ9Z
    ```

4. In the `gpg>` prompt, enter the `passwd` subcommand to change the passphrase:

    ```sh
    passwd
    ```

5. Enter the current passphrase of the GPG key when prompted.

6. Enter the new passphrase and confirm it when prompted.

    You **may** need to enter the `save` command in the `gpg>` prompt to save changes made to the GPG key.
