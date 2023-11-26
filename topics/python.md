# Python

## Description

Python is a programming language that lets you work quickly and integrate systems more effectively.

## Directory

- [Python](#python)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Miniconda Environments](#miniconda-environments)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [Python](https://www.python.org)

---

## Miniconda Environments

### Description

This guide details on how we could install, setup, and use Conda to create `python` environments of various `python` versions.

> [!NOTE]  
> Parts of this guide assumes that you are using the `fish` shell.

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
