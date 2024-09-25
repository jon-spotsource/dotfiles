#!/usr/bin/env bash
# place all `export` keyword declarations at the start for bash v3 compatibility:
# shellcheck disable=SC2034
export AWS_CLI_AUTO_PROMPT HOMEBREW_ARCH HOMEBREW_RUBY_VERSION NVM_DIR

# Used by `setup-environment-commands`

NVM_DIR="$HOME/.nvm"
# ^ Used by: setup-environment-commands, setup-node

HOMEBREW_ARCH='x86_64' # 'arm64e'
# ^ If you are on Apple Silicon, use 'x86_64' to have Homebrew installed and run as if it were on Apple Intel.
# ^ Used by: setup-environment-commands, setup-mac-brew, brew

HOMEBREW_RUBY_VERSION='default'
# ^ Used by: setup-environment-commands, setup-ruby

AWS_CLI_AUTO_PROMPT='on'
