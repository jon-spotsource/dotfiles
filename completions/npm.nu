use node.nu ['nu-complete node installed binaries', 'nu-complete node scripts']

export extern 'npm exec' [
	binary: string@'nu-complete node installed binaries'
]

export extern 'npm run' [
	script: string@'nu-complete node scripts'
]
