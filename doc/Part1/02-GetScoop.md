Part 1: The Windows Part > Get a Windows Installer
---

# Get a Windows Installer

You should install either [Chocolatey](https://chocolatey.org/) or [Scoop](https://scoop.sh/) so you can download some stuff in the command line, especially the [NerdFonts](https://www.nerdfonts.com/) that are required for Powerline, Powerlevel10k, and VS Code.  These fonts have extra characters that can be used in the Windows Terminal.

I recommend Scoop (`scoop`) over Chocolatey (`choco`) because it is better organized. Packages are grouped into "Buckets".

## Installing Scoop

```powershell
Set-ExecutionPolicy ByPass -Scope Process -Force
$env:SCOOP='C:\Applications\Scoop'
$env:SCOOP_GLOBAL='C:\GlobalScoopApps'
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
```

> Note: we can't use `irm get.scoop.sh | iex`, not even in an Administrative PowerShell! (This is why PowerShell sucks!)
>
> If `iex "& {$(irm get.scoop.sh)} -RunAsAdmin"`  doesn't work, try running `irm get.scoop.sh -outfile 'install.ps1' ; .\install.ps1 -RunAsAdmin`. This will create `install.ps1` locally, which you will need to `del install.ps1` later.

We need to set the execution policy to `Bypass`. We could have also used `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` which would have set the execution policy to `RemoteSigned`. You can see what execution policy is used by running `Get-ExecutionPolicy`.

We should get `scoop` to work. Let's update it.

```powershell
scoop update
```

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: How to Set up ArchLinux for WSL](01-SetupArchWSL.md) &middot;
[Next: Get the NerdFonts](03-GetNerdFonts.md)

