# Dorothy User Configuration

This is my user configuration for the [Dorothy](https://github.com/bevry/dorothy) dotfile ecosystem.

## Nushell Command File Structure

Example:

```nu
#!/usr/bin/env nu
# $env.DOROTHY/user/commands/git-root

export def git_root [] {
	^git rev-parse --show-toplevel | str trim
}

def main [] {
	git_root
}
```

The command's name should be in kebab/param-case. Each command's file has 3 sections, the header, the body, and the footer.

The header (`#!/usr/bin/env nu`) tells the OS what program to run the file with.

The body (`export def git_root [] { ... }`) contains the core code of the command. Its name should be in snake-case.

The footer (`def main [] { git_root }`) tells Nushell what code to execute when the command is being ran. Typically, the footer just calls the body. If another file imports this command, the footer will not run.

Here's an example of how a command would be used in another command:

```nu
#!/usr/bin/env nu
# $env.DOROTHY/user/commands.local/my-git-root
use ../commands/git-root [git_root]

export def my_git_root [] {
	$"The root of this git repo is: (git_root)"
}

def main [] {
	my_git_root
}
```
