:: Part 2: The Linux Part > Zsh and Tmux

---

# Zsh and Tmux

In the previous chapter, we added some programs that made things a little more fun.

In this chapter, we will add things that will enhance our experience.

We will install the Z-shell (Zsh) as a better alternative to bash.
We will install Oh-My-Zsh to add some plugins and aesthetic features that will make using Zsh for functional and aesthetically pleasing with Powerlevel10K.
We will install Tmux to add features that allow us to use more than one program at the same time.
We will add Powerline to tmux for more aesthetic features and functionality.

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

## Tmux

**Tmux** is the *t*erminal *mu*ltiple*x*er.  It has featueres that are useful if your terminal goes down if you are connected to.  I have a pretty standard `~/.tmux.conf` file in the dot files directory.

You can also split the window, use multiple desktop, and run more than one program.  So it's a must have!

Whey you enter `tmux` for the first time, you need to run `CTRL+B SHIFT+I` to load download and load the [TMUX Plugin Manager](https://github.com/tmux-plugins/tpm). 

I added a line to get Powerline working for Tmux.  There is a similar plugin for Vim or Neovim, but we won't go over that here.

```bash
sudo pacman -S tmux																		# Install the terminal multiplexer. (We'll have some basic stuff set up in `~/.tmux.conf`)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm						# Install the TMUX plugin manager.
```

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: A Trip to the Toy Box](02-ToysAndTools.md) &middot;
[Next: Taskwarrior](04-Taskwarrior.md)

