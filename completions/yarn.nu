use node.nu ['nu-complete node installed binaries', 'nu-complete node scripts']

export extern 'yarn exec' [
	binary: string@'nu-complete node installed binaries'
]

export extern 'yarn run' [
	script: string@'nu-complete node scripts'
]
