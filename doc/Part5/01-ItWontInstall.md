Part 5 Help and Troubleshooting > Troubleshooting packages that fail to retrieve
---

# Troubleshooting packages that fail to retrieve

(a.k.a. What to do when things won't install like they should.)

While I was trying to install `npm` with `pacman`, one of the dependecies wouldn't download.

```
error: failed retrieving file 'semver-7.3.7-1-any.pkg.tar.zst' from mirrors.kernel.org : The requested URL returned error: 404 
warning: failed to retrieve some files
error: failed to commit transaction (unexpected error)
Errors occurred, no packages were upgraded.  
```

It turns out that means you probably need to update your software repository database.  You can do this by using `-Syu` in `pacman`

```bash
sudo pacman -Syu npm
```

---
[Up: Index](../00-START_HERE.md)

