# Start configuration added by Zim install {{{
#
# User configuration sourced by all invocations of the shell
#

fpath=(~/.zsh/completion $fpath)
export VISUAL="vim"
export RANGER_LOAD_DEFAULT_RC=false
export FZF_DEFAULT_COMMAND="fd --type f"
export GREP_COLORS="mt=37;31"
export PNPM_HOME="/Users/edlundin/Library/pnpm"
#export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
#export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
#export TESTCONTAINERS_RYUK_DISABLED=true
export PATH="$PNPM_HOME:$PATH"
