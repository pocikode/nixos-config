# powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

# direnv
eval "$(direnv hook zsh)"

# pay-respects
eval "$(pay-respects zsh --alias)"
alias fuck="$(pay-respects zsh)"

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