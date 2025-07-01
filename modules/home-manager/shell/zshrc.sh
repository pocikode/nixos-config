# bat
alias rcat="$(which cat)"
alias cat="$(which bat)"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# direnv
eval "$(direnv hook zsh)"

# custom env
MY_ENV_FILE="~/.my-env"
if [ -f "$MY_ENV_FILE" ]; then
    source "$MY_ENV_FILE"
fi