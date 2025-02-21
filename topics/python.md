# Python

## Description

Python is a programming language that lets you work quickly and integrate systems more effectively.

## Directory

- [Python](#python)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Installation](#installation)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)
  - [Pip](#pip)
    - [Description](#description-2)
    - [References](#references-2)
    - [Pip Installation](#pip-installation)
    - [Pip Usage](#pip-usage)
  - [Miniconda Environments](#miniconda-environments)
    - [Description](#description-3)
    - [References](#references-3)
    - [Steps](#steps-1)

## References

- [Python](https://www.python.org)

---

## Installation

### Description

This guide details on how to install both `python`, the programming language, and `pip`, Python's package manager.

### References

- [Python Installation](https://wiki.archlinux.org/title/python#Installation)
- [Pip Installation](https://pip.pypa.io/en/stable/installation)

### Steps

1. [Install](yay.md#install) the `python` package using your package manager (i.e. `yay`).

---

## Pip

> [!IMPORTANT]  
> This section of the guide assumes that you have already [installed](#installation) Python.

### Description

This guide details on how install and use `pip` to perform several operations including installing Python packages.

### References

- [Pip User Guide](https://pip.pypa.io/en/stable/user_guide)

### Pip Installation

1. [Install](yay.md#install) the `pip` package using your package manager (i.e. `yay`).

2. **Alternatively**, you may also install Pip using Python itself:

    ```sh
    python -m ensurepip --upgrade
    ```

### Pip Usage

> [!IMPORTANT]  
> This part of the guide assumes that you have already [installed](#pip-installation) Pip.

> [!NOTE]  
> Replace `<library>` with the actual name of the Python library.

1. To install a Python library:

    ```sh
    pip install <library>
    ```

2. To upgrade a Python library:

    ```sh
    pip install --upgrade <library>
    ```

3. To uninstall a Python library:

    ```sh
    pip uninstall <library>
    ```

4. To search for a Python library:

    ```sh
    pip search <library>
    ```

5. To list all installed Python library:

    ```sh
    pip list
    ```

6. To freeze all installed Python libraries into a `requirements.txt` file:

    ```sh
    pip freeze > requirements.txt
    ```

7. To install all Python libraries listed in a `requirements.txt` file:

    ```sh
    pip install -r requirements.txt
    ```

---

## Miniconda Environments

> [!IMPORTANT]  
> A portion of this guide assumes you are using the [**Fish**](fish.md) shell. If you are using a different shell, make any required adjustments accordingly.

### Description

This guide details on how we could install, setup, and use Conda to create `python` environments of various `python` versions.

### References

- [Installing on Linux](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html)
- [Miniconda - Quick command line install](https://docs.conda.io/projects/miniconda/en/latest/#quick-command-line-install)

### Steps

1. Install Miniconda:

    ```sh
    mkdir -p ~/miniconda3
    curl -Lo ~/miniconda3/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -f ~/miniconda3/miniconda.sh
    ```

2. Add the Miniconda binary to `$PATH` temporarily (on `fish`):

    ```sh
    fish_add_path ~/miniconda3/condabin
    ```

3. Configure Minicondawith the `fish` shell to have Miniconda available in our `$PATH` permanently:

    ```sh
    conda init fish
    ```

    Doing so should add this (with additional minor modification) to our `fish` config (i.e. `~/.config/fish/config.fish`):

    ```fish
    if status is-interactive
      # >>> conda initialize >>>
      # !! Contents within this block are managed by 'conda init' !!
      if test -f ~/miniconda3/bin/conda
        eval ~/miniconda3/bin/conda "shell.fish" "hook" $argv | source
      end
      # <<< conda initialize <<<
    end
    ```

4. Update Conda:

    ```sh
    conda update conda
    ```

5. The default Conda channels might be sufficient, but some packages might be missing (i.e. `python` <3.5).

    To fix this, add the `conda-forge` channel like so:

    ```sh
    conda config --append channels conda-forge
    ```

6. Check channels active/available to our Conda to ensure that `conda-forge` has been added:

    ```sh
    conda config --show channels
    ```

    Sample output:

    ```sh
    channels:
      - defaults
      - conda-forge
    ```

7. To create an environment named, `myenv`, running on `python` version `3.5`:

    ```sh
    conda create --name myenv python=3.5
    ```

8. To activate the environment we created (i.e. `myenv`) and verify that it is running the `python` version we had set:

    ```sh
    conda activate myenv
    python --version
    ```

9. To exit/deactivate the environment we had activated:

    ```sh
    conda deactivate
    ```

10. To delete an environment (i.e. `myenv`) permanently:

    ```sh
    conda env remove --name myenv
    ```

11. To list all available Conda environments on our system:

    ```sh
    conda env list
    ```

    Sample output:

    ```sh
    # conda environments:
    #
    base                  *  /home/myuser/miniconda3
    myenv                    /home/myuser/miniconda3/envs/myenv
    ```

    > [!NOTE]  
    > The `*` indicates the active environment that we are currently in.
