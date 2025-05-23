def 'nu-complete ghq repos' [] {
	let $repo_names = (^ghq list | lines)
	let $repo_paths: list<path> = (^ghq list --full-path | lines)

	if ($repo_names | length) != ($repo_paths | length) {
		return []
	}

	[($repo_names | wrap value), ($repo_paths | wrap description)]
		| reduce {|it| merge $it }
}

# List local repositories
#
# List locally cloned repositories. If a query argument is given, only
# repositories whose names contain that query text are listed. '-e' ('--exact')
# forces the match to be an exact one (i.e. the query equals to project or
# user/project) If '-p' ('--full-path') is given, the full paths to the
# repository root are printed instead of relative ones.
export extern 'ghq list' [
	--bare # Query bare repositories
	--exact (-e) # Perform an exact match
	--full-path (-p) # Print full paths
	--help (-h) # Show help
	--unique # Print unique subpaths
	--vcs: string # Specify vcs backend for matching

	query?: string@'nu-complete ghq repos'
]
