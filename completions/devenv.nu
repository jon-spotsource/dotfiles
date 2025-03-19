def 'nu-complete devenv tasks' [] {
	[devenv.nix, devenv.local.nix]
		| each { [$env.DEVENV_ROOT, $in] | path join | open --raw }
		| lines
		| parse --regex '^\s+(?:config\.)?tasks\."(?<taskName>.*)"'
		| get taskName
		| uniq
		| sort
}

export extern 'devenv tasks run' [
	...tasks: string@'nu-complete devenv tasks'
]
