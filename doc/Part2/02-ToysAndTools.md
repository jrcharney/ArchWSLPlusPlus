:: Part 2: The Linux Part > A Trip to the Toy Box

---

# A Trip to the Toy Box

The terminal is such a stuffy place for a lot of folks.  It seems like without some colorful or visually dazzling feature, there is just no point of using a Linux shell over an already dreadful Powershell, right?  **WRONG!**

In addition to adding some inspirational and encouraging "toys", some of this software is a great way to install some software.  `lolcat` is the perfect example of this.  This program will turn all your text into rainbow colors. As silly as that seems, it is a great way to install the [Ruby programming language](https://www.ruby-lang.org/).

Ruby might not be as popular as Python, but it's a pretty good programming language if you want to try out scripting, functional programming, and object oriented programming.  Let's not forget how it brought about the [Ruby on Rails](https://rubyonrails.org/) framework or how Redis works with Ruby and [has a Github repo to using Redis with Ruby](https://github.com/redis/redis-rb).  This is going to be important later if you need to use Gitlab or need a [NoSQL](https://en.wikipedia.org/wiki/NoSQL) database. 

A couple of other pieces of software are `bat` and `lsd`.  `bat` is like `cat` but has line numbering and syntax highlighting. `lsd` (no relation to the psychadellic drug) is "`ls` deluxe", offering icons that use Nerdfonts, colors to visual identify things better. We will replace the standard `ls` command with `lsd` in our `~/.bash_aliases` file.  `bat` and `cat` are written in [Rust](https://www.rust-lang.org/).

```bash
sudo pacman -S lolcat														# Install `lolcat` (colorful cat), this will also install the Ruby programming language that it depends on.
sudo pacman -S bat bat-extras												# `bat` is like `cat`, but it looks better.
sudo pacman -S lsd															# Use lsd (not that LSD! This one make the ls command look cool.) (I added commands to ~/.bash_aliases to use it.)
sudo pacman -S figlet cowsay fortune-mod cmatrix nyancat					# Command line toys, some of them are important that they install some depedencies you'll want to have around.
sudo pacman -S ponysay														# It's like cowsay, only 20% cooler.
yay -S bash-pipes															# One more toy (`pipes.sh`), because the Internet is a Series of Tubes. (Note You can't use `sudo` with `yay` upfront. Yay will ask you for your sudo password later.)
yay -S boxes-git 															# ASCII Boxes, see https://boxes.thomasjensen.com/ for details.
yay -S asciiquarium-transparent-git											# ASCII Fish Aquarium written in Perl. This version supports terminals with transparent backgrounds.
curl wttr.in																# Check to see if we have curl installed by checking the weather!
```

There's other stuff that is likely more exciting, but I just wanted to show off what works in the console.

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: Setup ArchLinux](01-SetupArchLinux.md) &middot;
[Next: Zsh and Tmux](03-ZshAndTmux.md)

