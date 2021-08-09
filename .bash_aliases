# misc aliases
alias ks='ls'
alias l='ls -l'
alias back='cd $OLDPWD'
alias Copy='xclip -selection c'
alias Paste='xclip -selection c -o'
alias eba='vi ~/.bash_aliases'
alias ebr='vi ~/.bashrc'
alias sbr='source ~/.bashrc'


# k8s
function k_use_context() {
	kubectl config use-context "$1"
}

alias k-mini='k_use_context minikube'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
