# Git aliases
alias gps="git push"
alias gpl="git pull"
alias gcm="git commit -m"
alias gs="git status"
alias ga="git add"
alias gitupdate='find . -name .git -print -execdir git pull \;'

# Docker aliases
alias dps="docker ps"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcb="docker compose build"

# General aliases
alias grh="history|grep"
alias jl="jupyter lab"
alias cna="conda activate"
alias cnd="conda deactivate"
alias sha='shasum -a 256 '
alias ping='ping -c 5'
alias ipe='curl ipinfo.io/ip'
alias ipi='ipconfig getifaddr en0'
alias c='clear'
alias sz='source ~/.zshrc'
alias sha='shasum -a 256 '
alias untar='tar -zxvf '
alias tar='tar -czvf '

# Workaround for op and gh plugin conflicts
alias gh="env -u GITHUB_TOKEN gh $1"

alias jup="uv run --with jupyter jupyter lab"
