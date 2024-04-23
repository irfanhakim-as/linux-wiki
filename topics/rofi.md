# Rofi

## Description

A window switcher, Application launcher and dmenu replacement.

## Directory

- [Rofi](#rofi)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Use as Spotlight Alternative](#use-as-spotlight-alternative)
    - [Description](#description-1)
    - [Steps](#steps)
  - [Configuration](#configuration)
    - [Description](#description-2)
    - [References](#references-1)
    - [Steps](#steps-1)

## References

- [Rofi](https://github.com/davatorium/rofi)

---

## Use as Spotlight Alternative

### Description

This installs Rofi and sets it up as a Spotlight equivalent.

> [!IMPORTANT]  
> This guide assumes that you are using KDE Plasma as your desktop environment.

### Steps

1. [Install](yay.md#install) the `rofi` package using `yay`.

2. Set a custom shortcut to launch Rofi:

   - Open the **System Settings** app.

   - Click **Shortcuts**.

   - Click **Custom Shortcuts**.

   - Right click an empty space and click **New** > **Global Shortcut** > **Command/URL**.

   - Name the shortcut (i.e. `Run rofi`).

   - Click **Trigger** and add a **Shortcut** (i.e. <kbd>Alt + Space</kbd>).

   - Under **Action**, add the **Command**, `rofi -show combi`.

---

## Configuration

### Description

This details a sample configuration and theme customisation to improve Rofi.

### References

- [DT Rofi config](https://gitlab.com/dwt1/dotfiles/-/tree/master/.config/rofi)

### Steps

1. Create Rofi's config and `themes` directories:

    ```sh
    mkdir -p ~/.config/rofi/themes
    ```

2. Create a theme file named `dt-center.rasi`:

    ```sh
    nano ~/.config/rofi/themes/dt-center.rasi
    ```

    Paste the following as the content of the theme file:

    ```rasi
    /**
    * ROFI Color theme
    * NAME: dt-center.rasi
    * DESCRIPTION: This is a centered prompt.
    * AUTHOR: Derek Taylor (DT)
    */

    * {
        background-color:            #282c34;
        border-color:                #282c34;
        text-color:                  #bbc2cf;
        prompt-font:                 "UbuntuMono Nerd Font Mono Bold 10";
        prompt-background:           #51afef;
        prompt-foreground:           #282c34;
        prompt-padding:              4px;
        alternate-normal-background: #1c1f24;
        alternate-normal-foreground: @text-color;
        selected-normal-background:  #ae3f3e;
        selected-normal-foreground:  #ffffff;
        spacing:                     3;
    }
    #window {
        border:  1;
        padding: 5;
    }
    #mainbox {
        border:  0;
        padding: 0;
    }
    #message {
        border:       1px dash 0px 0px ;
        padding:      1px ;
    }
    #listview {
        fixed-height: 0;
        border:       2px dash 0px 0px ;
        spacing:      2px ;
        scrollbar:    true;
        padding:      2px 0px 0px ;
    }
    #element {
        border:  0;
        padding: 1px ;
    }
    #element.selected.normal {
        background-color: @selected-normal-background;
        text-color:       @selected-normal-foreground;
    }
    #element.alternate.normal {
        background-color: @alternate-normal-background;
        text-color:       @alternate-normal-foreground;
    }
    #scrollbar {
        width:        0px ;
        border:       0;
        handle-width: 0px ;
        padding:      0;
    }
    #sidebar {
        border: 2px dash 0px 0px ;
    }
    #button.selected {
        background-color: @selected-normal-background;
        text-color:       @selected-normal-foreground;
    }
    #inputbar {
        spacing:    0;
        padding:    1px ;
    }
    #case-indicator {
        spacing:    0;
    }
    #entry {
        padding: 4px 4px;
        expand: false;
        width: 10em;
    }
    #prompt {
        padding:          @prompt-padding;
        background-color: @prompt-background;
        text-color:       @prompt-foreground;
        font:             @prompt-font;
        border-radius:    2px;
    }

    element-text {
        background-color: inherit;
        text-color:       inherit;
    }

    /* Not actually relevant for this configuration, but it might
    be useful to someone having issues with their icons' background color

    element-icon {
        background-color: inherit;
    }
    */
    ```

3. Create a configuration file named `config.rasi`:

    ```sh
    nano ~/.config/rofi/config.rasi
    ```

    Paste the following as the content of the configuration file:

    ```rasi
    configuration {
        modes: "window,drun,ssh,combi,filebrowser";
        font: "SauceCodePro Nerd Font Mono Medium 10";
        combi-modes: "window,drun,ssh";
        show-icons: false;
        icon-theme: "Breeze";
        window-thumbnail: false;
        sidebar-mode: false;
        terminal: "alacritty";
        ssh-client: "ssh";
        ssh-command: "{terminal} -e {ssh-client} {host} [-p {port}]";
        window {
            display-name: "💻";
        }
        drun {
            display-name: "📦";
        }
        ssh {
            show-icons: false;
            display-name: "👨‍💻";
        }
    }
    @theme "~/.config/rofi/themes/dt-center.rasi"
    ```

4. Make any desired changes to either the theme, `~/.config/rofi/themes/dt-center.rasi` or configuration file, `~/.config/rofi/config.rasi` accordingly.
