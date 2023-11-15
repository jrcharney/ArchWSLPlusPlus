:: Only Part: How to set-up ArchWSL Desktop environment

---

# How to Set Up ArchWSL as Desktop Environment

![Initial Desktop Environment](../screenshots/Desktop-Environment.png)

Install X-Org, X-Org-Server and XFCE4.
```powershell
sudo pacman -S xorg xorg-server
sudo pacman -S xfce4
```

Next, Install VcXsrv.

```
https://sourceforge.net/projects/vcxsrv/
```

A new application called "X-Launch" should have installed after installing VcXsrv.

After VcXrv, X-Org, X-Org-Server and XFCE4 have been installed, export required variables.
```powershell
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):2.0
export LIBGL_ALWAYS_INDIRECT=1
``` 

Open X-launch, and choose "Large window" (or full-screen, up to you). On the display number, remove -1 and replace It with 2. Check `Disable access control`, then hit `Next` and `Finish`.

You should see a black-screen. Back on your ArchWSL, type this final command to see your desktop.
```powershell 
sudo startxfce4
```

## Black Screen Desktop
Close and re-launch X-Launch, make sure the display number is set to 2.

## Credits
[u/Fit-Guess2546](r/bashonubuntuonwindows/)
