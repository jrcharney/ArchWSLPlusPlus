:: Part 2: The Linux Part > A Trip to the Toy Box

---

# A Trip to the Toy Box

The terminal is such a stuffy place for a lot of folks.  It seems like without some colorful or visually dazzling feature, there is just no point of using a Linux shell over an already dreadful Powershell, right?  **WRONG!**

In addition to adding some inspirational and encouraging "toys", some of this software is a great way to install some software.  `lolcat` is the perfect example of this.  This program will turn all your text into rainbow colors. As silly as that seems, it is a great way to install the [Ruby programming language](https://www.ruby-lang.org/).

Ruby might not be as popular as Python, but it's a pretty good programming language if you want to try out scripting, functional programming, and object oriented programming.  Let's not forget how it brought about the [Ruby on Rails](https://rubyonrails.org/) framework or how Redis works with Ruby and [has a Github repo to using Redis with Ruby](https://github.com/redis/redis-rb).  This is going to be important later if you need to use Gitlab or need a [NoSQL](https://en.wikipedia.org/wiki/NoSQL) database. 

A couple of other pieces of software are `bat` and `lsd`.  `bat` is like `cat` but has line numbering and syntax highlighting. `lsd` (no relation to the psychadellic drug) is "`ls` deluxe", offering icons that use Nerdfonts, colors to visual identify things better. We will replace the standard `ls` command with `lsd` in our `~/.bash_aliases` file.  `bat` and `cat` are written in [Rust](https://www.rust-lang.org/).

```bash
sudo pacman -S lolcat ripgrep bat bat-extras lsd cowsay ponysay cmatrix nyancat doge fortune-mod figlet
yay -S figlet-fonts figlet-fonts-extra pipes.sh boxes asciiquarium-transparent-git
curl wttr.in                # A great way to check your internet connect, your geo-location, and the weather. (This will also let us know if curl is installed.)
```

There's other stuff that is likely more exciting, but I just wanted to show off what works in the console.

| Package | What applications does it provide/What does it do? |
|-----------------------|--------------------------------------|
| `lolcat` | Provides the `lolcat` (colorful cat) application.  Installing this package will also allow us to install the Ruby programming language that it depends on. |
| `bat` | `bat` is like `cat` but way better. You can scroll through files, see line numbers, and do stuff that would generally require you to tack on a `less` command if you were using `cat`. Written in Rust. |
| `ripgrep` | A version of `grep` written in Rust that programs like `bat` can use. |
| `bat-extras` | Extra features for `bat` |
| `lsd` | Not related to lysergic acid diethylamide. This `lsd` makes the `ls` command look way better. (I added commands to the `~/.bash_aliases` file so we can use it.)  There's another program called `colorls` that is similar to `lsd`, but it's not as good. |
| `cmatrix` | Just a text screen saver, great for making people think you are "Hacking the Matrix". Always impressive. (Note: There's another application that includes more glyphs to make it look more Matrix-like.) |
| `fortune-mod` | Unix Fortunes (Note: There are other packages that add other kinds of fortunes. You can add those later if you want.) |
| `nyancat` | Display the [Nyan Cat](https://www.nyan.cat/)! (Meow!) |
| `doge` | Much Shiba! Very Inu! |
| `figlet`  | `figlet` is used to create ASCII banners with one of its ASCII fonts. (Note: these are not the same as the fonts (typefaces) we typically use. We'll install those later.) |
| `figlet-fonts` | Adds font files that figlet can use. You can see a list of them at [figlet.org/fontdb.cgi](http://www.figlet.org/fontdb.cgi) |
| `figlet-fonts-extra` | More figlet fonts. |
| `cowsay`  | Have an ASCII cow say something with a word bubble. There's also `cowthink` for thought bubbles. (Note: does not generate text output. Though it is possible to add a program that does that for accessibility.) |
| `ponysay` | It's like `cowsay`, *only 20% cooler*. See [this list](https://mlp.fandom.com/wiki/List_of_ponies) for a list of Ponies. (Note: Not all of them will be in this program but it is amusing somebody wrote this program.) |
| `pipes.sh` | An application that provides `pipes.sh` because "The Internet is a Series of Tubes". |
| `boxes` | ASCII Boxes, see https://boxes.thomasjensen.com/ for details. Create's fancy ASCII borders. If you use `figlet` for big text, `boxes` is complementary to that, along with `lolcat` for rainbow colors. |
| `asciiquarium-transparent-git` | An ascii screensaver written in PERL that turns your terminal into a fish aquarium. This version allows the background to be transparent if you have a transparent terminal. |

> Wish List: Find some games that can be played in the terminal.

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: Setup ArchLinux](01-SetupArchLinux.md) &middot;
[Next: Zsh and Tmux](03-ZshAndTmux.md)
