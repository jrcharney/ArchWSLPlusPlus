:: Part 3: The Node and Git Part > Secure Shell

---

# Secure Shell

**Secure Shell** (`ssh`) is used to connect to other computers from the terminal.  If you have access, you can remote into another server, send and receive files (using Secure Copy (`scp`), and establish secure connections between other computers in your local network or on the global network.

Typically, were going to use SSH to connect to a git server on Github, Gitlab, or even Bitbucket.

SSH is also a great way to use Linux remotely. You can use programs like Tmux and Vim online to edit content online, although these days its much easier just to set up the remote computer as a Git Server and push content online that way.

In this document, I will also tell you how you can automate logging into an SSH server, which is a lot easier if you know what you are doing rather than being told to just enter in some commands you don't feel comfortable with.

> Note: One of the great things about Linux is that a lot of stuff is thoroughly documented. If you're not sure what something does, use the `man` command to look it up. (e.g. `man ssh`).
> By the way, if `man` was not installed, run `sudo pacman -S man-db`. It should be installed, but if it wasn't, run that and you'll have access to a library of software documentation.

## Loggin into an SSH server

The typical login process of accessing an SSH server is that you need a host to log in to, a user and a password.


```bash
ssh some-remote-website.com
```

The first time you log into an SSH server, you will be asked if are certain that you want to log into the server. If you are uncertain, type "no" and you will not be allowed to access that site.  But most of the time, you'll defintely say "yes", because that was your intent.  You will be asked this only once.  Your first login might be logged in a file on that remote server.  On Linux, that file is typically `~/.ssh/known_hosts`.

If you log in like above, you will also be asked your username and password. But the below way is defintely slightly better.

```bash
ssh your-username@some-remote-website.com
```

This is exactly like the above method, only you won't be asked for your user name, just your password.  Later, I will tell you how to do this without using your password.

> Note: Some servers may require two-factor authentication (2FA), which is an option when setting up an SSH server. Most won't.  If setting up an SSH server was part of the scope of this document, I would have recommended setting it up, but I'm not going to do that. For now we just want to access a server over SSH.

When you log in, you should be able to run some of the typical Bash shell commands like `ls` and `cat`.

> **A note about security:** Your access to the system is limited to probably a few folders, maybe the home directory, but you will not be permitted to access any of the private files on the server at the root level, not unless you're an adminstrator. And even if you did have root access, you would not be permitted to log in as `root` or `admin` on that server, because that would be terrible and a serious security risk.  But people are stupid.  Regardless, you probably shouldn't try to hack into the stuff that you're nto supposed to have access to.  Just a fair warining.

To leave an SSH server, typically you just need to type `exit`.


## Set up an SSH Key

For our first example, let's set up the SSH key for Github. I'm probably going to repost this in the [Git and Github](03-GitAndGithub.md) page later, but for now, it is a good example to start with on how to set up an SSH key.

An SSH Key is basically a pair of files that allow you permission to log into a server without having to type a password in most cases.  If your SSH key still has a passphrase, the server needs 2FA, or if a Personal Access Token (PAT) is needed to access a site, these instructions may need to be modified.  (Submit an issue to let me know. I know Github uses a PAT now.)

Your typical SSH key is created like this.

```bash
ssh-keygen -t ed25519 -C "$(whoami)@$(uname -n)-$(date -I)" -f ${HOME}/.ssh/github_com_ed25519
```
This one line takes care of almost all the things that need to be done when setting up a new SSH key.
- It sets the encryption type to ed25519
- It creates a comment that says who the key is for, what machine is is running on, and the date it was created.
- It sets where the file should go (in the `~/.ssh` directory) with an identifiable name and they type of encryption it uses.

These arguments are much better than a typical RSA set up where the default file name is `~/.ssh/id_rsa`. You should name your keys when they are created.

You will be asked to enter in a passphrase. Generally, most people don't answer that. Hit `Enter` twice to leave that blank.

We need to copy the public key, `~/.ssh/github_com_ed25519.pub` to the server in a form on the website that does that stuff.  The public key ends with `.pub`.

```bash
cat ~/.ssh/github_com_ed25519.pub
```

Select the text of the file with the mouse cursor.

On Github, go to [https://github.com/settings/ssh/new](https://github.com/settings/ssh/new) to set up an new SSH key.

Paste the public key in the "Key" field. You don't need to worry about filling out the "Title" field; it will automatically be set when we submit our information. Leave "Key Type" as "Authentication Key".  Click on the green "Add SSH key".

Back in the terminal, we need to activate the `ssh-agent` to run in the background.

```bash
eval "$(ssh-agent -s)"
```

Add the private key to the SSH keyring using `ssh-add`.  The private key does not have a suffix file type.

```bash
ssh-add ~/.ssh/github_com_ed25519
```

Typically, this is the part where we connect to our SSH server for the first time, however for Github, we can't do that.  Instead, we can test to see our new key works.

```bash
ssh -T git@github.com
```

You will likely be told that the authenticity of the host can't be established. This is normal. You will be asked of you want to continue connecting. Type `yes` and hit ENTER.

If all is well, you should see a message like this.

```
Hi jrcharney! You've successfully authenticated, but GitHub does not provide shell access.
```

And you should be set up.

> **WARNING:** Starting in December 2021, Github has chaanged how their login process works from a password login to needing to set up a Personal Access Token (PAT) and using the Github software `gh`.  I will roughly explain how to do that in [Git and Github](03-GitAndGithub.md).

### SSH Keys in general.

Typically, when I set up a new SSH connect, I create a Bash alias that connects to the computer I want.

Let's say I have a computer (that is using Avahi such that it shows up on my network as `crystal.local`), if by chance I dont have the `ssh-agent` running, I can call up `crystal.local` which has a copy of `crystal.local`'s public key (`crystal_rsa.pub`) stored on `crystal.local` at `~/.ssh/crystal_rsa.pub` and an entry in `~/.ssh/known_hosts`

But before we add the alias, we first need to give the SSH server a public key for the computer you are connected to.

To do this, we first need to see if we can access the server using a login and password.  

```bash
ssh jrcharney@crystal.local
```

If this if your first time logging in, you will be asked if you want to continue connecting. Type `yes` and hit ENTER.
You will then need to log in with your password.

If successful, try typing `ls` to see the contents of the home directory on `crystal.local`.
When you are done, type `exit`.

Back at your local terminal, you should now generate private and public keys to access `crystal.local`. We'll use an 4096-bit RSA key this time.

```bash
ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(uname -n)-$(date -I)" -f ~/.ssh/crystal_rsa
```

We need to copy our public key, `~/.ssh/crystal_rsa.pub` to `crystal.local`'s `~/.ssh` folder. We can do this using `ssh-copy-id`.

```bash
ssh-copy-id -i $HOME/.ssh/crystal_rsa.pub jrcharney@crystal.local
```

You may be asked to type in your password.

We can now test to make sure that this works locally with the private key `~/.ssh/crystal_rsa`.

```bash
ssh -i ~/.ssh/crystal_rsa jrcharney@crystal.local
```

If successful, you type `ls` you should see the contents of the home directory on `crystal.local`.
Type `exit` to return to your computer's terminal.

Now we can add the alias.

```bash
alias crystal="ssh -i ${HOME}/.ssh/crystal_rsa jrcharney@crystal.local"
```

It's probably better if we store our aliases in a separate file if we want to share our `~/.bash_aliases` file online.  We can source our SSH aliases to the `~/.bash_aliases` file.

```
echo '[[ -f ~/.ssh_aliases ]] && source ~/.ssh_aliases' >> ~/.bash_aliases		# Put our SSH aliases is a separate alias file.
```

```bash
echo 'alias crystal="ssh -i ${HOME}/.ssh/crystal_rsa jrcharney@crystal.local"' >> ~/.ssh_aliases
```

On your next boot, if you want to log into `crystal.local`, you can simply type `crystal` to login without the need for a password.

> TODO: What if I want to copy files between my computer and `crystal.local`?  That requires using another program called `scp`, which we will look into later.  There's also `rclone`, but that's something else.

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: Node and NPM](01-NodeAndNPM.md) &middot;
[Next: Git and Github](03-GitAndGithub.md)


