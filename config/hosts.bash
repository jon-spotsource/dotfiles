#!/usr/bin/env bash
# do not use `export` keyword in this file:
# shellcheck disable=SC2034

# load the default configuration
source "$DOROTHY/config/hosts.bash"

# For details about hosts files, check out these resources:
# https://en.wikipedia.org/wiki/Hosts_(file)
#
# For selections of hosts files, check out these resources:
# https://github.com/StevenBlack/hosts
#
# And here are references for posterity that are inferior to the above:
# https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt

# Used by `setup-hosts` to select one of these as your preference
# Label first, then url
# OPTIONS=(
# 	'Unified hosts + fakenews + gambling + porn + social' # =>
# 	'https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts'
# )

# If we have a preference, we can set CHOICE to the URL value of our desired hosts file
CHOICE='https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts'
