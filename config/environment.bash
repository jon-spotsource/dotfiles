#!/usr/bin/env bash
# Used by `setup-environment-commands`
# place all `export` keyword declarations at the start for bash
# v3 compatibility:
# shellcheck disable=SC2034
# export AWS_CLI_AUTO_PROMPT
export HOMEBREW_ARCH HOMEBREW_RUBY_VERSION NVM_DIR LIBRARY_PATH PATH PNPM_HOME STARSHIP_CONFIG

# Used by: `aws`
# AWS_CLI_AUTO_PROMPT='on'

# Used by: `brew`, `setup-environment-commands`, `setup-mac-brew`
# If you are on Apple Silicon, use 'x86_64' to have Homebrew installed and run
# as if it were on Apple Intel.
HOMEBREW_ARCH='x86_64' # 'arm64e'

# Used by: `setup-environment-commands`, `setup-ruby`
HOMEBREW_RUBY_VERSION='default'

# Used by `cargo, setup-rust`
# LIBRARY_PATH="${LIBRARY_PATH:-}:$(brew --prefix libiconv)/lib:$(xcrun --sdk macosx --show-sdk-path)/usr/lib"
LIBRARY_PATH="${LIBRARY_PATH:-}:/usr/local/opt/libiconv/lib:/usr/local/opt/zlib/lib:$(xcrun --sdk macosx --show-sdk-path)/usr/lib"

# Used by: `setup-environment-commands`, `setup-node`
NVM_DIR="${HOME}/.nvm"

PATH="/nix/var/nix/profiles/default/bin:$PATH"
PATH="/usr/local/MacGPG2/bin:$PATH"
PATH="${HOME}/.nix-profile/bin:$PATH"
PATH="${HOME}/.rvm/bin:$PATH"
PATH="/usr/bin:$PATH"

# Used by: `pnpm`
PNPM_HOME="${HOME}/.local/share/pnpm"
PATH="${PNPM_HOME}:$PATH"

# Used by: `starship`
STARSHIP_CONFIG="${DOROTHY}/user/config/starship.toml"
