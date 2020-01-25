# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/snap/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="flazz"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# export FZF_BASE=/path/to/fzf/install/dir
export FZF_BASE=$(which fzf)

# Enable ssh agent forwarding support
zstyle :omz:plugins:ssh-agent agent-forwarding on

plugins=(
    vi-mode
    vscode
    git
    dotenv
    iterm2
    ssh-agent
 )

if type "fzf" > /dev/null; then
  plugins=($plugins fzf)
fi

if type "fasd" > /dev/null; then
  plugins=($plugins fasd)
fi

if type "node" > /dev/null; then
  plugins=($plugins node npm)
fi

case "$OSTYPE" in
  darwin*)
    plugins=($plugins osx)
  ;;
  linux*)
  ;;
esac

source $ZSH/oh-my-zsh.sh

export ZPLUG_HOME=~/.zplug

if [[ -n "${ZPLUG_HOME}" && -f $ZPLUG_HOME/init.zsh ]]; then
  source $ZPLUG_HOME/init.zsh
  zplug "wookayin/fzf-fasd"

  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if [[ -n "${ZPLUG_AUTO}" ]]; then
      zplug install
    elif read -q; then
      echo; zplug install
    fi
  fi
  zplug load
fi

# User configuration

export EDITOR='vim'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gal="mkdir -p /tmp/feh && feh -t --preload --scale-down -j /tmp/feh -E 128 -y 128 -W 1024 --caption-path captions -d --draw-tinted"
alias xc="xclip -selection clipboard"
alias xo="xclip -o -selection clipboard"
alias xx='$(xclip -o -selection clipboard)'

alias feh="feh --reverse -d -K captions -j /tmp/feh --action1 ';echo %F | xclip -selection clipboard -i' --action2 ';xclip -selection clipboard -t image/png -i $(echo %F)' --action3 ';nautilus %F &' --action4 ';dragon %F --and-exit &'"
alias cfeh='feh --action2 ";convert -auto-orient $PWD/%F /tmp/clip.png && xclip -selection clipboard -t image/png -i /tmp/clip.png && notify-send -t 700 copied %F" --action1 ";realpath $(echo $PWD/%F) | xclip -selection clipboard -i" -j /tmp/feh -d --auto-rotate --preload -K captions'
alias setwp="feh --action1 ';feh --bg-fill $(echo %F) && cp $(echo %F) $HOME/.wallpapers/bg.jpg' --action2 ';setlock $(echo %F) && echo done' -d"



function vpn {
  osascript \
<<EOD
  tell application "System Events" to tell process "GlobalProtect"
    click menu bar item 1 of menu bar 2
  end tell
EOD
}

if [[ $OSTYPE == "darwin"* ]]; then
  function tabc() {
    NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
    # if you have trouble with this, change
    # "Default" to the name of your default theme
    echo -e "\033]50;SetProfile=$NAME\a"
  }

  function tab-reset() {
      NAME="Default"
      echo -e "\033]50;SetProfile=$NAME\a"
  }

  function colorssh() {
      if [[ -n "$ITERM_SESSION_ID" ]]; then
          trap "tab-reset" INT EXIT
          if [[ "$*" =~ "sibyl*" ]]; then
              tabc Sibyl
          else
              tabc SSH
          fi
      fi
      ssh $*
  }
  compdef _ssh tabc=ssh

  alias ssh="colorssh"
fi

# load kitty completion
if [[ $TERM == "xterm-kitty" ]]; then
  autoload -Uz compinit
  compinit
  kitty + complete setup zsh | source /dev/stdin;
fi

