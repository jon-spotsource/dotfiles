#!/usr/bin/env nu

use std

# load the dorothy defaults
source ~/.local/share/dorothy/config/interactive.nu

# Update config
$env.config.completions.algorithm = fuzzy
$env.config.hooks.display_output = { table }
$env.config.show_banner = false

# Environment variables
$env.DOROTHY_THEME = 'starship'

# Fix dorothy paths
std path add ...[
  ($env.DOROTHY | path join user/commands.local/),
  ($env.DOROTHY | path join user/commands/),
  ($env.DOROTHY | path join commands.beta/),
  ($env.DOROTHY | path join commands/),
]

std path add /usr/local/opt/ruby/bin

$env.PATH = ($env.PATH | uniq) # Remove duplicates
