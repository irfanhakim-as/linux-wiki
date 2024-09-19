# KDE Wallet

> [!NOTE]  
> This guide assumes that you are using the KDE Plasma desktop environment.

## Description

KDE Wallet Manager is a tool to manage passwords on the KDE Plasma system. By using the KWallet subsystem it not only allows you to keep your own secrets but also to access and manage the passwords of every application that integrates with KWallet.

## Directory

- [KDE Wallet](#kde-wallet)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Setup](#setup)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Auto Unlock](#auto-unlock)
    - [Description](#description-2)
    - [References](#references-1)
    - [Steps](#steps-1)
    - [Blowfish](#blowfish)
    - [GPG](#gpg)
  - [Fix Error with Visual Studio Code](#fix-error-with-visual-studio-code)
    - [Description](#description-3)
    - [References](#references-2)
    - [Steps](#steps-2)

## References

- [KDE Wallet](https://wiki.archlinux.org/title/KDE_Wallet)

---

## Setup

### Description

This details how to setup and create a KDE Wallet and use it by default.

### Steps

1. [Install](yay.md#install) the `kwalletmanager` package using `yay` to easily configure our KDE Wallet(s).

    This will add a **KDE Wallet** section to our **System Settings** application.

2. Launch the **System Settings** application.

3. Under the **Security & Privacy** group, expand the **KDE Wallet** section.

4. In the **KDE Wallet** page, in the **Wallet Preferences** tab, check the **Enable the KDE wallet subsystem** box.

5. Under the **Automatic Wallet Selection** section, click the **New** button corresponding to the **Select wallet to use as default** option.

6. Enter a name for the wallet i.e. `kdewallet` and click the **OK** button.

    > [!NOTE]  
    > If this is your first wallet, it is recommended to set its name to `kdewallet`.

7. Select one of the two KDE Wallet type options:

   - **Classic, blowfish encrypted file** (Recommended)
   - **Use GPG encryption, for better protection**

    Click the **Next** button.

8. If you choose to use Blowfish, enter a password but with some considerations in mind:

   - If your desktop is set to autologin and you wish for your wallet to auto unlock: Set an empty password
   - If your desktop is set to autologin and you do not mind unlocking the wallet each time an app wishes to read from it: Set any secure password
   - If your desktop is not set to autologin and you wish for your wallet to auto unlock: Set the same password as your user password

    Click the **OK** button.

9. If you chose to use GPG, select an existing trusted key in the list. If none exists, [create a new GPG key](./gpg.md#generate-gpg-key) and return to this step.

10. Click the **Finish** button.

11. If prompted to enter the passphrase of your chosen GPG key, enter it and select the **OK** button.

12. Back in the **Automatic Wallet Selection** section, expand the **Select wallet to use as default** dropdown and select the wallet you just created.

13. Under the **Secret Service** section, check the **Use KWallet for the Secret Service Interface** box.

14. **(Optional)** Navigate to the **Access Control** tab and check the **Prompt when an application accesses a wallet** box.

15. Click the **Apply** button at the bottom right.

16. If prompted to authenticate, enter your user credentials and click the **OK** button.

---

## Auto Unlock

> [!IMPORTANT]  
> This guide assumes that you have completed [setting up](#setup) your KDE Wallet.

### Description

This details how to set our KDE Wallet to auto unlock with our desktop at the expense of security.

### References

- [Unlock KDE Wallet automatically on login](https://wiki.archlinux.org/title/KDE_Wallet#Unlock_KDE_Wallet_automatically_on_login)

### Steps

1. Ensure the chosen default KDE Wallet must be a wallet named `kdewallet` as described in the [Setup](#setup) section.

2. Follow the subsequent steps depending on your wallet type:

   - [Blowfish](#blowfish)
   - [GPG](#gpg)

    Return to the following step once completed.

3. Restart the system.

### Blowfish

> [!IMPORTANT]  
> Wallet auto unlock will only work together with desktop [autologin](plasma-desktop.md#auto-login) if the `kdewallet` was configured with an empty password or passphrase. If you wish for the wallet to be secured with a password, desktop autologin must be disabled.

1. Depending on your choice of whether or not your wallet should be secured with a password, enable or disable [autologin](plasma-desktop.md#auto-login) on your desktop.

2. Depending on your choice of desktop autologin setting, set the password for the `kdewallet` wallet:

   - Launch the **System Settings** application.

   - Under the **Security & Privacy** group, expand the **KDE Wallet** section.

   - Click the **Launch Wallet Manager** button at the bottom right.

   - In the newly opened **Wallet Manager** window, navigate to the **kdewallet** wallet if you have multiple wallets.

   - Click the **Change Password** button on the top right.

   - Set the password to your user password if you have desktop autologin disabled.

   - **Alternatively**, set the password to an empty password if you have enabled desktop autologin.

   - Click the **OK** button.

3. If you are not using desktop autologin and have set the default wallet's password to your user password accordingly, [install](yay.md#install) the `kwallet-pam` package.

### GPG

1. [Set an empty passphrase](gpg.md#update-gpg-key-passphrase) to the GPG key tied to the `kdewallet` wallet.

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
