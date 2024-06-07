#!/usr/bin/env nu

use std

# Config
$env.config.completions.algorithm = 'fuzzy'
$env.config.datetime_format.table = '%F %T %z'
$env.config.filesize.metric = true
$env.config.highlight_resolved_externals = true
$env.config.history.file_format = 'sqlite'
$env.config.history.sync_on_enter = false
$env.config.hooks.display_output = {
  with-env {
    config: (
      $env.config | upsert footer_mode (
        (term size).rows / 2.28 | math floor
      )
    )
  } { table }
}
$env.config.hooks.pre_prompt = {
  if not ('.envrc' | path exists) or (^command-exists direnv | complete).exit_code != 0 {
    return
  }

  ^direnv export json | from json | default {} | load-env
}
$env.config.rm.always_trash = true
$env.config.show_banner = false
$env.config.table.mode = 'thin'

# Environment variables
$env.DOROTHY_THEME = 'starship'

std path add /usr/local/opt/ruby/bin

# Fix dorothy paths
std path add ...[
  ($env.DOROTHY | path join user/commands.local/),
  ($env.DOROTHY | path join user/commands/),
  ($env.DOROTHY | path join commands.beta/),
  ($env.DOROTHY | path join commands/),
]

$env.PATH = ($env.PATH | uniq) # Remove duplicates
