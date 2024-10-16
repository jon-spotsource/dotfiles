#!/usr/bin/env bash
# Used by `setup-environment-commands`
# place all `export` keyword declarations at the start for bash
# v3 compatibility:
# shellcheck disable=SC2034
export AWS_CLI_AUTO_PROMPT HOMEBREW_ARCH HOMEBREW_RUBY_VERSION NVM_DIR STARSHIP_CONFIG

# Used by: `aws`
AWS_CLI_AUTO_PROMPT='on'

# Used by: `brew`, `setup-environment-commands`, `setup-mac-brew`
# If you are on Apple Silicon, use 'x86_64' to have Homebrew installed and run
# as if it were on Apple Intel.
HOMEBREW_ARCH='x86_64' # 'arm64e'

# Used by: `setup-environment-commands`, `setup-ruby`
HOMEBREW_RUBY_VERSION='default'

# Used by: `setup-environment-commands`, `setup-node`
NVM_DIR="${HOME}/.nvm"

# Used by: `starship`
STARSHIP_CONFIG="${DOROTHY}/user/config/starship.toml"
