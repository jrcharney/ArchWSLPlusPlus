# File: ~/.bash_aliases
# Info: A list of useful user-defined shortcuts
# Add this file to ~/.bashrc or ~/.zshrc
#	[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
# Use this file to add alias commands that should work in Bash and/or Zsh.
# Multiline commands should be defined as functions, preferibly in a script (in ~/bin) that can be referenced here.
# The general format of an alias is as follows
#	alias short_cut_name='commands to carry out'

# Alias: lspath
# Info: List paths one item at a time rather than a long messy string.
# Note: The order of the paths does the precedence of where things are looked up.
#	In other words, the stuff at the top of the list will be looked at first,
#	and the stuff at the bottom of the list will be last.
alias lspath="echo $PATH | tr ':' '\n'"

# Alias: retmux
# Info: Attach an active tmux session.
# NOTE: To detach a tmux session in tmux, use `^B d`.
# NOTE: If you are working in SSH, it's probably a good idea to work in TMUX.
#       If you get disconnected, you can use this command to pick up where you left off.
# TODO: Does this command need any other arguments (e.g. session number?)
alias retmux="tmux attach"

# Alias: uu
# Info: Update and Upgrade software from the default package repo.
# Note: I don't have this set up for `yay`, `flatpak`, `snap`, or any other repo.
# On Ubuntu, this command would be `sudo apt update && sudo apt upgrade`.
alias uu="sudo pacman -Syu"

# We're using lsd! The colors!
if [ -x "$(command -v lsd)" ]; then
    alias ls="lsd"
    alias ll="lsd -l"
    alias la="lsd -la"
fi
# Note: I did install bat, but I'm not going to alias that as cat. It could be problematic.

# Alias: weather
# Info: Display the weather in your current location
# TODO: I should make this a function instead in case the IP address doesn't geolocate to the current location
alias weather='curl wttr.in'

# Alias: ipinfo
# Info: Look up your IP info. This also shows geolocation and ISP information. This returns a JSON response.
alias ipinfo='curl ipinfo.io'

# SSH Connections
# This should add a list of SSH aliases to this file. I'm not sharing them with you! That's my stuff!
[[ -f ~/.ssh_aliases ]] && source ~/.ssh_aliases

