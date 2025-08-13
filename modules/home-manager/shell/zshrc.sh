# bat
alias rcat="$(which cat)"
alias cat="$(which bat)"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# eza
alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

# zoxide
eval "$(zoxide init zsh)"
alias cd="z"

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
