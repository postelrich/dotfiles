# Path to your oh-my-zsh installation.
export ZSH=/Users/cpp974/.oh-my-zsh

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
plugins=(git common-aliases brew npm) # pip)

# User configuration

export PATH="/Users/cpp974/miniconda2/bin:/Users/cpp974/q/m32:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
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
alias git-prune="git branch --merged master | grep -v '^ *master$' | xargs git branch -d"
eval "$(thefuck --alias)"

. ~/z.sh
. ~/miniconda2/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
. ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

CAPONE_USER="cpp974"
if [ "$USER" = "$CAPONE_USER" ]; then # Only do this on the Cap One laptop
	export USER_UPPER=`echo $USER | tr '[:lower:]' '[:upper:]'`

	# Deliberately pull in the SSO password variable from the helper
	# script. Note that the helper script itself does _not_ have a `.sh`
	# extension, so it should not be included in the normal run of including
	# OS-specific scripts
	source "$HOME/.config/nvim/osx/get_sso_password_from_keychain"

	export http_proxy="http://$USER:$SSO_PASS@entproxy.kdc.capitalone.com:8099/"
	export https_proxy="https://$USER:$SSO_PASS@entproxy.kdc.capitalone.com:8099/"
	# export https_proxy=$http_proxy
	export HTTP_PROXY=$http_proxy
	export HTTPS_PROXY=$https_proxy
	export no_proxy="localhost,127.0.0.1,10.0.2.2,172.16.0.0/12,192.168.0.0/16,slack.com"
	export NO_PROXY=$no_proxy
fi


