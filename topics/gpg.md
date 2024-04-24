# GnuPG

## Description

GnuPG is a complete and free implementation of the OpenPGP standard as defined by RFC 4880 (also known as PGP). GnuPG allows you to encrypt and sign your data and communications; it features a versatile key management system, along with access modules for all kinds of public key directories.

## Directory

- [GnuPG](#gnupg)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Generate GPG Key](#generate-gpg-key)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Sign Git Commits](#sign-git-commits)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)

## References

- [GnuPG](https://wiki.archlinux.org/title/GnuPG)

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

4. Enter a passphrase when prompted (i.e. same as your user password) or leave it empty. Save to password manager if given the option.

---

## Sign Git Commits

### Description

This details how we can enforce automatic signing for all our commits and tags in Git and GitHub/GitLab.

> [!IMPORTANT]  
> This guide assumes that you have already generated a GPG key. If you have not, please refer to the [Generate GPG Key](#generate-gpg-key) section.

> [!IMPORTANT]  
> A portion of this guide assumes you are using the [**Fish**](fish.md) shell. If you are using a different shell, make any required adjustments accordingly.

### References

- [How to sign your commits](https://binx.io/2021/12/06/why-you-should-start-signing-your-git-commits-today)

### Steps

1. List our GPG keys:

    ```sh
    gpg --list-secret-keys --keyid-format long
    ```

2. From this output, locate our GPG key and take note of the value of the second column from the row that has `sec` in the first column:

    ```
    sec   ed25519/1H89FHO4MGAJTJ9Z
    ```

3. Copy the value trailing the `/` (i.e. `1H89FHO4MGAJTJ9Z`), and get our GPG public key using the following command:

    ```sh
    gpg --armor --export 1H89FHO4MGAJTJ9Z
    ```

4. The GPG public key we require looks something like this:

    ```
    -----BEGIN PGP PUBLIC KEY BLOCK-----

    7Ze49bA33Xzun7SbusOQspoUIYsgPny2eitPOKRvavumM+397nTftVhHia/eI410
    ...
    Lz8/MGzO2FgC33XdFwhyyp3yQH18XCnV4IMUgrFNrG==
    =iT48
    -----END PGP PUBLIC KEY BLOCK-----
    ```

    Copy the entire public key.

5. Register the public key to GitHub:

   - Go to GitHub's [SSH and GPG keys](https://github.com/settings/keys) page.
   - Under the **GPG keys** section, click the **New GPG key** button.
   - Add a title for the GPG key (i.e. your system's hostname).
   - Paste our GPG public key into the **Key** text field.
   - Click the **Add GPG key** button.

6. Register the public key to GitLab:

   - Go to GitLab's [GPG Keys](https://gitlab.com/-/profile/gpg_keys) page.
   - Click the **Add new key** button.
   - Paste our GPG public key into the **Key** text field.
   - Click the **Add key** button.

7. Configure Git to use our GPG key and enforce automatic signing for all our commits and tags.

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

8. To ensure that GPG uses the correct terminal for user interaction when performing cryptographic operations, add `GPG_TTY` as a global environment variable to your shell profile (i.e. `fish`).

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
