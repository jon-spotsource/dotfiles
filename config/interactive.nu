#!/usr/bin/env nu

overlay new user-config

use std *
use std/dirs shells-aliases *
use std/formats *

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
$env.XDG_BIN_HOME = '~/.local/bin' | path expand
$env.XDG_CACHE_HOME = '~/.cache' | path expand
$env.XDG_CONFIG_HOME = '~/.config' | path expand
$env.XDG_DATA_HOME = '~/.local/share' | path expand
$env.XDG_STATE_HOME = '~/.local/state' | path expand

# Paths
path add ~/.rbenv/shims/

$env.PATH = (
	$env.PATH
		| path expand --no-symlink
		| path parse
		| path join
		| uniq # Remove duplicates
)

overlay use ../commands as user-commands
overlay use ../completions as user-completions
overlay new session
