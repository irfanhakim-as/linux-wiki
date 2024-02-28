# KDE Wallet

## Description

KDE Wallet Manager is a tool to manage passwords on the KDE Plasma system. By using the KWallet subsystem it not only allows you to keep your own secrets but also to access and manage the passwords of every application that integrates with KWallet.

> [!NOTE]  
> This guide assumes that you are using the KDE Plasma desktop environment.

## Directory

- [KDE Wallet](#kde-wallet)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Auto Unlock](#auto-unlock)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Fix Error with Visual Studio Code](#fix-error-with-visual-studio-code)
    - [Description](#description-2)
    - [References](#references-2)
    - [Steps](#steps-1)

## References

- [KDE Wallet](https://wiki.archlinux.org/title/KDE_Wallet)

---

## Auto Unlock

### Description

This details how to set our KDE Wallet to auto unlock with our desktop at the expense of security.

### References

- [Unlock KDE Wallet automatically on login](https://wiki.archlinux.org/title/KDE_Wallet#Unlock_KDE_Wallet_automatically_on_login)
- [pam_autologin](https://wiki.archlinux.org/title/Pam_autologin)

### Steps

1. Install the `kwalletmanager` package using `yay` to easily configure our KDE Wallet(s):

    ```sh
    yay -S kwalletmanager
    ```

    This will add a **KDE Wallet** section to our **System Settings** application.

2. Enable auto login for our [KDE Plasma desktop](./plasma-desktop.md#auto-login) if haven't already.

> [!NOTE]  
> In enabling auto login on KDE Plasma, we will auto login to our desktop every time we turn our computer on. The caveat of this though, applications that require the KDE Wallet (i.e. Discord, Visual Studio Code) will prompt us to enter our password at least once when we attempt to launch them - defeating the purpose of our desktop auto login.

3. To fix this issue while still retaining auto login to our desktop, we need to set (or update our existing password to) an empty password for our KDE Wallet:

   - Launch the **System Settings** application.

   - Under the **Personalization** group, expand the **KDE Wallet** section.

   - If a wallet has not yet been created, create one first:

     - Under the **Automatic Wallet Selection** section, click the **New** button corresponding to the **Select wallet to use as default** option.
     - Enter a name for the wallet i.e. `kdewallet` and click the **OK** button.
     - Select the **Use GPG encryption, for better protection** option and click the **Next** button.
     - Select an existing trusted key in the list. If none exists, [create a new GPG key](./gpg.md#generate-gpg-key) and return to this step.
     - Click the **Finish** button.

   - Click the **Launch Wallet Manager** button at the bottom right.

   - Click the **Change Password** button on the top right.

      > [!NOTE]  
      > If your wallet uses GPG encryption, you will need to change (remove) the passphrase for the GPG key instead of the wallet password.

   - Leave both the **Password** and **Verify** fields empty and click the **OK** button.

---

## Fix Error with Visual Studio Code

### Description

This guide details on how we could solve the **You're running in a KDE environment but the OS keyring is not available for encryption. Ensure you have kwallet running.** error when launching Visual Studio Code.

### References

- [You're running in a KDE environment but the OS keyring is not available for encryption. Ensure you have kwallet running.](https://github.com/microsoft/vscode/issues/189672)

### Steps

1. Launch the **Visual Studio Code** application.

2. Press <kbd>Ctrl + Shift + P</kbd> simultaneously and type in `runtime` in the provided prompt.

3. Click the **Preferences: Configure Runtime Arguments** option to open the `argv.json` file.

4. Add the following key and value to the very end of the JSON dictionary:

    ```json
    {
      ...
      ...
      ...
      "password-store": "gnome-libsecret",
    }
    ```

5. Restart the **Visual Studio Code** application and verify that the error is no longer present.
