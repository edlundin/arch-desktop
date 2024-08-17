eval "$(/opt/homebrew/bin/brew shellenv)"
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2023-08-25 08:56:04
export PATH="$PATH:/Users/edlundin/Library/Android/sdk/platform-tools:/Users/edlundin/go/bin:/Users/edlundin/.local/bin:/Users/edlundin/.platformio/penv/bin"
export PATH="$PATH:/Users/edlundin/.bin"

eval "$(zoxide init --cmd cd zsh)"
eval "$(pyenv init -)"
