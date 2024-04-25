export ZSH=$HOME/.oh-my-zsh

PROMPT="%1~ $ "
DISABLE_LS_COLORS=true
DISABLE_AUTO_TITLE=true
DISABLE_UNTRACKED_FILES_DIRTY=true
DISABLE_MAGIC_FUNCTIONS=true

plugins=(
	git
	zsh-autosuggestions
	aliases
	web-search
	golang
	docker
	kubectl
)

source $ZSH/oh-my-zsh.sh

alias ll="ls -lah"
alias vim="nvim"

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
