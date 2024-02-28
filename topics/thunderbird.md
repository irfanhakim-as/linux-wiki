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

## References

- [Thunderbird](https://www.thunderbird.net)

---

## Configuration

### Description

This details how to configure Thunderbird including its default sort order and sort type.

### References

- [Change the default sorting order in Thunderbird](https://superuser.com/questions/13518/change-the-default-sorting-order-in-thunderbird)

### Steps

1. Launch the **Thunderbird** application.

2. Head to Settings by clicking on the **Hamburger** icon in the top right corner and selecting **Settings**.

3. In the **General** page, under the **Thunderbird Start Page** section, uncheck the **When Thunderbird launches, Show the Start Page in the message area** option.

4. Open the Config Editor under **Settings** > **Config Editor**.

5. Search for `mailnews.default`.

6. Update the following configurations and set the default sort order to `descending (2)` and view to `unthreaded (0)`:

    ```
    mailnews.default_news_sort_order            2
    mailnews.default_sort_order                 2
    mailnews.default_view_flags                 0
    ```
