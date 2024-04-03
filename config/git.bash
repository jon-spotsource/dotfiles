#!/usr/bin/env bash
# do not use `export` keyword in this file:
# shellcheck disable=SC2034

# load the default configuration
source "$DOROTHY/config/git.bash"

# Used by `setup-git`
# You can use `setup-git --configure` to configure these.

GPG_SIGNING_KEY=''
GIT_DEFAULT_BRANCH='main'
GIT_PROTOCOL='ssh'
GIT_NAME='Jon Penton'
GIT_EMAIL='jon@spotsource.com'
MERGE_TOOL='delta'
GITHUB_USERNAME='jon-spotsource'
GITLAB_USERNAME=''
SSH_IDENTITY_AGENT=''
GPG_SIGNING_AGENT=''
