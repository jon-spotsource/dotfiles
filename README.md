# Dorothy User Configuration

This is my user configuration for the [Dorothy](https://github.com/bevry/dorothy) dotfile ecosystem.

## Setup

The default configuration of `$DOROTHY/init.nu` prevents certain Nushell
features enabled in your configs from being persisted after the login shell
starts. It needs to be updated to follow this format:

```patch
diff --git a/init.nu b/init.nu
index 8fcd433f..ec71dd16 100644
--- a/init.nu
+++ b/init.nu
@@ -7,6 +7,8 @@ $env.PATH = ($env.PATH | split row (char esep) | prepend $'($env.HOME)/.local/sh
 if $nu.is-login {
 	source ./sources/login.nu
 	if $nu.is-interactive {
-		source ./sources/interactive.nu
+		# source ./sources/interactive.nu
 	}
 }
+
+source ./sources/interactive.nu
```

Then run this command to make git think the file's unchanged:

```shell
git update-index --assume-unchanged init.nu
```

## Config File Structure
```nu
#!/usr/bin/env nu
# $DOROTHY/user/config.local/interactive.nu

# Each config file should start with a new overlay named something descriptive
# like `user-config-local` or `user-config`
overlay new user-config-local

# Then comes your config's imports, `$env` modifications, etc..

# Lastly, add your overlays for modules, module files, or module folders. These
# must exist during parse time, so if the file/folder doesn't exist, then
# you'll need to comment them out.
overlay use ../commands.local as user-commands-local
overlay use ../completions.local as user-completions-local
```

## Command File Structure

Example:

```nu
#!/usr/bin/env nu
# $env.DOROTHY/user/commands/git-root

# Any other unexported completion commands, imports, etc.. go here

# Returns root path of current git repo
export def main [] {
	^git rev-parse --show-toplevel | str trim
}
```

The command's name should be in kebab/param-case. Each command's file should
have at least 2 sections: the header and the `main` command.

The header (`#!/usr/bin/env nu`) tells the OS what program to run the file with.

The `main` command (`export def main [] { ... }`) contains the core code of the
command. It should always be exported with the name `main`. When the command's
file is called through the `$PATH`, the `main` command (exported or not) is the
entrypoint, so the code in `main` can still be executed by other shells. By
exporting the `main` command, we can also import this Nushell command in other
Nushell files, while still preserving Nushell completions.

Here's an example of how a Nushell command would be used in another
command file:

```nu
#!/usr/bin/env nu
# $env.DOROTHY/user/commands.local/my-git-root

# This imports the `main` export under the name of imported file: `git-root`
use ../commands/git-root

export def main [] {
  # When `git-root` is called, it's using the imported Nushell command. It is
  # not executing the command file through the `$PATH`.
	$'The root of this git repo is: (git-root)'
}
```
