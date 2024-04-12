#!/usr/bin/env bash
# do not use `export` keyword in this file:
# shellcheck disable=SC2034

# load the default configuration
source "$DOROTHY/config/setup.bash"

# APK
# Used by `setup-linux`
# APK_INSTALL=()

# Apt / apt-get
# Used by `setup-linux`
# APT_UNINSTALL=()
# APT_INSTALL=()

# AUR / pamac / pacman / yay / paru / pakku / aurutils
# Used by `setup-linux`
# AUR_INSTALL=()

# Flatpak
# Used by `setup-linux`
# FLATPAK_INSTALL=()

# RPM / dnf / yum
# Used by `setup-linux`
# RPM_INSTALL=()

# Snap
# Used by `setup-linux`
# SNAP_INSTALL=()

# Zypper
# Used by `setup-linux`
# ZYPPER_INSTALL=()

# macOS App Store / mas / https://github.com/mas-cli/mas
# Used by `setup-mac-appstore`
# You can use `mas list` and `mas search` to find apps
# MAS_INSTALL=() # tupe array of id, label
# MAS_UPGRADE='no'

# Homebrew / brew / https://brew.sh
# Used by `setup-mac-brew`
# You can use `setup-mac-brew --configure` to configure some of these.
# HOMEBREW_UNTAPS=()
# HOMEBREW_TAPS=()
HOMEBREW_FORMULAS=(
	'awscli'
	'caddy'
	'noti'
)
# HOMEBREW_SLOW_FORMULAS=()
HOMEBREW_CASKS=(
	'gpg-suite-no-mail'
	'iterm2'
	'opera-gx'
	'rectangle'
	'vlc'
)

# Run `setup-mac-brew install` to install new fonts
HOMEBREW_FONTS=(
	'font-fira-code-nerd-font'
	'font-inter'
)
# HOMEBREW_UNINSTALL=()        # for casks and formulas
HOMEBREW_ENCODING_INSTALL='no'

# Golang / go
# Used by `setup-go`
GO_LINTING_INSTALL='no'
# GO_INSTALL=()

# Node.js
# Used by `setup-node`
# NPM_INSTALL=()
# NODE_VERSIONS=()

# Python
# Used by `setup-python`
# PYTHON_INSTALL=()
# PIP_INSTALL=()
# PYTHON2_PIP_INSTALL=()
# PYTHON3_PIP_INSTALL=()
# PIPX_INSTALL=()

# Ruby
# Used by `setup-ruby`
# GEM_INSTALL=()

# Rust / Cargo / Crates.io
# Used by `setup-rust`
# CARGO_INSTALL=()

# Utilities to install, these are the [setup-util-*] scripts
# Used by `setup-utils`
# You can use `setup-utils --configure` to configure these.
SETUP_UTILS=(
	'alfred'
	'appcleaner'
	'aws'
	'bash'
	'bat'
	'bottom'
	'carapace'
	'chrome'
	'circleci'
	'curl'
	'delta'
	'direnv'
	'dive'
	'docker'
	'dust'
	'firefox-dev'
	'fzf'
	'gh'
	'ghq'
	'git'
	'gpg'
	'grex'
	'heroku'
	'insomnia'
	'keka'
	'ngrok'
	'nmap'
	'nu'
	'obsidian'
	'pgadmin'
	'ripgrep'
	'starship'
	'tealdeer'
	'tree'
	'vim'
	'vscode'
	'wget'
)
