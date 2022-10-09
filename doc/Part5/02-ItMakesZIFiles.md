:: Part 5 Help and Troubleshooting > What to do with `:Zone.Identifier` Files

---

# What to do with `:Zone.Identifier` Files

A `:Zone.Identifier` file is supposed to be this file that creates metadata about a file you moved between operating systems.  Nevermind that WSL is still Windows and that Linux is being emulated on it.  Never the less they are annoying.

## Why are they generated?

Microsoft got this bonkers idea to create a file whenever you moved or copied a file from your Windows file system into the Linux folder.  What's more, there a colon in the file name (although it might look like a middle dot on Windows File Explorer.)  That text is an identifier for an "Alternate Data Stream" or ADS.  ADS is used to store meta-information about the file.  According to an answer on Stack Overflow, [the `Zone.Identifier` stores whether the file was downloaded from the internet](https://stackoverflow.com/questions/4496697/what-are-zone-identifier-files-and-how-do-i-prevent-them-from-being-created). Frankly, that's not of any value or anyone's business where it came from.

Another problem with having `:Zone.Identifier` files is that colon in the file name is not a valid character and can break some automated workflow software and scripts that process files. So they must be removed!

## How do we stop them from being generated?

It's unclear how to turn off such a feature, especially since the file you are adding to a folder that is used in WSL isn't be transfered from one machine to another and more than likely isn't on a separate drive or partition.  But there is a silver lining in this annoyance.

## A legitmiate use case for having a `.gitignore` file

> "When life gives you lemons, don't make lemonade. Make life take the lemons back! Get mad! I don't want your damn lemons, what the hell am I supposed to do with these? Demand to see life's manager! Make life rue the day it thought it could give Cave Johnson lemons! Do you know who I am? I'm the man who's gonna burn your house down! With the lemons! I'm gonna get my engineers to invent a combustible lemon that burns your house down!"
> --Cave Johnson, *Portal 2* (2011)

Honestly, I never liked the addage about Life, Lemons, and Lemonade. Especially since we didn't want these file.

On the plus side with these annoying `:Zone.Identifer` files, it does present a legitimate use case for creating a `.gitignore` file.

Wile I did talk about using a program called `git-ignore` that would let you automate using the `git ignore` command to generate `.gitignore` file in [Git and Github](../Part3/GitAndGithub.md), generating a `.gitignore` file to ignore `:ZoneIdentifier` files doesn't appear to be one of the pre configured options.

To fix that, you should add these two lines to your `.gitignore` file.

```
# Ignore those Zone.Identifier files that are generated when dragging a Windows file into a Linux folder.
**/*Zone.Identifier
```

Or if you don't mind not having a comment line, you can simply use this one-liner and add it to your `.gitignore `file.

```bash
echo '**/*Zone.Identifer' >> .gitignore
```

> TODO: Create a more elegant one-liner to add to `~/.bash_aliases`

## Delete them

No doubt you should delete these file. They don't really have a purpose except to take up space and make managing your files in a Git repo a janky mess.

If they are in one folder, you can simply do an `rm` on them.

```bash
rm -rf **/*Zone.Identifier
```

But using `rm -rf` does make some folks queazy, especially since it looks like `rm -rf /` (which should never be run). Not to metion, what if you dragged and drop a folder with folders in that that have files in them?

```bash
find . -name "*:Zone.Identifier" -type f -delete
```

> TODO: Add an alias for the above command too.

---
[Up: Index](../00-START_HERE.md)

