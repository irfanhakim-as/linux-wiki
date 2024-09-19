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

1. Enable auto login for our [KDE Plasma desktop](./plasma-desktop.md#auto-login) if haven't already.

    > [!NOTE]  
    > In enabling auto login on KDE Plasma, we will auto login to our desktop every time we turn our computer on. The caveat of this though, applications that require the KDE Wallet (i.e. Discord, Visual Studio Code) will prompt us to enter our password at least once when we attempt to launch them - defeating the purpose of our desktop auto login.

2. To fix this issue while still retaining auto login to our desktop, we need to set (or update our existing password to) an empty password for our KDE Wallet:

   - Launch the **System Settings** application.

   - Under the **Personalization** group, expand the **KDE Wallet** section.

   - Click the **Launch Wallet Manager** button at the bottom right.

   - Click the **Change Password** button on the top right.

      > [!NOTE]  
      > If your wallet uses GPG encryption, you will need to [change (remove) the passphrase for the GPG key](./gpg.md#update-gpg-key-passphrase) instead of the wallet password.

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
