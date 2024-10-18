export def 'nu-complete node installed binaries' [] {
	ls node_modules/.bin/
		| get name
		| path basename
		| sort
}

export def 'nu-complete node scripts' [] {
	open package.json
		| get scripts
		| columns
		| sort
}
