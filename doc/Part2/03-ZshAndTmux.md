:: Part 2: The Linux Part > Zsh and Tmux

---

# Zsh and Tmux

In the previous chapter, we added some programs that made things a little more fun.

In this chapter, we will add things that will enhance our experience.

We will install the Z-shell (Zsh) as a better alternative to bash.
We will install Oh-My-Zsh to add some plugins and aesthetic features that will make using Zsh for functional and aesthetically pleasing with Powerlevel10K.
We will install Tmux to add features that allow us to use more than one program at the same time.
We will add Powerline to tmux for more aesthetic features and functionality.
We will add command line file explorers to browse around our file system. (These might be useful later.)

## Zsh 

```bash
sudo pacman -S zsh															# Install Zsh
zsh --version																# Show the version of Zsh. (We're still in Bash, but that will change shortly.)
chsh -l																		# Show a list of shells we can change to.  (You can also see this in `/etc/shells`)
```

OK, we should be ready to do everything in Zsh from now on.

A few things to note
- You'll be asked some questions when you launch Zsh the first time when you run Oh-My-Zsh. I forget what I said, most of these aesthetic. There's probably a tutorial about it on YouTube.
- You may be asked some questions to get Powerlevel10K working (at least for Oh-My-Zsh), if not, run `p10k`.
- If things don't have color when you run `pacman -Ss`, go into the `/etc/pacman.conf` file and uncomment the line that says `Color`.  Visually, this helps out tremendously.
- We could have changed the shell to Zsh using `chsh -s $(which zsh)`, but there was a problem getting that done. Fortunately we can do this with Oh-My-Zsh

```bash
sh -c "$(curl -fsSL http://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 	# Install Oh-My-Zsh.  (I should have used `yay -S oh-my-zsh-git` but this works just as well.)  (If it asks if you want to change the default shell to Zsh, say yes!)
yay -S --noconfirm zsh-theme-powerlevel10k-git											# Install the powerlevel10k them for zsh.
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc	# Use the Powerlevel10K theme in Zsh. (You could use it in Bash too, but I'm not going to do that.)
exec zsh																				# Restart zsh
p10k configure																			# Configure the Powerlevel10k prompt.
sudo pacman -S powerline																# Install powerline. The command to enable it for tmux should be in `~/.tmux.conf`.
```

### Zsh Plugins

Earlier versions of this post suggested that I install the packages needed to activate some of `zsh`'s features, however, you should **NOT** install those packages, especially if you installed `oh-my-zsh` from source like I did.
The only way to get `zsh-autosuggestions` or `zsh-syntax-highlighting` is to install them from source.

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

In `.zshrc`, go to the `plugins` line, that likely has the `git` plugin set up and add `zsh-autosuggestions` and `zsh-syntax-highlighting` to the list.

In fact, I do have a few suggestions for what to put into the plugins line.

```bash
plugins=(git gh fzf node npm python rust ruby zsh-autosuggestions zsh-syntax-highlighting)
```

There are a few plugins I have not added yet but these are some basic one.  More may be added later.  You may have noticed we didn't install `node` or `npm` yet.  We will definitely do that in this next part.

At this time, I would hold off on adding `zsh-completions` or `zsh-history-substring-search`. These two features aren't as ready as they say they are.

You will need to restart `zsh` to activate these features, either with `exec zsh` or just closing any open terminals and reopening them.

> **What about `oh-my-posh`?**
> [Oh My Posh](https://ohmyposh.dev/) was inspired by Powerlevel10K and Oh-My-Zsh. As the name would imply, it was designed to make Powershell look much like a Powerlevel10k/Oh-My-Zsh set up, but it eventually it became usable on Linux as well as Windows.  Oh-My-Posh has commands that will install things like Nerdfonts if you forgot them and has a nice set of themes, though the default, `jandedobbeleer`, is pretty good.  The only thing that would make Oh-My-Posh worthy of replacing Oh-My-Zsh is it had automatic updates like Oh-My-Zsh and had an interactive program like Powerlevel10K's `p10k` to answer some questions as to what theme you want to use, if the Nerdfonts are set correctly, and what format you want to use. (Single line, concise, and lots of icons FTW.) It would also be cool if if gave you the option to pick what shell you want to use, especially since Oh-My-Posh is designed to work with this new shell called [Nushell](https://www.nushell.sh/), but doesn't make use of any of the Vim DevIcon glyphs that [`colorls`](https://github.com/athityakumar/colorls) or [`lsd`](https://github.com/Peltoche/lsd) use.  Also, if you install Oh-My-Posh from `yay`, all the themes will be installed in the `/usr/share/oh-my-posh/themes/` directory, where all the `.omp.json` files are inaccessable and have no permissions set. (I had to make a copy of the `/usr/share/oh-my-posh/themes/` directory in a folder called `~/.cache/oh-my-posh/theme/`, change the ownership for user and group, and modifiy the permissions just to get it to work right.  So setup isn't that great, but hopefully that will change in the future.

## Tmux

**Tmux** is the *t*erminal *mu*ltiple*x*er.  It has featueres that are useful if your terminal goes down if you are connected to.  I have a pretty standard `~/.tmux.conf` file in the dot files directory.

You can also split the window, use multiple desktop, and run more than one program.  So it's a must have!

Whey you enter `tmux` for the first time, you need to run `CTRL+B SHIFT+I` to load download and load the [TMUX Plugin Manager](https://github.com/tmux-plugins/tpm). 

I added a line to get Powerline working for Tmux.  There is a similar plugin for Vim or Neovim, but we won't go over that here.

```bash
sudo pacman -S tmux																		# Install the terminal multiplexer. (We'll have some basic stuff set up in `~/.tmux.conf`)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm						# Install the TMUX plugin manager.
```

> **What about `Zellij`?**
> [Zellij](https://zellij.dev/) is another teminal multiplexer that is similar to `tmux`, but `zellij` is to `tmux` what `nano` is to `vim`. It features onscreen guidance, but at the expense of screen space. Still, if you'd like to use that, there is no harm in giving it a try.
> You can find it in the pacman repo: `sudo pacman -S zellij`

## File Explorers (optional)

> This section is still under construction. In fact, you should probably skip it for now.

There are a couple of file explorers that are worth mentioning:

- [**Midnight Commander**](https://midnight-commander.org/) (`mc`) is a "side-by-side" file explorer based on a program called Norton Commander. If you've ever used [WinSCP](https://winscp.net/) to do file transfers, Midnight Commander functions with a similar interface in the command line.  This tool will defintely be useful later when we learn how to use [SSH](../Part3/02-SSH) and use a feature called Secure Copy (`scp`) as this program can be used as a user-interface to transfer file.
- [**Ranger**](https://ranger.github.io/) (`ranger`) is a colorful file explorer written in Python that uses the `vim` keys ("h,j,k,l") or arrow keys to browse around a file system.  With the [`ueberzug`](https://github.com/seebye/ueberzug) library, you can view images in the command line.  However, this will not work if `tmux` has a split window view.

```bash
sudo pacman -S mc ranger		# A couple of command-line file explorers. Try them out.
sudo pacman -S ueberzug			# View images in Ranger. More than likely, animated GIFs won't work. Also, it won't work if tmux is using a split window. Still workth installing.
sudo pacman -S atool			# Add this for previews in archive files.
sudo pacman -S highlight		# Enable code syntax highlighting when viewing source code files.
sudo pacman -S mediainfo		# View other information about media files.
sudo pacman -S poppler			# For PDF file previews
sudo pacman -S libcaca			# For ASCII-art image previews.
sudo pacman -S python-chardet		# In case of encoding dection problems.
sudo pacman -S perl-image-exiftool	# Show image EXIF information. This might be installed already if you installed imagemagick
sudo pacman -S w3m			# Provide previews of HTML and Images
sudo pacman -S ffmpegthumbnailer	# Designed for previewing videos, but should work for images too.
```

> Note: I moved `ffmpegthumbnailer` down the list because you will be asked if you want to install `jack2` or `pipewire-jack`.  While `pipewire-jack` is defintely the future of the JACK API especially with `pipewire` slowly taking over audio stuff on Arch Linux (where it is now the default), picking the default option of `jack2` is still idea.  If there's any problems, uninstall `ffmpegthumbnailer` and `jack2` then try reinstalling `ffmpegthumbnailer` with `pipewire-jack`.

We need to make compies of the `ranger` config files if we want to enable some features in `ranger`.

> Hmm... Apparently nothing seems to get this hack going on Windows Terminal at the moment. I'm just going to table it for now.

### Honorable Mention: `sixel`

While trying to get that to work, I did stumble upon something else that was interesting: [**Sixel**](https://en.wikipedia.org/wiki/Sixel).

Sixel was initially develoed by Digital Equipment Corporation (DEC), which was bought by Compaq in June 1998. Compaq was bought up by Hewlett-Packard (HP) in 2002. Before all that, DEC had developed Sixel for their VT200 series and VT320 computer terminals to send bitmap graphics to DEC dot matrix printers.  When the printer would be put into "sixel mode", the data would be interpreted to directly control six of the pins in the nine-pin print head.  A string of sixel characters encoded a single *six pixel* hight row of the image. Thus the name "sixel" comes from "six pixel".

Hacker and Demoscene culture was interested in using this to create computer art with ASCII/ANSI character data. 

Like with my attempt to get `ranger` to show images, [`sixel` also can't render images in the terminal yet](https://github.com/microsoft/terminal/issues/448) either, but [there is a lot of interest in it](https://github.com/microsoft/terminal/issues/5746).

I'll defintely want to develop this section later and add some links about it.

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: A Trip to the Toy Box](02-ToysAndTools.md) &middot;
[Next: Taskwarrior](04-Taskwarrior.md)

