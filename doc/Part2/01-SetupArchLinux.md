:: Part 2: The Linux Part > Setup ArchLinux

---

# Setup ArchLinux

If this were actually Arch Linux, we could have used a script called `arch_install` to knock out some of this stuff. Since we don't have it, we got to do it manually.

Here's just the quick summary of everything I ran to get mine set up.  The first few packages we install will be the ArchLinux keyring, the base development tools, Git, another package manager called `yay` that will let us use the ArchLinux User Repo (AUR), and short list of other cool stuff.

> Note: I'm not going to write the prompt anymore. Almost everything will be done as your default user, even the `sudo` commands.

```bash
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Syu
sudo pacman -S archlinux-keyring                                            # Note: ArchWSL says this is optional, but THIS PACKAGE IS MANDATORY! It should be the first one installed.
sudo pacman -S --needed base-devel git                                      # When you install the `base-devel` package for ArchWSL, `fakeroot` and `fakeroot-tcp` are in conflict. When asked if you want to replace `fakeroot-tcp` with `fakeroot` SAY NO!
mkdir Projects Downloads Documents Sandbox Music Pictures Videos            # Just some placeholder directories. I should really make them soft-links to their Windows counterpart later.
mkdir bin                                                                   # Add this directory. It should be added to your `$PATH`. You can use this directory to launch scripts that you write to do tasks
cd Downloads                                                                # Switch to the Downloads directory
git clone https://aur.archlinux.org/yay.git                                 # This will install `yay` which will allow you access to the ArchLinux User Repository.
cd yay                                                                      # Go to the yay directory (This should be in the Downloads directory)
makepkg -si                                                                 # Make the `yay` package, this will also install the Go Language (`golang`) that `yay` needs to do stuff.
yay --version                                                               # Verify that yay was installed.
rm -rf ~/yay                                                                # With yay successfully installed, you may remove the `yay` folder in your home directory. (This is optional)
cd ~
sudo pacman -S openssh github-cli pv fzf clang llvm rust python-pip lm_sensors psutils python-psutil neofetch htop bashtop imagemagick jq
```

In case you were wondering, here's just a short summary of all those items that we used to install with `pacman`

| Package | What applications does it provide/What does it do? |
|-----------------------|--------------------------------------|
| `archlinux-keyring`   | Necessary to install ANY package from the Arch Linux repository. This one MUST be installed FIRST because IT IS MANDATORY! |
| `--needed`            | Not really a package, but tells `pacman` to install all the necessary applications. (I should probably list what they are later.) |
| `base-devel`          | Install the base development applications. |
| `git`                 | Installs `git`, used for managing software projects. |
| `openssh`             | Installs OpenSSH so we can use SSH. |
| `github-cli`          | Install this to use the `gh` command with any project that is on Github.com (Note: there's a similar application for gitlab, but we can install that later.) |
| `pv`                  | Installs the "pipe viewer" which allows you to see the progress of process. Some apps use this. |
| `fzf`                 | Fuzzy Finder |
| `clang`               | Clang |
| `llvm`                | LLVM  |
| `rust`                | Rust  |
| `python-pip`          | Installs the `pip` program that is used to install Python packages. |
| `lm_sensors`          | This software is used to detect hardware sensors. While it might not be as good in WSL, it does still do some things. |
| `psutils`             | Process Utilities. Named after the `ps` application. |
| `python-psutils`      | Process Utilities written in Python. |
| `neofetch`            | Installs the `neofetch` program which provides a summary of your system. Useful if you are filing bug reports. |
| `htop`                | The `htop` program is basically like the Windows Task Manager. Because of its user-friendly interface, it is a must-have. |
| `bashtop`             | The `bashtop` program is like `htop` but prettier and more useful in terminals with 256 colors or more. (Which we will be setting up.) |
| `imagemagick`         | The ImageMagick program is a set of command-line programs that can manipulate images.  Typically, these commands are modified by other programs. |
| `jq`                  | `jq` is like `sed` or `awk` but for JSON files.  (Note: There's also a `hq` and a `yq`, but I haven't tried those.) |

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: Install ArchWSL](../Part1/04-InstallArchWSL.md) &middot;
[Next: A Trip to the Toy Box](02-ToysAndTools.md)
