# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/ignaciosotoz/.oh-my-zsh
export PATH="/Users/ignaciosotoz/anaconda3/bin:$PATH"
export PATH=~/.bin:$PATH
export LANG=en_US.UTF-8
export LC_All=en_US.UTF-8
export TERM=xterm-256color
ZSH_TMUX_AUTOSTART='true'
ZSH_THEME=""

source "$HOME/.antigen/antigen.zsh"
source $ZSH/oh-my-zsh.sh
# User configuration
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle supercrabtree/k
antigen apply 

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi


# Define plugins

plugins+=(k git heroku)

# Aliases
alias vim="nvim"
# Tmux related
alias tmuxnw="tmux new-window"
alias tmuxns="tmux new-session"
alias tmuxkw="tmux kill-window"
alias tmuxks="tmux kill-session"
alias tmuxkp="tmux killp"
alias tmux="TERM=screen-256color-bce tmux"
alias mux="tmuxinator"
# Todolist
alias todo="todolist"
# Rstudio
alias rstudio="open -a RStudio"
# List virtualenvs
alias condaenvs="conda info --envs"
# gitctm
alias ctm="git add . && git commit -m 'Terremotoooooo!!!!11!111uno1!11' && git push origin master"
# The fuck!

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)
eval $(thefuck --alias fff)

# Custom functions
# Create .gitignore on the fly.

function gitignore() { curl -L -s https://www.gitignore.io/api/$@ ;}


# Find and open files

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Find and kill processes

fkill() {
    local pid
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if ["x$pid" != "x"]; then
        echo $pid | xargs kill -${1:-9}
    fi
}

# find and read pdf

p () {
    local DIR open
    declare -A already
    DIR="${HOME}/.cache/pdftotext"
    mkdir -p "${DIR}"
    if [ "$(uname)" = "Darwin" ]; then
        open=open
    else
        open="gio open"
    fi

    {
    ag -g ".pdf$"; # fast, without pdftotext
    ag -g ".pdf$" \
    | while read -r FILE; do
        local EXPIRY HASH CACHE
        HASH=$(md5sum "$FILE" | cut -c 1-32)
        # Remove duplicates (file that has same hash as already seen file)
        [ ${already[$HASH]+abc} ] && continue # see https://stackoverflow.com/a/13221491
        already[$HASH]=$HASH
        EXPIRY=$(( 86400 + $RANDOM * 20 )) # 1 day (86400 seconds) plus some random
        CMD="pdftotext -f 1 -l 1 '$FILE' - 2>/dev/null | tr \"\n\" \"_\" "
        CACHE="$DIR/$HASH"
        test -f "${CACHE}" && [ $(expr $(date +%s) - $(date -r "$CACHE" +%s)) -le $EXPIRY ] || eval "$CMD" > "${CACHE}"
        echo -e "$FILE\t$(cat ${CACHE})"
    done
    } | fzf -e  -d '\t' \
        --preview-window up:75% \
        --preview '
                v=$(echo {q} | tr " " "|");
                echo {1} | grep -E "^|$v" -i --color=always;
                pdftotext -f 1 -l 1 {1} - | grep -E "^|$v" -i --color=always' \
        | awk 'BEGIN {FS="\t"; OFS="\t"}; {print "\""$1"\""}' \
        | xargs $open > /dev/null 2> /dev/null
}



# Source ruby version manager
source /Users/ignaciosotoz/.rvm/scripts/rvm
# Source anaconda
# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Test zsh integration
test -e "~/.iterm2_shell_integration.zsh" && source "~/.iterm2_shell_integration.zsh"

autoload -U promptinit; promptinit
prompt pure
####
### Ancilliary / Legacy
###

## Match shell and vim themes
#BASE16_SHELL=$HOME/.config/base16-shell/
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
source ~/.iterm2_shell_integration.zsh
#source ~/.tat/tat.sh
eval "$(rbenv init -)"
export PATH=$PATH:$(go env GOPATH)/bin

