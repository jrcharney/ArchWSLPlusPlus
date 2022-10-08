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
sudo pacman -S archlinux-keyring 											# Note: ArchWSL says this is optional, but THIS PACKAGE IS MANDITORY! It should be the first one installed.
sudo pacman -S --needed base-devel git										# When you install the `base-devel` package for ArchWSL, `fakeroot` and `fakeroot-tcp` are in conflict. When asked if you want to replace `fakeroot-tcp` with `fakeroot` SAY NO!
sudo git clone https://aur.archlinux.org/yay.git							# This will install `yay` which will allow you access to the ArchLinux User Repository.
cd yay																		# Go to the yay directory  (TODO: Could I have put this in a Downloads directory?)
makepkg -si																	# Make the `yay` package, this will also install the Go Language (`golang`) that `yay` needs to do stuff.
sudo pacman -S openssh														# Install OpenSSH so we can use SSH.
sudo pacman -S github-cli													# Install this so we can use `gh` to do github command. (TODO: Is there something similar for gitlab?)
sudo pacman -S fzf clang llvm rust											# Some important tools I'll talk about them later.
sudo pacman -S python-pip													# Python needs pip to install some packages
sudo pacman -S lm_sensors psutils python-psutil neofetch bashtop htop		# Install these to show system information and to manage processes in a more user-friendly way
sudo pacman -S imagemagick													# Manipulate images from the command line. You probably won't use it a whole lot, but there's some cool stuff that is important
sudo pacman -S jq															# Command-line JSON processor. This will be useful later. (There's also `hq` and `yq`, but I haven't tried those yet.)
mkdir bin																	# Add this directory. It should be added to your `$PATH`. You can use this directory to launch scripts that you write to do tasks
mkdir Projects Downloads Documents Sandbox Music Pictures Videos			# Just some placeholder directories. I should really make them softlinks to their Windows counterpart later.
```

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: Install ArchWSL](../Part1/04-InstallArchWSL.md) &middot;
[Next: A Trip to the Toy Box](02-ToysAndTools.md)

