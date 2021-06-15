# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000
setopt autocd extendedglob notify prompt_subst inc_append_history_time
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate _prefix
zstyle ':completion:*' expand prefix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '$HOME/.zshrc'

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
zstyle ':vcs_info:*' enable git svn
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
alias ll='ls -l --color=auto'
# End of custom lines

