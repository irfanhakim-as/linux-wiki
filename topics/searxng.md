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

1. Launch the **Firefox** application.

2. Head to the **SearXNG instances** page (referenced in this topic) for a list of public SearXNG instances.

3. From the list of instances, determine which instance you wish to use as the default. Once you have made your choice, click on its **URL** to visit it.

4. On the chosen SearXNG instance, click the **Preferences** button.

5. Navigate to the **PRIVACY** tab.

6. Expand the **HTTP Method** dropdown and select `GET`.

    > [!INFO]  
    > Using **GET** requests is recommended to fix `Document Expired` errors when going back to results.

7. Click the **Save** button to save your changes.

8. Add the chosen SearXNG instance to Firefox and set it as the [default search engine](firefox.md#update-default-search-engine).
