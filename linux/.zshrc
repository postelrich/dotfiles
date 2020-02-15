# Path to your oh-my-zsh installation.
export ZSH=/Users/rpostelnik/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git common-aliases zsh-autosuggestions async fuzzy-search)

# User configuration

export PATH="/Users/rpostelnik/anaconda3/bin:/Users/rpostelnik/q/m32:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR="vim"
source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias on="source activate"
alias off="source deactivate"
alias vim="nvim"
alias ll="ls -al"
<<<<<<< HEAD:.zshrc
=======
alias git-prune="git branch --merged master | grep -v '^ *master$' | xargs git branch -d"
>>>>>>> 01aaee69e87554ebec3b386f92baf160f5d97e47:osx/.zshrc
eval "$(thefuck --alias)"

. ~/z.sh
<<<<<<< HEAD:.zshrc
. ~/anaconda3/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
=======
. ~/miniconda2/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
>>>>>>> 01aaee69e87554ebec3b386f92baf160f5d97e47:osx/.zshrc
. ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function work() {
    action="$1"
    project="$2"
    case $action in
        [on]*)
            on $project
            cd ~/prj/$project
            ;;
        *)
            echo "Unknown action"
            return 1
            ;;
    esac
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
