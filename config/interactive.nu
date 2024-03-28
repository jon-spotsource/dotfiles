#!/usr/bin/env nu

use std

# load the dorothy defaults
source ~/.local/share/dorothy/config/interactive.nu

$env.DOROTHY_THEME = 'starship'

# Fix dorothy paths
std path add ...[
  ($env.DOROTHY | path join user/commands.local/),
  ($env.DOROTHY | path join user/commands/),
  ($env.DOROTHY | path join commands.beta/),
  ($env.DOROTHY | path join commands/),
]
