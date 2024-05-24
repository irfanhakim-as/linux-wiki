# SearXNG

## Description

SearXNG is a free internet metasearch engine which aggregates results from various search services and databases. Users are neither tracked nor profiled.

## Directory

- [SearXNG](#searxng)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Set as Default Engine on Firefox](#set-as-default-engine-on-firefox)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [searxng](https://github.com/searxng/searxng)

---

## Set as Default Engine on Firefox

### Description

This details how to set SearXNG as the default search engine on Firefox.

### References

- [SearXNG instances](https://searx.space)
- [Document Expired sometimes when going back to results](https://redlib.pussthecat.org/r/Searx/comments/11n0kcx/document_expired_sometimes_when_going_back_to)

### Steps

1. Head to the [referenced](#references-1) **SearXNG instances** page for a list of public SearXNG instances.

2. From the list of instances, determine which instance you wish to use as the default. Once you have made your choice, click on its **URL** to visit it.

3. On the chosen instance's page, click the **Preferences** button.

4. Navigate to the **PRIVACY** tab.

5. Expand the **HTTP Method** dropdown and select `GET`.

    > [!INFO]  
    > Using **GET** requests is recommended to fix `Document Expired` errors when going back to results.

6. Click the **Save** button to save your changes.

7. Back on the instance's page, right click the address bar and select the **Add "SearXNG"** context menu option.

    > [!TIP]  
    > In this or any of the following steps, the **SearXNG** name may be different depending on the name of the instance.

8. Navigate to Firefox's **Settings** page by pressing <kbd>Ctrl + ,</kbd> on a PC or <kbd>Cmd + ,</kbd> on a Mac.

9. Type in `Search Engine` in the Settings' **Find in Settings** search bar.

10. Expand the **Default Search Engine** dropdown and select **SearXNG**.

11. Optionally, in the **Search Shortcuts** section, select and add a **Keyword** to the **SearXNG** search engine such as `@searxng` to make it easier to search with SearXNG explicitly if it isn't set as default.
