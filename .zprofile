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
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR=$HOME/.nvm
#source $HOMEBREW_PREFIX/opt/nvm/nvm.sh


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
