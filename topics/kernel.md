# Kernel

## Description

The kernel is a computer program at the core of a computer's operating system and generally has complete control over everything in the system. The kernel is also responsible for preventing and mitigating conflicts between different processes.

## Directory

- [Kernel](#kernel)
  - [Description](#description)
  - [Directory](#directory)
  - [References](#references)
  - [Switch to LTS Kernel](#switch-to-lts-kernel)
    - [Description](#description-1)
    - [References](#references-1)
    - [Steps](#steps)

## References

- [Kernel (operating system)](https://en.wikipedia.org/wiki/Kernel_(operating_system))
- [Kernel](https://wiki.archlinux.org/title/Kernel)

---

## Switch to LTS Kernel

### Description

This details how to switch to using the LTS kernels by default.

### References

- [Should I use a LTS kernel? If so, how to change it?](https://forum.endeavouros.com/t/should-i-use-a-lts-kernel-if-so-how-to-change-it/9200/2)

### Steps

1. [Install](yay.md#install) the kernel package, `linux-lts` using `yay`.

2. [Install](yay.md#install) the kernel headers package, `linux-lts-headers` using `yay`.

3. Reboot the system.
