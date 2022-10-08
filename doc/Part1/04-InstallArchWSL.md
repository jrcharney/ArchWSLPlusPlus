:: Part 1: The Windows Part > Install ArchWSL

---

# Install ArchWSL

We need to get ArchWSL from the `extras` bucket.  Before we run WSL for the first time, we need to set it's version to version 2. This will use WSL2, which is recommended. We can view what version our Linux distribution is using later with `wsl -l -v`.

```powershell
wsl --set-version 2
scoop bucket add extras
scoop install archwsl
```

You might have seen a message at the end saying "Even when you are logging in as 'root', some operations (like service command) require Windows administrator privileges". This is nothing to worry about. We're going to do something in a little bit so we don't have to log in as root directly.

> Note: To view what Linux distributions are available, we can use `wsl -l`. To view version information, we can use `wsl -v`. Combining `-l` with `-v`, we can see what version of WSL we are using and what Linux distribution is being used with `wsl -l -v`.

We are now ready to take care of some basic tasks to get Arch Linux up and running.

Start by running the `Arch.exe` program.

```powershell
Arch.exe
```

First lets set our root password with `passwd`, you could use your windows password, but a different password would be more secure.

> NOTE: Bash is set up to show the current username of the user that is logged in, and the machine that you are logged into. This is called the **prompt**. Later we'll do some stuff to make it look pretty. I would recommend giving your computer a name instead of `"Dell-XPS_13-bunch_of_numbers"`.  You can do that in your Windows setting. For now well, call our PC "Crystal". This will show up if we run the command `uname -n`.
> Our prompt in Bash will also use `#` if root (the administrator) is logged in and `$` if a regular user is logged in.

```bash
[root@crystal]# passwd
```

Once you have set up your root password, let's create our regular user and give them permission to use the `sudo` command that temporarily gives them the power to run root command with the `sudo` prefix.

```bash
[root@crystal]# echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel		# This creates the sudoers file
[root@crystal]# useradd -m -G wheel -s /bin/bash jrcharney			# Create a new users. I will set mine for jrcharney
[root@crystal]# passwd jrcharney						# Set the password for the new user
[root@crystal]# exit								# Return to powershell
```

We need to return to the Powershell for a moment to set the default user.

```powershell
Arch.exe config --default-user jrcharney					# Note: Use your username not mine!
```

> Note: If the above command doesn't work, try restarting the `LxssManager` in an Administrative Powershell/Windows Terminal.
> Do this by running these two command: `net stop lxssmanager`  then `net start lxssmanager`
> Contrary to what the [ArchWSL Setup documentation](https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/) says, you can't use `&&` in Powershell. But that's not going to matter once we get this running.
> If that doesn't work, try restarting the computer, but that should only be a last resort.

Once we have our default user, we can launch `Arch` again.  Thanks to how ArchWSL is set up, `Arch` will be a option in our dropdown menu on the Windows Terminal, but we can't set it as the default option. That will still need to be PowerShell because Microsoft.

But that's no big deal, because the next time we start our Linux terminal, you should see something like this as your user prompt.

```bash
[jrcharney@crystal]$
```

Congratulations! You now have LINUX installed on Window! This next part will add all those rad toys to it to make it look awesome and a lot less scary.

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: Get the NerdFonts](03-GetNerdFonts.md) &middot;
[Next: Set up Arch Linux](../Part2/01-SetupArchLinux.md)

