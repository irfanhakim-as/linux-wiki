# Thunderbird

## Description

Mozilla Thunderbird is a free and open-source email client software which also functions as a full personal information manager with a calendar and contactbook, as well as an RSS feed reader, chat client (IRC/XMPP/Matrix), and news client.

## Directory

- [Thunderbird](#thunderbird)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Configuration](#configuration)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
    - [Default Mail Sorting](#default-mail-sorting)
  - [Preferences](#preferences)
    - [Description](#description-2)
    - [Steps](#steps-1)
    - [Stop Showing Start Page](#stop-showing-start-page)

## References

- [Thunderbird](https://www.thunderbird.net)

---

## Configuration

### Description

This details how to modify Thunderbird's configurations and some recommended settings.

### References

- [Change the default sorting order in Thunderbird](https://superuser.com/questions/13518/change-the-default-sorting-order-in-thunderbird)

### Steps

1. Launch the **Thunderbird** application.

2. Head to the **Settings** page by clicking on the **Hamburger** icon in the top right corner and selecting the **Settings** menu item.

3. In the **General** tab, scroll to the very bottom of the page and click the **Config Editor...** button.

4. Using the provided search bar, search for the setting you wish to configure.

5. After locating the specific setting entry, edit its value:

   - If it's a boolean setting, click its corresponding **Toggle** button to toggle it from `true` to `false` and vice versa.
   - Otherwise, click its corresponding **Edit** button to edit its value accordingly.

6. Restart the application.

### Default Mail Sorting

This details how to configure Thunderbird's default sorting order and type to something more user-friendly:

1. Update the following settings accordingly:

   - **mailnews.default_news_sort_order**: `2` (descending)
   - **mailnews.default_sort_order**: `2` (descending)
   - **mailnews.default_view_flags**: `0` (unthreaded)

---

## Preferences

### Description

This details how to modify Thunderbird's preferences and some recommended settings.

### Steps

1. Launch the **Thunderbird** application.

2. Head to the **Settings** page by clicking on the **Hamburger** icon in the top right corner and selecting the **Settings** menu item.

3. Scroll through the **Settings** page and locate any settings you wish to change.

4. Make your changes accordingly.

### Stop Showing Start Page

This details how to stop Thunderbird from showing the default start page in the message area:

1. In the **General** tab, under the **Thunderbird Start Page** section, uncheck the **When Thunderbird launches, show the Start Page in the message area** option.
