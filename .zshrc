# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:$HOME/.local/bin:$HOME/bin/i3scripts:/usr/local/bin:/snap/bin:$PATH


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# lower keytimeout for addtional characters in sequence (helpful for vim mode)
export KEYTIMEOUT=1
export EDITOR='nvim'

alias sudo="sudo "
alias t="tracktask"
alias gal="mkdir -p /tmp/feh && feh -t --preload --scale-down -j /tmp/feh -E 128 -y 128 -W 1024 --caption-path captions -d --draw-tinted"
alias xc="xclip -selection clipboard"
alias xo="xclip -o -selection clipboard"
alias xx='$(xclip -o -selection clipboard)'

alias feh="feh --reverse -d -K captions -j /tmp/feh --action1 ';echo %F | xclip -selection clipboard -i' --action2 ';xclip -selection clipboard -t image/png -i $(echo %F)' --action3 ';nautilus %F &' --action4 ';dragon %F --and-exit &'"
alias cfeh='feh --action2 ";convert -auto-orient $PWD/%F /tmp/clip.png && xclip -selection clipboard -t image/png -i /tmp/clip.png && notify-send -t 700 copied %F" --action1 ";realpath $(echo $PWD/%F) | xclip -selection clipboard -i" -j /tmp/feh -d --auto-rotate --preload -K captions'
alias setwp="feh --action1 ';feh --bg-fill $(echo %F) && cp $(echo %F) $HOME/.wallpapers/bg.jpg' --action2 ';setlock $(echo %F) && echo done' -d"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"

zinit ice wait'0a' lucid
zinit light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC="true"
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="z *"

zinit ice wait'0b' lucid
zinit light zdharma/fast-syntax-highlighting

zinit ice wait'0c' lucid
zinit light zdharma/history-search-multi-word

zinit ice wait'0d' lucid
zinit light wookayin/fzf-fasd

zplugin light romkatv/zsh-defer

bindkey -v
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd e edit-command-line

# change cursor to indicate vim mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

load_lfcd() {
  LFCD="$HOME/.config/lf/lfcd.sh"
  if [ -f "$LFCD" ]; then
    source "$LFCD"
    bindkey -s '^o' 'lfcd\n'
  fi
}

zsh-defer load_lfcd

load_fasd() {
  eval "$(fasd --init auto)"
}

zsh-defer load_fasd

# Basic auto/tab complete:
load_tab_completion() {
  zstyle ':completion:*' menu select
  zmodload zsh/complist
  _comp_options+=(globdots)		# Include hidden files.
}

zsh-defer load_tab_completion
