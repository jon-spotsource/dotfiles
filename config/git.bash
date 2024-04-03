#!/usr/bin/env bash
# do not use `export` keyword in this file:
# shellcheck disable=SC2034

# load the default configuration
source "$DOROTHY/config/git.bash"

# Used by `setup-git`
# You can use `setup-git --configure` to configure these.

GIT_DEFAULT_BRANCH='main'
GIT_EMAIL='jon@spotsource.com'
GIT_NAME='Jon Penton'
GIT_PROTOCOL='ssh'
GITHUB_USERNAME='jon-spotsource'
GITLAB_USERNAME=''
GPG_SIGNING_AGENT=''
GPG_SIGNING_KEY=''
MERGE_TOOL='delta'
SSH_IDENTITY_AGENT=''
