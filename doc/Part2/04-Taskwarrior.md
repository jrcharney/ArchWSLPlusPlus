:: Part 2: The Linux Part > Taskwarrior

---

# Taskwarrior

This part is optional, but I would recommend using it because it adds some minimalistic task tracking, time tracking and management, and Kanban features.

There's one thing I would suggest doing if you are doing software development: Install [taskwarrior](https://taskwarrior.org/).  This is useful because you can write down tasks for things you can do while working on project.  Personally, I'm more of a [Trello](https://trello.com/) person because [Kanban](https://en.wikipedia.org/wiki/Kanban_(development)) is awesome and can be used for more than just computer development. I used it to help me list all the things I need to do when I moved into my apartment a few months ago. It's that versatile.

You could also use something like [Notion](https://www.notion.so/), which as a [Markdown](https://daringfireball.net/projects/markdown/) editor, but in terms of Markdown editors, I prefer [Typora](https://typora.io/) ($15) because it supports [Mermaid](https://mermaid-js.github.io/) where you can generate [UML diagrams](https://www.uml-diagrams.org/) and other charts and uses [MathJax](https://www.mathjax.org/) for [LaTeX](https://www.latex-project.org/) support.  You can also embed HTML and SVG and generate a preview of what the code looks like.

To install Taskwarrior, install the `task` package.

```bash
sudo pacman -S task
```

We can also install a couple of terminal interface programs such as `taskwarrior-tui` and `vit`.  I will add that.

```bash
sudo pacman -S taskwarrior vit
```

There is also a command-line time tracking app called [timewarrior](https://timewarrior.net/) (`timew`) that integrate with `task`.

```bash
sudo pacman -S timew
```

Because we installed `powerlevel10k` earlier, if we add a task, an item should appear showing how many tasks you have on the right side. If it doesn't show up, you may need to restart ArchWSL or check `~/.p10k.zsh` to make sure that the segment is enabled.
In fact, Powerlevel10k has [many segments](https://github.com/romkatv/powerlevel10k#batteries-included) that can be useful.  You should enable the ones you know that you will need as enabling all of them will be taxing to your system resources.

Finally, [Taskell](https://hackage.haskell.org/package/taskell) (`taskell`), which is a command-line Kanban board written in [Haskell](https://www.haskell.org/). We can use it with a Markdown file (`.md`) to generate a textual Kanban. This will also instal Haskell which is a functional programming language, but it is way too deep for new programmers. All you need to know is that this program does Kanban stuff in the terminal which is great for developing code.  It also has features that should sync with Trello and Github.

The first time you run `task` you will be told that a configuration file could not be found and asked if you would like to create a sample one. Say yes to it.
Similarly, if you run `timew` the first time, it will also ask of you would like to create a new database file. Also say yest to that.
Lastly, `taskell` will ask of you want to generate a `taskell.md`, but you might want to use your own file. So run it with `taskell my-kanban-file.md`.  It might be better to edit the markdown file in a text editor and view it with `taskell`.  I'll write something about Taskell later.

---
[Up: Index](../00-START_HERE.md) &middot;
[Prev: Zsh and Tmux](03-ZshAndTmux.md) &middot;
[Next: Node.js and NPM](../Part3/01-NodeAndNPM.md)

