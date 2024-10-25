use ../commands [git-root]
use node.nu ['nu-complete node installed binaries', 'nu-complete node scripts']

def 'nu-complete rush projects' [] {
	mut $directory_path: path = pwd

	loop {
		let $rush_config_path = $directory_path | path join rush.json

		if ($rush_config_path | path exists) {
			return (
				open $rush_config_path
					| get projects
					| sort-by packageName
					| rename value description
					| update description { $'Directory: ($in)' }
			)
		}

		if $directory_path == (git-root) {
			return
		}

		$directory_path = $directory_path | path dirname
	}
}

export extern 'rush build' [
	--to: string@'nu-complete rush projects'
]

export extern 'rush deploy' [
	--project (-p): string@'nu-complete rush projects'
]

export extern rushx [
	script: string@'nu-complete node scripts'
]

export extern 'rush-pnpm exec' [
	binary: string@'nu-complete node installed binaries'
]
