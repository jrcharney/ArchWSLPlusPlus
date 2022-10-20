:: Part 3: The Node and Git Part > Git and Github

---

> This document is still a work in progress, but it should be usable enough to post online.

# Git and Github

## Git

[**Git**](https://git-scm.com/) (`git`) is a free and open source software (FOSS) for distributed version control designed to handle tracking changes in any set of files, usually used for coordinating work among programmers collaboratively developing source code during software development.

In fact, this entire repository used Git to push it to Github.

I'm not going to get into the full details about how to use Git.  Eventually I'll write something.

What I am going to offer is some advice on how to how to set up three of the basic things you'll want in your Github repo
- A `README.md` file.
- A `LICENSE.txt` file.
- A `.gitignore` file.

### Adding a `README.md` file to tell us about your project

A `README.md` file is the file that tells everyone what your project is about.  You could set up a webpage, but this is easier, and it uses Markdown so it will look good.

You can create an empty `README.md` using `touch README.md` then use your prefered text editor to write about it.

### Adding a `LICENSE.txt` with `license`

There is a program that allow you to generate a `LICENSE` file in your repo automatically and wihtout needing to leave the terminal.
Appropriately, it is called [License](https://nishanths.github.io/license/) (`license`). It is written in [Go](https://golang.org/) and is available in the ArchLinux User Repository (AUR). We will use that in our tutorial.

You should install it using `yay`.

```bash
yay -S nishanths-license-git
```

Typically, I set up an MIT Software License on a lot of my public projects, so the command to generate the `LICENSE.txt` file is

```bash
license -o LICENSE.txt mit
```

### Adding `.gitignore` with `git-ignore` 

I'm still new to how to use Git to set up a `.gitignore` file, but there is this one softrware called 

Another program that you should install is one that generates a `.gitignore` file.  A `.gitignore` file is necessary to avoid uploading dependencies or files you don't want to upload.

An easy way to generate a `.gitignore` file is to go to [gitignore.io](https://www.gitignore.io/).
An even better way is to download the [`git-ignore`](https://github.com/sondr3/git-ignore) package from the AUR (written in [Rust](https://www.rust-lang.org/)) that allows you to add and remove items in your `.gitignore` file from the command line.

```bash
yay -S git-ignore-bin
```

> NOTE: If you are asked to install a provider for the `cargo` program, choose the `rust` option. As tempting as it is to install `rustup`, it won't work.
> If by chance, you ignored what I said, and can't install this. use pacman to remove `rustup` (`sudo pacman -R rustup`) and start over.

The `git-ignore` sofware will add a `git ignore` command that will offer some automated templates for generating a `.gitignore` file.

> Note: The first time you run `git ignore` use `git ignore -u` so it updates its template database. It will do this the first time you run `git ignore`, but just to make sure the installation works correctly, you should probably run `git ignore -u` before using `git ignore` to create your `.gitignore` file.

With `license` and `git ignore`, you can create your 'LICENSE.txt' file and `.gitignore` files without leaving the command line.

> TODO: Add some examples as to how to use it.

#### A valid use-case for a `.gitignore`

In the process of writing this project and adding images, files that ende with `:Zone.Identifier` would generate and show up in `git status`. But we don't want to upload those file to our repository and when we start using automated workflow software, the colon (`:`) in those files could break our workflow and any scripts that it uses.

However, our `git ignore` template database doesn't offer a `zone_identifier` as an entry to ignore those `:Zone.Identifier` files.

Your best bet is to append `**/*Zone.Identifier` to your `.gitignore` manually.

```bash
echo '**/*Zone.Identifier' >> .gitignore
```

You should also delete any `:Zone.Identifier` files that show up.

```bash
find . -name "*:Zone.Identifier" -type f -delete
```

See [What to do with `:Zone.Identifier` files](../Part5/02-ItMakesZIFiles.md)

### Configure your `git config`

Three simple things that probably need to be done.  Fill in the blanks between the square brackets.

```bash
git config --global user.name "[firstname lastname]"
git config --global user.email "[you@email.com]"
git config --global color.ui auto
git config --global init.defaultBranch main
```

> Note: So we don't have to rename our default branch, we should use `git config --global init.defaultBranch main`.

There's probably some other things that need to be set, but for now those are the basic items.


> TODO: I need to think of how I should write the SSH process. I wrote about it in [the previous part](02-SSH.md).

### Set up a Git repository

Let me make this perfectly clear: **DO NOT RUN `git init` IN YOUR HOME DIRECTORY, OR ANY OTHER FOLDER EXCEPT FOR THE FOLDER THAT YOUR PROJECT IS IN!**
Unless you want to upload your etinre home directory to Github (which is a very bad idea), only run `git init` INSIDE the folder you intend to establish as the project folder for your project!
It's not rocket science.

OK, with that out of the way, let's get started.

```
cd ~/Projects/																# Let's start by moving into a Projects folder. If you don't have one, make one. It's a good practice.
mkdir ArchWSLPlusPlus														# Next, create a new folder named after your project. I am using ArchWSLPlusPlus. You should use something else.
cd ArchWSLPlusPlus															# Go into your project folder
git init																	# Establish your project folder as a git repository
touch README.md																# Make a read me markdown file. (You can write about the folder later.)
license -o LICENSE.txt mit													# Create an MIT License for this project using the license script.
git add README.md LICESNE.txt												# Add the README and LICENSE file to the git stating area.
git commit -m "first commit"												# Commit the staging area for the first time.
git branch -M main															# Rename the primary branch of your folder to `main`. The `-M` option is the same as using `--move --force`
git remote add origin https://github.com/jrcharney/ArchWSLPlusPlus.git		# Add a remote alias called "origin" for the URL this repo will be placed.
git push -u origin main														# Set origin as the upstream of main
```

Our repo should be set up, right?

**WRONG!** That was how we used to do it, and on other website it should still work. But on Github.com this has changed.

## Github

Github has changed how you create repositories. While all the first steps from the the `git init` to the `git branch -M main` steps in the above instructions remain the same, after that the steps are much different.

You need to go to the Github website and create a Personal Authentication Token (PAT).  This required enabling all sorts of permissions. I wasn't quite sure which ones I should enable, so for the moment, I enabled them all. (This will change soon, especially if there is some security issue.)

> TODO: insert something here

You will then need to go to your email.

> TODO: insert something here

```bash
gh auth login
```

You will need to take that PAT and either type it out or paste it into your terminal.

To create a new github prepository, the command for setting up the adding a remote has changed.

```bash
gh repo create ArchWSLPlusPlus --public --source=. --remote=upstream --push
```

Because the last argument of that command is `--push`, we don't need to `git push -u origin main`. It's done automatically.

With that, the last two steps of the old instructions have been replaced.

So let's go over the new procedure.

#### Setting Up `git config` (Redux)

```bash
git config --global user.name "[firstname lastname]"
git config --global user.email "[you@email.com]"
git config --global color.ui auto
git config --global init.defaultBranch main						# Use this so we set the default branch to "main" instead of "master"
```

#### Setting up a new repo on Github

```bash
cd ~/Projects
mkdir ArchWSLPlusPlus
cd ArchWSLPlusPlus
git init
touch README.md
license -o LICENSE.txt mit
git add .
gh auth login										# Use your PAT
gh repo create ArchWSLPlusPlus --public --source=. --remote=upstream --push
```

Remember, the steps for setting up a new repo on Github only applies to Github. They should still be the same elsewhere.

## What about Gitlab?

Because Gitlab needs Redis to work, it is not part of this document. It will be in a separate document: [Gitlab and Redis](../Part4/01-GitlabAndRedis.md).


## What about BitBucket?

BitBucket used to use a software called Mercurial, but when Atlassian bought it, they shifted to using Git.  I'm probably not going to talk about it right now, but consider this section a placeholder for the future.  It's still important enough to deserve a metion.

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: Taskwarrior](02-SSH.md) &middot;
[Next: Secure Shell](04-WSLAndVSCode.md)


