# Source .zshrc if it exists and is readable
if [ -r "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
fi
. "$HOME/.cargo/env"
