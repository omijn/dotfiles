# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# partial completion suggestions
# zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix
autoload -U colors && colors

# a lot of the configuration in this file is from https://scriptingosx.com/2019/06/moving-to-zsh/
# ---------- ZSH OPTIONS ----------- 
setopt AUTO_CD
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
# setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# enable corrections
# setopt CORRECT
# setopt CORRECT_ALL

# allows functions in prompt
setopt PROMPT_SUBST
# ---------- END ZSH OPTIONS ----------- 



# colors: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# prompt sequences: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# TODO: nicer way to integrate git repo/branch info in prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[git:\1]/'
}

k8s_context() {
	ctx=$(kubectl config current-context 2>/dev/null)
	if [[ $ctx != "" ]]; then
		echo "[k8s:$ctx]"
	fi
}

battery() {
    battery_status=$(cat /sys/class/power_supply/BAT0/status)
    perc=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ $perc -le 20 ]; then
        echo "[$battery_status:$perc%%]"
    fi
}

PS1="%F{245}%*%f %F{green}%n@%f%F{cyan}%m%f %F{025}\$(parse_git_branch)%f%F{green}\$(k8s_context)%f%F{166}\$(battery)%f"$'\n'"%F{252}%~%f %# "


# ---------- KEY BINDINGS ---------- 
bindkey '^[[A' up-line-or-search # up arrow bindkey
bindkey '^R' history-incremental-search-backward
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey -s "^T" "^[Isudo !!^[A"
# ----------  END KEY BINDINGS ----------  


# managing dotfiles: 
# https://www.ackama.com/blog/posts/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained
# https://www.atlassian.com/git/tutorials/dotfiles
# https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b

source ~/.zsh-z.plugin.zsh

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

if [ -f ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi

if [ -f ~/.zsh_aliases.local ]; then
	source ~/.zsh_aliases.local
fi

