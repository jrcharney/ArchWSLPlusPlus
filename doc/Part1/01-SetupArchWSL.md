:: Part 1: The Windows Part > How to setup ArchLinux for WSL

---

# How to set up ArchLinux for WSL

**Windows Subsystem for Linux** (WSL) is a way to use Linux on Windows without re-partitioning your hard drive or using a Virtual Machine like [Virtual Box](https://www.virtualbox.org/).

You need to install something called [Hyper-V](https://learn.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v) if you want to use Windows Subsystem for Linux (WSL). It can NOT be installed with Window 10 Home, but should work with Windows 11 Home. This will require a reboot.

Right click on the Windows menu and select "Powershell (Administrative)".  If you are using Windows 11, open "Windows Terminal (Administrative)".  We will enable Hyper-V in the command line rather than going through a bunch of other Windows like I had to do.

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

You probably should enable Hyper-V with the Deployment Image Servicing and Management tool (DISM) to help configure windows and Windows images.  This will allow DISM to enable Windows features while the operating system is running.

```powershell
DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V
```

When the installation is completed, reboot and come back here.

From the Microsoft Store App, you should install the [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=en-us&gl=us) application and also [Visual Studio Code](https://apps.microsoft.com/store/detail/visual-studio-code/XP9KHM4BK9FZ7Q?hl=en-us&gl=us). If you have Windows 11, you should already have Windows Terminal.

---
[Up: Index](../00-START_HERE.md) &middot;
[Next: Get a Windows Software Installer](02-GetScoop.md)

