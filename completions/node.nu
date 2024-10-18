export def 'nu-complete node installed binaries' [] {
	ls node_modules/.bin/
		| get name
		| path basename
		| sort
}
