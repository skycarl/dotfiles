# ─── Cursor Agent detection ──────────────────────────────────────────────
# This MUST be the very first executable lines in ~/.zshrc.
# Cursor’s background “Agent Terminal” always sets npm_config_yes=true.
if [[ $npm_config_yes == true ]]; then
  POWERLEVEL9K_INSTANT_PROMPT=off        # keep P10k’s instant-prompt from firing
  PROMPT='%n@%m:%~%# '                   # simple prompt Agent can parse
  return                                  # stop sourcing the rest of ~/.zshrc
fi
# ─────────────────────────────────────────────────────────────────────────

# ======================================================

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git poetry)

# Needed for Poetry completions
fpath+=~/.zfunc
autoload -Uz compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

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
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 1Password CLI config
# commenting out because it seems to conflict with gh
# source ~/.config/op/plugins.sh

# Add local binaries to PATH to enable things like poetry
export PATH="/Users/skylercarlson/.local/bin:$PATH"

# Load configs if present
if [ -f ~/.portable_config ]; then
    . ~/.portable_config
fi

if [ -f ~/.local_config ]; then
    . ~/.local_config
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/skylercarlson/.cache/lm-studio/bin"

# Alias for default template for LLM CLI
llmt() { llm -t brief_cli "$@" }

# Stop oh-my-zsh from loading plugins and themes in Cursor
#if [[ -z $CURSOR_TRACE_ID ]]; then
  # Normal interactive terminal ─ load everything
#  source ~/.p10k.zsh        # or `ZSH_THEME="powerlevel10k/powerlevel10k"`
#  source $ZSH/oh-my-zsh.sh
#else
  # Inside Cursor ─ minimal prompt
#  PROMPT='%n %~ %# '
#fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"

# History file & lengths
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000        # in-memory commands
SAVEHIST=200000       # how many lines to keep on disk

# Safer, smarter history behavior
setopt APPEND_HISTORY          # append instead of overwrite
setopt INC_APPEND_HISTORY      # write to file immediately
# setopt SHARE_HISTORY         # OPTIONAL: merge history across terminals
setopt HIST_IGNORE_DUPS        # skip if same as previous
setopt HIST_IGNORE_ALL_DUPS    # remove older dupes when adding a new one
setopt HIST_SAVE_NO_DUPS       # don’t save dupes to file
setopt HIST_EXPIRE_DUPS_FIRST  # trim oldest dupes first when shrinking
setopt HIST_REDUCE_BLANKS      # squeeze extra spaces
setopt HIST_IGNORE_SPACE       # commands starting with space aren’t saved
setopt EXTENDED_HISTORY        # store timestamps + durations in file

# Nice timestamps when listing history (oh-my-zsh reads this)
HIST_STAMPS="yyyy-mm-dd"       # or use strftime like: "%F %T"

# (Optional) helpful plugins
plugins=(
  git
  history history-substring-search
  zsh-autosuggestions zsh-syntax-highlighting
  fzf
)

# history-substring-search arrow keys (optional)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export PAGER=cat

claude-update() {
  local node_modules_dir="$HOME/.nvm/versions/node/$(node -v)/lib/node_modules/@anthropic-ai"
  rm -rf "$node_modules_dir/claude-code" "$node_modules_dir/.claude-code-"* 2>/dev/null
  npm i -g @anthropic-ai/claude-code
}


# AWS
export AWS_DEFAULT_REGION=us-west-2
