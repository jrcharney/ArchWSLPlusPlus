:: Part 1: The Windows Part > Get the NerdFonts

---

# Get the NerdFonts

Because the entire set of NerdFonts is about a couple of gigabytes, you should just get the essential fonts.

I recommend installing these fonts from NerdFonts.
- Meslo
- FiraCode
- FiraMono
- Hack

We first need to add the `nerd-fonts` bucket.

```powershell
scoop bucket add nerd-fonts
```

Next install the font packages

```powershell
scoop install Meslo-NF Meslo-NF-Mono Hack-NF Hack-NF-Mono FiraCode-NF FiraCode-NF-Mono FiraMono-NF FiraMono-NF-Mono
```

You should be able to set your Windows terminal to use one of the fonts we installed by going to the settings.  A lot of folks are recommending using Meslo.

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: Get a Windows Software Installer](02-GetScoop.md) &middot;
[Next: Install ArchWSL](04-InstallArchWSL.md)

