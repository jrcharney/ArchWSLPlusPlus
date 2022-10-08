# Frequently Asked Questions

## Why did you make this?

Ever start out with a new environment and have to start over from scratch all the time? This should fix that.

## Does this install Linux?

Kind of...what it does is *streamline the process* of installing Microsoft's Windows Subsystem for Linux (WSL).  Typically, WSL is installed with Ubuntu Linux, a Debian-based Linux distribution that has a history of its software repository of being well behind most other Linux distributions.

Even the Valve Corporation decided to switch their SteamOS operating system for their Steam Deck from being Ubuntu-based to Arch-based because publishing packages with Ubuntu is lethargic at times.  If you need to push an update, especially if it is a security update, you don't wait several months to add it to your Linux distribution.

Arch Linux is a little bit more "bleeding edge" than most Linux distributions, and a lot of software that doesn't compy with the GPL software license doesn't get mixed in with the regular software. While the ArchLinux User Repository (AUR) is where a lot of that non-complinat GPL stuff goes, it is also were new software pops up.

## Does this install Wayland or X11?

No.  It could, but how I have this set up, everything should just be running in the Windows Terminal.

## Can I use this with Window 11?

YES! WSL is fully supported in Windows 11.

## Can I use this with Windows 10?

Window 10 Pro will support WSL, but Windows 10 Home will not.

## Can I use this with Window 8 or older?

No.

## Why isn't all this stuff standard in Linux?

I don't know. Probably to encourage people to figure it out themselves.

There's a meme that shows up on the Anniversary of Linux every year wishing Linux a happy anniversary, but its a picture of all the ingrediants to make the cake with.  The joke is, you are supposed to "make" the cake.

This repository is more like cake mix.  It's a lot easier to make a cake that way, but it works.

These aesthetic and functional changes should make using Linux on Windows more fun and more functional.

## Why is there no `.vimrc` or `init.lua` yet?

It coming. Soon.  This is a work in progress.

## Why ArchWSL++ over MINGW64 or Git Bash?

MINGW64 IS REALLY OLD. Like Windows 98 old.  While MINGW was a great way to get into open-source software in a Windows World, I was using MINGW back in the early 2000s!  It kinda makes me feel old and question what I've been doing for the last 20 years.  But I digress.

In fact, MINGW's website is gone! It was replaced with the MINGW64 website (which took forever to get to to migrate to 64-bit architecture.)

Git Bash is basically MINGW64 repackged for Git for Windows and the Git Desktop (depricated), which was used before Github was acquired by Microsoft a few years ago.

Honestly, we shold be using the new stuff.  Windows Terminal is pretty good.  Visual Studio Code is liked so much, even Linux distros have accepted it as part of their software repositories. For Arch Linux, it is in the AUR, but we're not going to install that. If you are using Windows (which this project is designed for), you should install the VS Code from the Microsoft Store app.  If you are using Windows 10, you probably don't have the Windows Terminal, but you should get it.

