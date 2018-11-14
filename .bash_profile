
# enable git tab-completing
source ~/.git-completion.sh

### Aliases

alias ydl="youtube-dl --extract-audio --audio-format mp3 --prefer-ffmpeg"

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Git 
# You must install Git first - ""
alias gs='git status'
alias ga='git add'
alias gc='git commit -m' # requires you to type a commit message
alias gb='git branch -a'
alias gl='git log --pretty=oneline --abbrev-commit --graph --decorate'
alias gd='git diff --patience'
alias gds='git diff --patience --staged'


# Git branch details
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# Change this symbol to something sweet. 
# (http://en.wikipedia.org/wiki/Unicode_symbols)
symbol="bash > "

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]in \[$WHITE\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$WHITE\]\$(parse_git_branch)\[$WHITE\]\n$symbol\[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

### Docker
alias dc="docker-compose"
alias dm="docker-machine"


### Misc

# Only show the current directory's name in the tab 
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

