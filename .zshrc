# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000
setopt autocd extendedglob notify prompt_subst inc_append_history_time
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
# zstyle ':completion:*' list-colors ''
dircolors | source /dev/stdin
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit
# End of lines added by compinstall
# The following lines are custom
autoload -Uz vcs_info
autoload -U history-search-end
autoload bashcompinit && bashcompinit

for dump in ~/.zcompdump(N.mh+24); do
	compinit
done
compinit -C

source $HOME/.zsh/z/zsh-z.plugin.zsh
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' actionformats '%F{5}(%F{3}%s:%b|%a%F{5})%f '
zstyle ':vcs_info:*' formats '%F{5}(%F{3}%s:%b%F{5})%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'

precmd() {
	vcs_info
}

bindkey "$key[Up]" history-beginning-search-backward-end
bindkey "$key[Down]" history-beginning-search-forward-end

PROMPT='%m:%F{4}%2~/%f ${vcs_info_msg_0_}%# '
RPROMPT="%(?..return code:%? )%(1j.jobs:%j .)[%T]"

PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
alias launch_jenkins='docker run -d --restart unless-stopped -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11'
# End of custom lines
