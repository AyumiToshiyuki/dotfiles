# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Add ~/.local/bin to PATH
PATH="$HOME/.local/bin:$PATH"

# Set editor to NeoVim
export EDITOR=nvim

# Enable auto-cd (cd into a dir just by typing its name)
setopt autocd

# Disable Job control (the thing that prints pid and "done" when &ing a process)
set +m

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::kitty

# Load completions
autoload -U compinit && compinit

# I don't remember what this means :shrug:
zinit cdreplay -q

# Enable oh-my-posh
if [ "$TERM" = "linux" ]; then
	eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/prompt-tty.toml)"
else
	eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/prompt.toml)"
fi

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_x:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Make rm, cp and mkdir recursive
alias rm='rm -rf'
alias cp⁼'cp -r'
alias mkdir='mkdir -p'

# Ask mv before overwriting file
alias mv='mv -i'

# Set calendar to start week on Monday
alias cal='cal -m'

# Mkdir then cd into it
mkcd() { mkdir $1 && cd $1 }

# Replace ls with eza
alias l='eza -lh --color=always --icons=always --no-quotes --group-directories-first --smart-group --git'
alias la='l -a'
alias cl='c && l'
alias cla='c && la'

# Single-letter aliases
alias q='exit'
alias c='clear'
alias r='ranger'
alias x='chmod +x'
alias g='xgamma -gamma'

# NeoVim stuff
alias v='nvim'
vx() {
	nvim "$1"
	chmod +x "$1"
}

# Weeb Stuff
alias a='ani-cli'
random-anime() { ani-cli $(cat ~/anime-to-watch | shuf -n 1 | cut -d$'\t' -f2) }

# *Fluttershy noises*
alias y='yay'
alias ync='yay -Syu --noconfirm'

# Exit aliases because I sometimes think I'm inside vim help me I have a problem
alias :q='exit'
alias :qa='exit'
alias :wq='exit'
alias :wqa='exit'

# Chown a file to the current user
alias gimme='sudo chown $USER:$USER'

# Exec a command with i3
run() { i3-msg "exec --no-startup-id $1" &>/dev/null }

# Open a new terminal from the current directory
alias n='setsid kitty &>/dev/null &'

# Youtube download
alias yt3='yt-dlp -x --audio-format mp3'
alias yt4='yt-dlp -f mp4'

# Tablet stuff
alias tablet-reset='xrandr --output DP-0 --mode 2560x1440 --rate 165 --output HDMI-0 --same-as DP-0 --scale `echo "2560/1920" | bc -l`x`echo "1440/1080" | bc -l`' # in case --auto doesn't work
alias tablet-on='xrandr --output HDMI-0 --auto'
alias tablet-off='xrandr --output HDMI-0 --off'
alias tablet-3='xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --pos 1640x1440 && ~/.fehbg' # Give the tablet its own screen
alias restart-otd='systemctl --user restart opentabletdriver'

# Install Vencord when Discord update deletes it
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'

# Say "Happy Pride Month!" when it's June
if [ $(date "+%B") = "June" ]; then
	if [ $(tput cols) -gt 103 ]; then
		echo \
		"   _    _                              _____      _     _           __  __             _   _       _ \n"\
		" | |  | |                            |  __ \\    (_)   | |         |  \\/  |           | | | |     | |\n"\
		" | |__| | __ _ _ __  _ __  _   _     | |__) | __ _  __| | ___     | \\  / | ___  _ __ | |_| |__   | |\n"\
		" |  __  |/ _\` | '_ \\| '_ \\| | | |    |  ___/ '__| |/ _\` |/ _ \    | |\\/| |/ _ \\| '_ \\| __| '_ \\  | |\n"\
		" | |  | | (_| | |_) | |_) | |_| |    | |   | |  | | (_| |  __/    | |  | | (_) | | | | |_| | | | |_|\n"\
		" |_|  |_|\\__,_| .__/| .__/ \\__, |    |_|   |_|  |_|\\__,_|\\___|    |_|  |_|\\___/|_| |_|\\__|_| |_| (_)\n"\
		"              | |   | |     __/ |                                                                   \n"\
		"              |_|   |_|    |___/                                                                    \n"\
		"\n" | lolcat -tF 0.3
	else
		echo "Happy Pride Month!\n" | lolcat -tF 1
	fi
fi
