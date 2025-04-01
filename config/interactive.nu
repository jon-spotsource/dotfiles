#!/usr/bin/env nu

overlay new user-config

use std *
use std/dirs shells-aliases *
use std/formats *

# Config
$env.config.completions.algorithm = 'fuzzy'
$env.config.cursor_shape.emacs = 'line'

# 'Thu, 20 Feb 2025 08:32:12 -0500 (now)'
$env.config.datetime_format.normal = null
$env.config.datetime_format.table = '%F %T %z' # '2024-06-07 18:15:59 -0400'
$env.config.display_errors.exit_code = true
$env.config.filesize.unit = 'metric'
$env.config.footer_mode = 'always'
$env.config.highlight_resolved_externals = true
$env.config.history.file_format = 'sqlite'
$env.config.history.sync_on_enter = false
$env.config.hooks.display_output = { table }
$env.config.hooks.pre_prompt = [
	{
		if not (
			'.envrc' | path exists
		) or (^command-exists direnv | complete).exit_code != 0 {
			return
		}

		^direnv export json | from json | default {} | load-env
	}
]
$env.config.rm.always_trash = true
$env.config.show_banner = false
$env.config.table.mode = 'thin'
$env.config.use_ansi_coloring = 'auto'

# Environment variables
$env.DOROTHY_THEME = 'starship'
$env.GNUPGHOME = '~/.gnupg/' | path expand
$env.INFOPATH = '/usr/local/share/info'
$env.MANPATH = '/usr/local/share/man'
$env.NOTI_DEFAULT = 'banner telegram'
$env.SHELL = 'nu'
$env.XDG_BIN_HOME = '~/.local/bin' | path expand
$env.XDG_CACHE_HOME = '~/.cache' | path expand
$env.XDG_CONFIG_HOME = '~/.config' | path expand
$env.XDG_DATA_HOME = '~/.local/share' | path expand
$env.XDG_STATE_HOME = '~/.local/state' | path expand

log set-level 10 # DEBUG

# Paths
path add ~/.rbenv/shims/

# $env.PATH = (
# 	$env.PATH
# 		| path expand --no-symlink
# 		| path parse
# 		| path join
# 		| where ($it not-in [
# 				/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin,
# 				/Library/Developer/CommandLineTools/usr/bin,
# 			])
# 		| uniq # Remove duplicates
# )
$env.PATH = (
	$env.PATH
		| path expand --no-symlink
		| path parse
		| path join
		| uniq # Remove duplicates
)

plugin add ~/.cargo/bin/nu_plugin_compress
plugin add ~/.cargo/bin/nu_plugin_port_list
plugin add ~/.cargo/bin/nu_plugin_query
plugin add ~/.cargo/bin/nu_plugin_regex
# plugin add ~/.cargo/bin/nu_plugin_units

overlay use ../commands as user-commands
overlay use ../completions as user-completions
overlay new session
