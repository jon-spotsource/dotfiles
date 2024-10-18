#!/usr/bin/env nu

overlay new user-config

use std *
use std/dirs shells-aliases *

# Config
$env.config.completions.algorithm = 'fuzzy'
$env.config.datetime_format.table = '%F %T %z' # '2024-06-07 18:15:59 -0400'
$env.config.filesize.metric = true
$env.config.footer_mode = 'always'
$env.config.highlight_resolved_externals = true
$env.config.history.file_format = 'sqlite'
$env.config.history.sync_on_enter = false
$env.config.hooks.display_output = { table }
$env.config.hooks.pre_prompt = {
  if not (
    '.envrc' | path exists
  ) or (^command-exists direnv | complete).exit_code != 0 {
    return
  }

  ^direnv export json | from json | default {} | load-env
}
$env.config.rm.always_trash = true
$env.config.show_banner = false
$env.config.table.mode = 'thin'

# Environment variables
$env.DOROTHY_THEME = 'starship'
$env.GNUPGHOME = '~/.gnupg/' | path expand
$env.INFOPATH = '/usr/local/share/info'
$env.MANPATH = '/usr/local/share/man'
$env.NOTI_DEFAULT = 'banner telegram'
$env.PNPM_HOME = '~/.local/share/pnpm' | path expand
$env.XDG_BIN_HOME = '~/.local/bin' | path expand
$env.XDG_CACHE_HOME = '~/.cache' | path expand
$env.XDG_CONFIG_HOME = '~/.config' | path expand
$env.XDG_DATA_HOME = '~/.local/share' | path expand
$env.XDG_STATE_HOME = '~/.local/state' | path expand

# Paths
path add ...[
  ~/.rbenv/shims # Must be before Homebrew ruby

  /nix/var/nix/profiles/default/bin/
  /usr/local/bin/
  /usr/local/MacGPG2/bin/ # GPG Suite
  /usr/local/opt/ruby/bin/ # Homebrew ruby
  /usr/local/sbin/
  ~/.local/bin/
  ~/.nix-profile/bin/
  ~/.rvm/bin
  $env.PNPM_HOME
]

$env.PATH = ($env.PATH | uniq) # Remove duplicates

# Commands

def 'nu-complete devenv tasks' [] {
	[devenv.nix, devenv.local.nix]
		| each { [$env.DEVENV_ROOT, $in] | path join | open --raw }
		| lines
		| parse --regex '^\s+tasks\."(?P<taskName>[\w-]+:[\w-]+)"'
		| get taskName
		| uniq
		| sort
}

extern 'devenv tasks run' [
	...tasks: string@'nu-complete devenv tasks'
]

def --wrapped nix [...rest] {
	^nix ...$rest --extra-experimental-features nix-command
}

overlay new session
