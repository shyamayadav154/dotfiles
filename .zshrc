
# ~/.tmux/plugins
# export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# Disable the cursor style feature
# ZVM_CURSOR_STYLE_ENABLED=false


export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# compiler to find the JDK 
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

# alias here 
# alias vim=nvim
alias v=nvim
alias g=git
alias gg=lazygit
alias lg=lazygit
alias ta='tmux attach'
alias td='tmux detach'
alias tn="tmux new-session -s \$(echo \$(pwd) | sed 's#.*/##')"
alias tcd="tmux new-session -s \$(echo \$(pwd) | sed 's#.*/##')"
alias vz="nvim ~/.zshrc"
alias vt="nvim ~/.tmux.conf"    
alias ols='ollama serve' 
alias olrc='ollama run codellama:7b'
alias olrm='ollama run mistral'
alias olrmi='ollama run mistral:instruct'
alias nrd="npm run dev"
alias nrdp="prisma db push; npm run dev"
alias ni="npm install"
alias nrl="npm run lint"
alias nre="npm run eslint"
alias nrdm="npm run data:migrate"
alias nrb="npm run build"
alias nrs="npm run start"
alias nrt="npm run test"
alias nird="npm i && run dev"
alias q="exit"
alias s='say'
# alias tt='tree'
alias kn='killall node'
alias k9='killall node'
alias k='killall'
alias ez='exec zsh'
alias grr='git restore .'
alias tks='tmux kill-session'
alias b='brew'

alias copilot='gh copilot'
alias cop='gh copilot'
alias ghcs='gh copilot suggest'
alias ghce='gh copilot explain'

#gh repo create
function gh_repo_init() {
    # Get the current directory name
    current_dir=$(basename "$(pwd)")

    # Get the user's email
    email=$(git config user.email)

    # Trim the part after @ in the email
    username=${email%@*}

    # Check if the repository is already initialized
    if [ ! -d ".git" ]; then
        # If not, initialize a new Git repository
        git init
    fi

    # Add all files to the staging area
    git add .

    # Commit changes
    git commit -m "Initial commit"

    # Create repo with the current directory name
    gh repo create $current_dir --public -y

    # Set the GitHub repository URL using the current directory name
    github_repo="https://github.com/$username/$current_dir.git"

    # Add the GitHub remote repository
    git remote add origin $github_repo

    # Push changes to the main branch (you can modify this based on your branch name)
    git push -u origin main

    echo "Directory uploaded to GitHub!"
}





# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Use lf to switch directories and bind it to ctrl-o
# lfcd () {
#     tmp="$(mktemp)"
#     lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp"
#         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#     fi
# }
# bindkey -s '^o' 'lfcd\n'


# abbr hw='echo "Hello World"'


# Enable tab autosuggest-accept
# bindkey '\t' autosuggest-accept
# Enable Fuzzy Finder (fzf) on Ctrl+h
# bindkey '^h' fzf-history-widget

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
eval "$(zoxide init zsh)"

# eval "$(oh-my-posh init zsh)"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

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
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

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
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting 
    web-search
    zsh-vi-mode
)
    

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



eval $(thefuck --alias f)

# Created by `pipx` on 2023-12-16 14:12:19
export PATH="$PATH:/Users/shyamanandyadav/.local/bin"

export PATH="$PATH:/opt/local/bin"


# bob nvim manager path
export PATH="/Users/shyamanandyadav/.local/share/bob/nvim-bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export NODE_OPTIONS=--max_old_space_size=8192 #IGB

export PATH=$HOME/.config/bin:$PATH

# source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# bun completions
[ -s "/Users/shyamanandyadav/.bun/_bun" ] && source "/Users/shyamanandyadav/.bun/_bun"

. "$HOME/.atuin/bin/env"

# export ATUIN_NOBIND="true"
# eval "$(atuin init zsh)"
#
# bindkey '^h' atuin-search
#
# # bind to the up key, which depends on terminal mode
# bindkey '^[[A' atuin-up-search
# bindkey '^[OA' atuin-up-search

# sst
export PATH=/Users/shyamanandyadav/.sst/bin:$PATH


#aider

export AIDER_DARK_MODE=true

export AIDER_AUTO_COMMITS=false

# pnpm
export PNPM_HOME="/Users/shyamanandyadav/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(starship init zsh)"
# pnpm end
