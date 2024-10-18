use node.nu ['nu-complete node installed binaries', 'nu-complete node scripts']

export extern 'pnpm exec' [
	binary: string@'nu-complete node installed binaries'
]

export extern 'pnpm run' [
	script: string@'nu-complete node scripts'
]
