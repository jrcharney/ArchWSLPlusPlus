# What is all this stuff?

I added this file manifest to let you know what each file is and where to put it.  I recommend you **DON'T** move these file to where they usually are, but use them as guide as to what to put in to those file.

You should really follow the instructions in the `doc` directory.

- `~/.bashrc` - The Bash resource file.  This version includes sourcing to the `~/.bash_aliases` file.
- `~/.bash_aliases` - The Bash aliases file. This file contains single-line user-defined shortcut.  It is recommended that you use a file called `~/.ssh_aliases` to store your SSH connections. This file contains a line that will soruce that file if you create it.
- `~/.tmux.conf` = The Tmux configuration file. This file includes typical plugins for saving and restoring sessions, using Zsh as the default shell, a colorful terminal profile, and the required lines to use Powerline in Tmux.
- `~/.zshrc` - The Z-Shell (Zsh) resource file. This file is configures to support several well liked Zsh features that make it a better shell than Bash.

## Where's the beef?!

Does it seem like files are missing in this directory?
Did you type `ls` in this folder without the `-a` option?
Did you forget that files that start with a dot (`.`) are hidden?

Try again using `ls -a`.

