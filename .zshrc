# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/sudo"
plug "zap-zsh/fzf"
plug "zap-zsh/magic-enter"
plug "zap-zsh/web-search"
plug "chivalryq/git-alias"
plug "wintermi/zsh-rust"
plug "Freed-Wu/fzf-tab-source"
plug "Aloxaf/fzf-tab"

# Load and initialise completion system
autoload -Uz compinit
compinit
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export MAKEFLAGS="-j16"
export LLVM="1"
# pnpm
export PNPM_HOME="/home/azharnazli/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# bun completions
[ -s "/home/azharnazli/.bun/_bun" ] && source "/home/azharnazli/.bun/_bun"


# export
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export MOZ_ENABLE_WAYLAND=1
# export ZVM_INSTALL=/home/azharnazli/.zvm
# export PATH="$ZVM_INSTALL/self:$PATH"
# export PATH="$ZVM_INSTALL/bin:$PATH"
export EDITOR=nvim
export TERM="kitty"
export TERMINAL="kitty"

alias vi=nvim
alias weather="curl wttr.in/Jakarta"
alias ls="exa"
alias vim="nvim"
alias ll="exa --long --header --git --icons"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse| xargs nvim"
alias zel="zellij"
alias wsk="wsl.exe --shutdown"
alias rm_swap="rm -rf /home/azharnazli/.local/state/nvim/swap/*"
alias rm_nvim="$HOME/Documents/code/bash/refresh_nvim.sh"
alias bc_nvim="$HOME/Documents/code/bash/backup_nvim.sh"
alias rs_nvim="$HOME/Documents/code/bash/restore_nvim.sh"
alias zbr="zig build run"
alias zb="zig build"
alias gpureload="sudo rmmod nvidia_uvm ; sudo modprobe nvidia_uvm"

unsetopt beep
eval "$(zoxide init zsh)"

kitty-reload() {
    kill -SIGUSR1 $(pidof kitty)
}

bindkey -e
