# bat
alias rcat="$(which cat)"
alias cat="$(which bat)"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# eza
alias rls="eza"
alias ls="eza --icons=always"

# zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# history setup
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# direnv
eval "$(direnv hook zsh)"

# Laravel
alias art="php artisan"

# python
alias uvr="uv run"
alias uvm="uv run manage.py"

# custom env
MY_ENV_FILE="$HOME/.my-env"
if [ -f "$MY_ENV_FILE" ]; then
    source "$MY_ENV_FILE"
fi

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
